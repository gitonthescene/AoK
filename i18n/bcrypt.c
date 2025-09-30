#include "bcrypt.h"
#include "unistd.h"
#include "string.h"
#include "../../k.h"

// [[https://github.com/rg3/libbcrypt]]

typedef struct __attribute__((packed)) {
  char     type;
  uint32_t len;
} hdr;

typedef struct __attribute__((packed)) {
  hdr      hdr;
  void*    arr;
} arr;

#define REF (1<<7)
#define ART(a) ((unsigned char)(a).hdr.type&~REF)

K Fbchash(K x){
    C* s=(C*)x;
	K r=KC(0,BCRYPT_HASHSIZE);
	if (s[0]!=1){/* panic */}s+=1; // expect version 1
	if (s[0]!=1){/* panic */} // expect mixed array
    hdr pr=*(hdr*)s;if (pr.len!=2){/*panic*/};s+=sizeof(hdr);
	if (9!=((unsigned char)(s[0]&~REF))){/* panic */} // expect char array
    arr *salt=0,*pass=(arr*)s;s+=sizeof(arr);
	char slt[BCRYPT_HASHSIZE];
	if (9==((unsigned char)(s[0]&~REF))) {
	  salt=(arr*)s;
	  unref(x);
	  memset(slt,0,sizeof(slt));
	  memcpy(slt,salt[0].arr,salt[0].hdr.len);slt[salt[0].hdr.len]=0;
	  char b[pass[0].hdr.len+1];memcpy(b,pass[0].arr,pass[0].hdr.len);b[pass[0].hdr.len]=0;
	  bcrypt_hashpw(b, slt, (C*)r);
	  return KN(r,60);
	}
	else if(s[0]!=13) { /*panic*/ };s+=1; // if not salt expect size
	I k=*(I*)s;
	bcrypt_gensalt(k,slt);
	unref(x);
	bcrypt_hashpw((S)pass[0].arr, slt, (C*)r);
	return KN(r,60);
}

__attribute__((constructor)) void loadbcrypt(K);
void loadbcrypt(K k) {
  kinit();
 KR("bcrypthash", (void*)Fbchash, 1);
}
