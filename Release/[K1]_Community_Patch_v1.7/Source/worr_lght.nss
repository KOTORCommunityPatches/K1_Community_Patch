#include "k_inc_utility"

void main(){
    if(!GetLocalBoolean(OBJECT_SELF, 35)) {
      UT_LightSml(GetPCSpeaker());
      SetLocalBoolean(OBJECT_SELF, 35, 1);
    }
}