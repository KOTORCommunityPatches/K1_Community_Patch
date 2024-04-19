//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by man28_airlock.dlg in manm28ac (Manaan Hrakert Kolto Control).
	
	Fires when the player exits back to the underwater Sea Floor module, changing
	their appearance to the environment suit. Modified to remove Force Speed if
	present, since that would remain applied otherwise.
	
	See also k_pman_airlock03, k_pman_airlock11.
	
	Issue #775: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/775
	
	DP 2024-04-19																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_man"

void main() {
 	
	CP_RemoveForceSpeed(GetFirstPC());
	
	DonSuits();
 	
	StartNewModule("manm28ab", "from" + GetTag(OBJECT_SELF));
}
