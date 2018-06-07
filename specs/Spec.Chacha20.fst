module Spec.Chacha20

open FStar.Mul
open Lib.IntTypes
open Lib.Sequence
open Lib.ByteSequence

#set-options "--max_fuel 0 --z3rlimit 100"

(* Constants *)
let keylen = 32   (* in bytes *)
let blocklen = 64 (* in bytes *)
let noncelen = 12 (* in bytes *)

type key = lbytes keylen
type block = lbytes blocklen
type nonce = lbytes noncelen
type counter = size_nat
type subblock = b:bytes{length b <= blocklen}

// Internally, blocks are represented as 16 x 4-byte integers
type state = m:intseq U32 16
type idx = n:size_nat{n < 16}
type shuffle = state -> Tot state

// Using @ as a functional substitute for ;
let op_At f g = fun x -> g (f x)

let line (a:idx) (b:idx) (d:idx) (s:rotval U32) (m:state) : Tot state =
  let m = m.[a] <- (m.[a] +. m.[b]) in
  let m = m.[d] <- ((m.[d] ^. m.[a]) <<<. s) in m

let quarter_round a b c d : shuffle =
  line a b d (u32 16) @
  line c d b (u32 12) @
  line a b d (u32 8)  @
  line c d b (u32 7)

let column_round : shuffle =
  quarter_round 0 4 8  12 @
  quarter_round 1 5 9  13 @
  quarter_round 2 6 10 14 @
  quarter_round 3 7 11 15

let diagonal_round : shuffle =
  quarter_round 0 5 10 15 @
  quarter_round 1 6 11 12 @
  quarter_round 2 7 8  13 @
  quarter_round 3 4 9  14

let double_round : shuffle =
  column_round @ diagonal_round (* 2 rounds *)

let rounds : shuffle =
  repeat 10 double_round (* 20 rounds *)

let chacha20_core (s:state) : Tot state =
  let k = rounds s in
  map2 (+.) k s

(* state initialization *)
inline_for_extraction
let c0 = 0x61707865
inline_for_extraction
let c1 = 0x3320646e
inline_for_extraction
let c2 = 0x79622d32
inline_for_extraction
let c3 = 0x6b206574

let setup (k:key) (n:nonce) (st:state) : Tot state =
  let st = st.[0] <- u32 c0 in
  let st = st.[1] <- u32 c1 in
  let st = st.[2] <- u32 c2 in
  let st = st.[3] <- u32 c3 in
  let st = update_sub st 4 8 (uints_from_bytes_le k) in
  let st = update_sub st 13 3 (uints_from_bytes_le n) in
  st

let chacha20_init (k:key) (n:nonce) : Tot state =
  let st = create 16 (u32 0) in
  let st  = setup k n st in
  st

let chacha20_set_counter (st:state) (c:counter) : Tot state =
  st.[12] <- (u32 c)

let chacha20_key_block (st:state) : Tot block =
  let st' = chacha20_core st in
  uints_to_bytes_le st'

let chacha20_key_block0 (k:key) (n:nonce) : Tot block =
  let st = chacha20_init k n in
  chacha20_key_block st

let chacha20_encrypt_block (st0:state) (ctr0:counter) (incr:counter{ctr0 + incr <= max_size_t}) (b:block) : Tot block =
  let st = chacha20_set_counter st0 (ctr0 + incr) in
  let kb = chacha20_key_block st in
  map2 (^.) b kb

let chacha20_encrypt_last (st0:state) (ctr0:counter) (incr:counter{ctr0 + incr <= max_size_t}) (len:size_nat{len < blocklen}) (b:lbytes len) : lbytes len  =
  let plain = create blocklen (u8 0) in
  let plain = update_slice plain 0 len b in
  let cipher = chacha20_encrypt_block st0 ctr0 incr plain in
  slice cipher 0 len

val chacha20_encrypt_bytes:
  key -> nonce -> c:counter -> len:size_nat{c + len <= maxint SIZE} ->
  msg:lseq uint8 len -> cipher:lseq uint8 len
let chacha20_encrypt_bytes key nonce counter len msg =
  let cipher = msg in
  let st0 = chacha20_init key nonce in
  let nblocks = len / blocklen in
  let rem = len % blocklen in
  let bs = map_blocks #uint8 blocklen nblocks
	   (chacha20_encrypt_block st0 counter)
	   (sub cipher 0 (nblocks * blocklen)) in
  let cipher = update_sub cipher 0 (nblocks * blocklen) bs in
  let l = chacha20_encrypt_last st0 counter nblocks rem
	   (sub cipher (nblocks * blocklen) rem) in
  update_sub cipher (nblocks * blocklen) rem l
