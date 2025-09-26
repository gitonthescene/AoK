// ICU FFI to growler/k

#include "unicode/ustring.h"
#include"../../k.h"

K Fup(K x){
  N l=NK(x);C b[l+1];CK(b,x);b[l]=0;
  K r=KC(0,4*l);UChar bi[4*(1+l)],bo[4*(1+l)];
  UErrorCode e=U_ZERO_ERROR;
  u_strFromUTF8(bi,sizeof(bi)/sizeof(bi[0]),0,b,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0; return r;}
  I so;N sz=u_strToUpper(bo,sizeof(bo)/sizeof(bo[0]),bi,l,0,&e);
  if(U_FAILURE(e)){*(C*)r=0; return r;}
  u_strToUTF8((C*)r,NK(r),&so,bo,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,so);
}

K Flow(K x){
  N l=NK(x);C b[l+1];CK(b,x);b[l]=0;
  K r=KC(0,4*l);UChar bi[4*(1+l)],bo[4*(1+l)];
  UErrorCode e=U_ZERO_ERROR;
  u_strFromUTF8(bi,sizeof(bi)/sizeof(bi[0]),0,b,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0; return r;}
  I so;N sz=u_strToLower(bo,sizeof(bo)/sizeof(bo[0]),bi,l,0,&e);
  if(U_FAILURE(e)){*(C*)r=0; return r;}
  u_strToUTF8((C*)r,NK(r),&so,bo,-1,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,so);
}

__attribute__((constructor)) void loadicu(K);
void loadicu(K k) {
  kinit();
 KR("icuup", (void*)Fup, 1);
 KR("iculow", (void*)Flow, 1);
}
