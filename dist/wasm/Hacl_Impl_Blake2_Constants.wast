(module
  (type $0 (func))
  (type $1 (func (param i32) (result i32)))
  (type $2 (func (param i32) (result i32)))
  (type $3 (func (param i32) (result i32)))
  (type $4 (func (param i32) (result i32)))
  (type $5 (func (param i64) (result i64)))
  (type $6 (func (param i32 i32 i32) (result i32)))
  (type $7 (func (param i32) (result i32)))
  (type $8 (func (param i32) (result i32)))
  (type $9 (func (param i32) (result i32)))
  (type $10 (func (param i32) (result i32)))
  (type $11 (func (param i32) (result i32)))
  (type $12 (func))
  (import "Kremlin" "mem" (memory $0 16))
  (import "Kremlin" "data_start" (global $0 i32))
  (import "FStar" "FStar_UInt128_u32_64" (global $1 i32))
  (import "FStar" "FStar_UInt128_u32_32" (global $2 i32))
  (import "Kremlin" "debug" (func $0 (type 0)))
  (import "WasmSupport" "WasmSupport_trap" (func $1 (type 1)))
  (import "WasmSupport" "WasmSupport_align_64" (func $2 (type 2)))
  (import "WasmSupport" "WasmSupport_check_buffer_size" (func $3 (type 3)))
  (import "WasmSupport" "WasmSupport_betole32" (func $4 (type 4)))
  (import "WasmSupport" "WasmSupport_betole64" (func $5 (type 5)))
  (import "WasmSupport" "WasmSupport_memzero" (func $6 (type 6)))
  (global $3 (mut i32) (i32.const 0))
  (global $4 (mut i32) (i32.const 0))
  (global $5 (mut i32) (i32.const 0))
  (global $6 (mut i32) (i32.const 0))
  (global $7 (mut i32) (i32.const 0))
  (global $8 i32 (i32.const 773))
  (func $7
    (type 7)
    (local i64 i64 i32 i32)
    (i32.const 0)
    (i32.load align=1)
    (get_global 3)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.const 0)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.store align=1)
  )
  (func $8
    (type 8)
    (local i64 i64 i32 i32)
    (i32.const 0)
    (i32.load align=1)
    (get_global 4)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.const 0)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.store align=1)
  )
  (func $9
    (type 9)
    (local i64 i64 i32 i32)
    (i32.const 0)
    (i32.load align=1)
    (get_global 5)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.const 0)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.store align=1)
  )
  (func $10
    (type 10)
    (local i64 i64 i32 i32)
    (i32.const 0)
    (i32.load align=1)
    (get_global 6)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.const 0)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.store align=1)
  )
  (func $11
    (type 11)
    (local i64 i64 i32 i32)
    (i32.const 0)
    (i32.load align=1)
    (get_global 7)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.const 0)
    (set_local 3)
    (set_local 4)
    (get_local 3)
    (get_local 4)
    (i32.store align=1)
  )
  (func $12
    (type 12)
    (get_global 0)
    (i32.const 0)
    (i32.add)
    (set_global 3)
    (get_global 0)
    (i32.const 641)
    (i32.add)
    (set_global 4)
    (get_global 0)
    (i32.const 674)
    (i32.add)
    (set_global 5)
    (get_global 0)
    (i32.const 739)
    (i32.add)
    (set_global 6)
    (get_global 0)
    (i32.const 756)
    (i32.add)
    (set_global 7)
  )
  (export "Hacl_Impl_Blake2_Constants___get_sigmaTable" (func 7))
  (export "Hacl_Impl_Blake2_Constants___get_ivTable_S" (func 8))
  (export "Hacl_Impl_Blake2_Constants___get_ivTable_B" (func 9))
  (export "Hacl_Impl_Blake2_Constants___get_rTable_S" (func 10))
  (export "Hacl_Impl_Blake2_Constants___get_rTable_B" (func 11))
  (export "data_size" (global 8))
  (start 12)
  (data
    0
    (offset (get_global 0))
    "\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00"
    "\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00"
    "\08\00\00\00\09\00\00\00\0a\00\00\00\0b\00\00\00"
    "\0c\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00"
    "\0e\00\00\00\0a\00\00\00\04\00\00\00\08\00\00\00"
    "\09\00\00\00\0f\00\00\00\0d\00\00\00\06\00\00\00"
    "\01\00\00\00\0c\00\00\00\00\00\00\00\02\00\00\00"
    "\0b\00\00\00\07\00\00\00\05\00\00\00\03\00\00\00"
    "\0b\00\00\00\08\00\00\00\0c\00\00\00\00\00\00\00"
    "\05\00\00\00\02\00\00\00\0f\00\00\00\0d\00\00\00"
    "\0a\00\00\00\0e\00\00\00\03\00\00\00\06\00\00\00"
    "\07\00\00\00\01\00\00\00\09\00\00\00\04\00\00\00"
    "\07\00\00\00\09\00\00\00\03\00\00\00\01\00\00\00"
    "\0d\00\00\00\0c\00\00\00\0b\00\00\00\0e\00\00\00"
    "\02\00\00\00\06\00\00\00\05\00\00\00\0a\00\00\00"
    "\04\00\00\00\00\00\00\00\0f\00\00\00\08\00\00\00"
    "\09\00\00\00\00\00\00\00\05\00\00\00\07\00\00\00"
    "\02\00\00\00\04\00\00\00\0a\00\00\00\0f\00\00\00"
    "\0e\00\00\00\01\00\00\00\0b\00\00\00\0c\00\00\00"
    "\06\00\00\00\08\00\00\00\03\00\00\00\0d\00\00\00"
    "\02\00\00\00\0c\00\00\00\06\00\00\00\0a\00\00\00"
    "\00\00\00\00\0b\00\00\00\08\00\00\00\03\00\00\00"
    "\04\00\00\00\0d\00\00\00\07\00\00\00\05\00\00\00"
    "\0f\00\00\00\0e\00\00\00\01\00\00\00\09\00\00\00"
    "\0c\00\00\00\05\00\00\00\01\00\00\00\0f\00\00\00"
    "\0e\00\00\00\0d\00\00\00\04\00\00\00\0a\00\00\00"
    "\00\00\00\00\07\00\00\00\06\00\00\00\03\00\00\00"
    "\09\00\00\00\02\00\00\00\08\00\00\00\0b\00\00\00"
    "\0d\00\00\00\0b\00\00\00\07\00\00\00\0e\00\00\00"
    "\0c\00\00\00\01\00\00\00\03\00\00\00\09\00\00\00"
    "\05\00\00\00\00\00\00\00\0f\00\00\00\04\00\00\00"
    "\08\00\00\00\06\00\00\00\02\00\00\00\0a\00\00\00"
    "\06\00\00\00\0f\00\00\00\0e\00\00\00\09\00\00\00"
    "\0b\00\00\00\03\00\00\00\00\00\00\00\08\00\00\00"
    "\0c\00\00\00\02\00\00\00\0d\00\00\00\07\00\00\00"
    "\01\00\00\00\04\00\00\00\0a\00\00\00\05\00\00\00"
    "\0a\00\00\00\02\00\00\00\08\00\00\00\04\00\00\00"
    "\07\00\00\00\06\00\00\00\01\00\00\00\05\00\00\00"
    "\0f\00\00\00\0b\00\00\00\09\00\00\00\0e\00\00\00"
    "\03\00\00\00\0c\00\00\00\0d\00\00\00\00\00\00\00"
    "\00\67\e6\09\6a\85\ae\67\bb\72\f3\6e\3c\3a\f5\4f"
    "\a5\7f\52\0e\51\8c\68\05\9b\ab\d9\83\1f\19\cd\e0"
    "\5b\00\08\c9\bc\f3\67\e6\09\6a\3b\a7\ca\84\85\ae"
    "\67\bb\2b\f8\94\fe\72\f3\6e\3c\f1\36\1d\5f\3a\f5"
    "\4f\a5\d1\82\e6\ad\7f\52\0e\51\1f\6c\3e\2b\8c\68"
    "\05\9b\6b\bd\41\fb\ab\d9\83\1f\79\21\7e\13\19\cd"
    "\e0\5b\00\10\00\00\00\0c\00\00\00\08\00\00\00\07"
    "\00\00\00\00\20\00\00\00\18\00\00\00\10\00\00\00"
    "\3f\00\00\00\00"
  )
)
