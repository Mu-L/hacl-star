/*
 *  Benchmark demonstration program
 *
 *  Copyright (C) 2006-2016, ARM Limited, All Rights Reserved
 *  SPDX-License-Identifier: Apache-2.0
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may
 *  not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *  This file is part of mbed TLS (https://tls.mbed.org)
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

#include "timing.h"
#include "EverCrypt.h"

#define HEADER_FORMAT   "  %-24s :  "

#define TIME_AND_TSC( TITLE, BUFSIZE, CODE )                            \
do {                                                                    \
    unsigned long ii, jj, tsc;                                          \
                                                                        \
    printf( HEADER_FORMAT, TITLE );                                     \
    fflush( stdout );                                                   \
                                                                        \
    set_alarm( 1 );                                                     \
    for( ii = 1; ! timing_alarmed; ii++ )                               \
    {                                                                   \
        CODE;                                                           \
    }                                                                   \
                                                                        \
    tsc = timing_hardclock();                                           \
    for( jj = 0; jj < 1024; jj++ )                                      \
    {                                                                   \
        CODE;                                                           \
    }                                                                   \
                                                                        \
    printf( "%9lu KiB/s,  %9lu cycles/byte\n",                          \
                     ii * BUFSIZE / 1024,                               \
                     ( timing_hardclock() - tsc ) / ( jj * BUFSIZE ) ); \
} while( 0 )

#define TIME_PUBLIC( TITLE, TYPE, CODE )                                \
do {                                                                    \
    unsigned long ii, tsc;                                              \
    int ret;                                                            \
                                                                        \
    printf( HEADER_FORMAT, TITLE );                                     \
    fflush( stdout );                                                   \
    set_alarm( 3 );                                                     \
    tsc = timing_hardclock();                                           \
                                                                        \
    ret = 0;                                                            \
    for( ii = 1; ! timing_alarmed && ! ret ; ii++ )                     \
    {                                                                   \
        CODE;                                                           \
    }                                                                   \
                                                                        \
    if( ret != 0 )                                                      \
    {                                                                   \
        PRINT_ERROR;                                                    \
    }                                                                   \
    else                                                                \
    {                                                                   \
        printf( "%6lu " TYPE "/s (%9lu cycles/" TYPE ")\n", ii/3,       \
			      (timing_hardclock() - tsc) / ii );        \
    }                                                                   \
} while( 0 )

typedef void (*aead_enc)(uint8_t *key, uint8_t *iv, uint8_t *ad, uint32_t adlen, uint8_t *plain, uint32_t len, uint8_t *cipher, uint8_t *tag);
typedef uint32_t (*aead_dec)(uint8_t *key, uint8_t *iv, uint8_t *ad, uint32_t adlen, uint8_t *plain, uint32_t len, uint8_t *cipher, uint8_t *tag);

void bench_aead(aead_enc enc, aead_dec dec, const unsigned char *alg, size_t plain_len)
{
  unsigned char tag[16], key[32], iv[12];
  unsigned char *plain = malloc(65536);
  unsigned char *cipher = malloc(65536);
  char title[128];
  sprintf(title, "ENC %s[%5d]", alg, plain_len);

  TIME_AND_TSC(title, plain_len,
    enc(key, iv, "", 0, plain, plain_len, cipher, tag);
  );

  /*
  sprintf(title, "DEC %s[%5d]", alg, plain_len);

  TIME_AND_TSC(title, plain_len,
    dec(key, iv, "", 0, plain, plain_len, cipher, tag);
  );
  */

  free(plain);
  free(cipher);
}

int main(int argc, char **argv)
{
  size_t i;

  for(i=4; i<=65536; i<<=1)
    bench_aead(EverCrypt_aes128_gcm_encrypt, EverCrypt_aes128_gcm_decrypt, "AES128-GCM", i);

  for(i=4; i<=65536; i<<=1)
    bench_aead(EverCrypt_aes256_gcm_encrypt, EverCrypt_aes256_gcm_decrypt, "AES256-GCM", i);

  for(i=4; i<=65536; i<<=1)
    bench_aead(EverCrypt_chacha20_poly1305_encrypt, EverCrypt_chacha20_poly1305_decrypt, "CHA20-P1305", i);

  return 0;
}

