//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for kas_m23aa (Kashyyyk Village of Rwookrrorro).
	
	This is the OnEnter for the Wookiee village. It has been altered to prevent
	the party using Rapid Transit back to the Ebon Hawk after siding with Freyyr.
	Doing so results in the ending cutscenes triggering in the wrong order.
	
	See also cp_kas23_zaaladd.
	
	Issue #119: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/119
	
	DP 2021-11-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void main() {
	
	object oGuard = GetObjectByTag("kas23_wookgua_01", 0);
	
	if (GetChuundarDeadGlobal())
		{
			// Prevent the party from using Rapid Transit so the Landing Pad cutscenes aren't screwed up.
			SetAreaUnescapable(TRUE);
			
			if (GetIsObjectValid(oGuard))
				{
					DestroyObject(oGuard);
				}
		}
}
