// ICU FFI to growler/k

#include "unicode/ustring.h"
#include"../../k.h"

K Fup(K x){
  K r=KC(0,256);UChar bi[256],bo[256];N l=NK(r);
  UErrorCode e=U_ZERO_ERROR;
  u_strFromUTF8(bi,sizeof(bi)/sizeof(bi[0]),0,(S)x,NK(x),&e);
  if(U_FAILURE(e)) {*(C*)r=0; return r;}
  N sz=u_strToUpper(bo,sizeof(bo)/sizeof(bo[0]),bi,NK(x),0,&e);
  if(sz>l||U_FAILURE(e)){*(C*)r=0; return r;}
  u_strToUTF8((C*)r,NK(r),0,bo,sz,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,sz);
}

K Flow(K x){
  K r=KC(0,256);UChar bi[256],bo[256];N l=NK(r);
  UErrorCode e=U_ZERO_ERROR;
  u_strFromUTF8(bi,sizeof(bi)/sizeof(bi[0]),0,(S)x,NK(x),&e);
  if(U_FAILURE(e)) {*(C*)r=0; return r;}
  N sz=u_strToLower(bo,sizeof(bo)/sizeof(bo[0]),bi,NK(x),0,&e);
  if(sz>l||U_FAILURE(e)){*(C*)r=0; return r;}
  u_strToUTF8((C*)r,NK(r),0,bo,sz,&e);
  if(U_FAILURE(e)) {*(C*)r=0;}
  return KN(r,sz);
}

__attribute__((constructor)) void loadicu(K);
void loadicu(K k) {
  kinit();
 KR("icuup", (void*)Fup, 1);
 KR("iculow", (void*)Flow, 1);
}
