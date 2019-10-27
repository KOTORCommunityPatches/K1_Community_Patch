//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan15_ancientdrd.dlg in danm15 (Dantooine Ruins).
	
	This script fires on exiting the overseer droid's DLG. The vanilla version
	only toggles Bastila's AI back on (since they turned it off at the start
	of the initial conversation), but with the addition of locked facing during
	that sequence, this script was edited to also disable the orientation locking
	once the conversation is done.
	
	Updated 2019-10-27 to remove the player's orientation unlocking, since they
	are no longer locked in k_pdan_guard03 to minimise some undesirable camera
	angles.
	
	See also k_pdan_guard03.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	Issue #152: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/152
	
	DP 2019-07-31																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
    
	object oBast = GetObjectByTag("bastila", 0);
	
	SetLockOrientationInDialog(oBast, FALSE);
	
	SetLocalBoolean(oBast, SW_FLAG_AI_OFF, FALSE);
}
