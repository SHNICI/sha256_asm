#ifndef _SHA256_H_
#define _SHA256_H_


#include <stdint.h>

#define STATE_LEN 8
#define BLOCK_LEN 64


static int sha256_self_check(void);
void sha256_hash_message(const uint8_t message[], size_t len, uint32_t hash[static STATE_LEN]);
extern void sha256_compress(uint32_t state[static STATE_LEN], const uint8_t block[static BLOCK_LEN]);



#endif