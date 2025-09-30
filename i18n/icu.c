// ICU FFI to growler/k

#include "unicode/ustring.h"
#include "unicode/utrans.h"
#include "../../k.h"
#include "stdio.h"
#define MAX(x,y) ({typeof(x) x_=(x),y_=(y);x_>y_?x_:y_;})

V UK(K x,UChar* b,N n,I* s,UErrorCode* e){
  N l=NK(x);C bc[l+1];CK(bc,x);bc[l]=0;
  u_strFromUTF8(b,n,s,bc,-1,e);
  if(U_FAILURE(*e)){
    printf("no go: %s\n",bc);
  }
}

// [[https://unicode-org.github.io/icu/userguide/transforms/general/][Transforms]]
// [[https://begriffs.com/posts/2019-05-23-unicode-icu.html]]

K Ftrns(K x,K y){
  UErrorCode e=U_ZERO_ERROR;UParseError pe;
  N l=MAX(NK(x),NK(y));K r=KC(0,2*l);UChar b[l+1];I s;
  UK(x,b,l+1,&s,&e);
  UTransliterator* t=utrans_openU(b,-1,UTRANS_FORWARD,0,0,&pe,&e);
  if(!t){*(C*)r=0; return r;}
  UK(y,b,l+1,&s,&e);
  if(U_FAILURE(e)){utrans_close(t); *(C*)r=0; return r;}
  I til=s;
  // Assume one shot
  utrans_transUChars(t,b,0,l+1,0,&til,&e);
  utrans_close(t);
  if(U_FAILURE(e)){*(C*)r=0; return r;}
  I so;u_strToUTF8((C*)r,NK(r),&so,b,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,so);
}

K Fup(K x){
  N l=NK(x);UErrorCode e=U_ZERO_ERROR;
  K r=KC(0,l+1);UChar bi[1+l],bo[1+l];I s;
  UK(x,bi,l+1,&s,&e);
  if(U_FAILURE(e)) {*(C*)r=0; return r;}
  u_strToUpper(bo,l+1,bi,l,0,&e);
  if(U_FAILURE(e)){*(C*)r=0; return r;}
  u_strToUTF8((C*)r,NK(r),&s,bo,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,s);
}

K Flow(K x){
  N l=NK(x);UErrorCode e=U_ZERO_ERROR;
  K r=KC(0,l+1);UChar bi[1+l],bo[1+l];I s;
  UK(x,bi,l+1,&s,&e);
  if(U_FAILURE(e)) {*(C*)r=0; return r;}
  u_strToLower(bo,l+1,bi,l,0,&e);
  if(U_FAILURE(e)){*(C*)r=0; return r;}
  u_strToUTF8((C*)r,NK(r),&s,bo,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,s);
}

__attribute__((constructor)) void loadicu(K);
void loadicu(K k) {
  kinit();
 KR("icuup", (void*)Fup, 1);
 KR("iculow", (void*)Flow, 1);
 KR("icutrans", (void*)Ftrns, 2);
}
