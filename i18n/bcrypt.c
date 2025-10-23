#include "bcrypt.h"
#include "unistd.h"
#include "string.h"
#include "k.h"

// [[https://github.com/rg3/libbcrypt]]

typedef struct __attribute__((packed)) {
  char     type;
  uint32_t len;
} hdr;

typedef struct __attribute__((packed)) {
  hdr      hdr;
  void*    arr;
} arr;

#define SZ(a) sizeof(a)
#define L(x) (SZ(x)/SZ((x)[0]))
typedef long long L;

#define REF (1<<7)
#define ART(a) ((unsigned char)(a).type&~REF)

#define HDR(a,t,l) (a).type=(t); (a).len=(l);
#define ARR(a,t,l,r,v) HDR((a).hdr,t|((char)(REF*r)),l) (a).arr=((V*)(v));

typedef struct __attribute__((packed)) {
  hdr     pair;
  C       etype;
  L       ecode;
  arr     str;
} bcret;

typedef struct __attribute__((packed)) {
  hdr     pair;
  arr     inp;
  C       type;
} bchshinp;

#define BCERR(c,a...) {a;ret->str.hdr.len=0; ret->ecode=(c);return unpack(rbuf,L(rbuf));}

K Fbchash(K x){
  C rbuf[1+SZ(bcret)];rbuf[0]=1;bcret* ret=(bcret*)(rbuf+1); K r=KC(0,BCRYPT_HASHSIZE);
  HDR(ret->pair,1,2)ARR((ret->str),9,60,1,r);ret->etype=13;ret->ecode=0;

  if (((C*)x)[0] != 1 || NK(x)<SZ(bchshinp)) BCERR(-1,unref(x));
  bchshinp inp=*(bchshinp*)(x+1);
  if(inp.pair.type != 1 || inp.pair.len != 2 || ART(inp.inp.hdr) != 9) BCERR(-2,unref(x));

  V* rest=(V*)(((C*)x)+SZ(bchshinp)); arr pass=inp.inp;
  char slt[BCRYPT_HASHSIZE];
  if (ART(inp)==9) {
	arr salt=*(arr*)rest;
	memset(slt,0,sizeof(slt));
	memcpy(slt,salt.arr,salt.hdr.len);slt[salt.hdr.len]=0;
	char b[pass.hdr.len+1];memcpy(b,pass.arr,pass.hdr.len);b[pass.hdr.len]=0;
	bcrypt_hashpw(b, slt, (C*)r);
	unref(x);
	return unpack(rbuf,L(rbuf));
  }
  else if(inp.type!=13) BCERR(-3,unref(x))
  I k=*(I*)((char*)rest)+1;
  bcrypt_gensalt(k,slt);
  unref(x);
  bcrypt_hashpw((S)pass.arr, slt, (C*)r);
  return unpack(rbuf,L(rbuf));
}

__attribute__((constructor)) void loadbcrypt(K);
void loadbcrypt(K k) {
  kinit();
 KR("bcrypthash", (void*)Fbchash, 1);
}
