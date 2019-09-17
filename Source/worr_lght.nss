////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kas23_worrroz_01.dlg in kas_m23ac (Worrroznor's Home).
	
	A fix by AFP to prevent an infinite LS point exploit. Who would have
	thought LSers were such dirty, dirty cheaters, huh?
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main(){
    
	if(!GetLocalBoolean(OBJECT_SELF, 35))
		{
		  UT_LightSml(GetPCSpeaker());
		  SetLocalBoolean(OBJECT_SELF, 35, 1);
		}
}
