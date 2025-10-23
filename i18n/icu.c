// ICU FFI to growler/k

#include "unicode/ustring.h"
#include "unicode/utrans.h"
#include "k.h"
#include "stdio.h"
#define MAX(x,y) ({typeof(x) x_=(x),y_=(y);x_>y_?x_:y_;})
#define SZ(a) sizeof(a)
#define L(x) (SZ(x)/SZ((x)[0]))
typedef long long L;
typedef struct __attribute__((packed)) {
  char     type;
  uint32_t len;
} hdr;

typedef struct __attribute__((packed)) {
  hdr      hdr;
  void*    arr;
} arr;

#define REF ((char)(1<<7))
#define ART(a) ((unsigned char)(a).hdr.type&~REF)

V UK(K x,UChar* b,N n,I* s,UErrorCode* e){
  N l=NK(x);C bc[l+1];CK(bc,x);bc[l]=0;
  u_strFromUTF8(b,n,s,bc,-1,e);
  if(U_FAILURE(*e)){
    printf("no go: %s\n",bc);
  }
}

typedef struct __attribute__((packed)) {
  hdr     pair;
  C       etype;
  L       ecode;
  arr     str;
} icuret;

#define HDR(a,t,l) (a).type=(t); (a).len=(l);
#define ARR(a,t,l,r,v) HDR((a).hdr,t|((char)(REF*r)),l) (a).arr=((V*)(v));

// [[https://unicode-org.github.io/icu/userguide/collation/examples.html]]

// [[https://unicode-org.github.io/icu/userguide/transforms/general/][Transforms]]
// [[https://begriffs.com/posts/2019-05-23-unicode-icu.html]]

K Ftrns(K x,K y){
  UErrorCode e=U_ZERO_ERROR;UParseError pe;
  N l=MAX(NK(x),NK(y));K r=KC(0,2*l);UChar b[l+1];I s;
  C rbuf[1+SZ(icuret)];rbuf[0]=1;icuret* ret=(icuret*)(rbuf+1);
  HDR(ret->pair,1,2)ARR((ret->str),9,l,1,r);ret->etype=13;
  UK(x,b,l+1,&s,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  UTransliterator* t=utrans_openU(b,-1,UTRANS_FORWARD,0,0,&pe,&e);
  if(!t) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  UK(y,b,l+1,&s,&e);
  if(U_FAILURE(e)) {utrans_close(t);ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  I til=s;
  // Assume one shot
  utrans_transUChars(t,b,0,l+1,0,&til,&e);
  utrans_close(t);
  if(U_FAILURE(e)) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  I so;u_strToUTF8((C*)r,NK(r),&so,b,-1,&e);
  if(U_FAILURE(e)) so = 0;
  ret->str.hdr.len=so;
  ret->ecode=e;
  return unpack(rbuf,L(rbuf));
}

K Fup(K x){
  N l=NK(x);UErrorCode e=U_ZERO_ERROR; K r=KC(0,l+1);
  C rbuf[1+SZ(icuret)];rbuf[0]=1;icuret* ret=(icuret*)(rbuf+1);
  HDR(ret->pair,1,2)ARR((ret->str),9,l,1,r)ret->etype=13;
  UChar bi[1+l],bo[1+l];I s;
  UK(x,bi,l+1,&s,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  u_strToUpper(bo,l+1,bi,l,0,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  u_strToUTF8((C*)r,l+1,&s,bo,-1,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0;}
  ret->ecode=e; return unpack(rbuf,L(rbuf));
}

K Flow(K x){
  N l=NK(x);UErrorCode e=U_ZERO_ERROR; K r=KC(0,l+1);
  C rbuf[1+SZ(icuret)];rbuf[0]=1;icuret* ret=(icuret*)(rbuf+1);
  HDR(ret->pair,1,2)ARR((ret->str),9,l,1,r)ret->etype=13;
  UChar bi[1+l],bo[1+l];I s;
  UK(x,bi,l+1,&s,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  u_strToLower(bo,l+1,bi,l,0,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0; ret->ecode=e; return unpack(rbuf,L(rbuf));}
  u_strToUTF8((C*)r,l+1,&s,bo,-1,&e);
  if(U_FAILURE(e)) {ret->str.hdr.len=0;}
  ret->ecode=e; return unpack(rbuf,L(rbuf));
}

__attribute__((constructor)) void loadicu(K);
void loadicu(K k) {
  kinit();
 KR("icuup", (void*)Fup, 1);
 KR("iculow", (void*)Flow, 1);
 KR("icutrans", (void*)Ftrns, 2);
}
