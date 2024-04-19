//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by man28_airlock01.dlg in manm28ac (Manaan Hrakert Kolto Control).
	
	Fires when the player exits to the underwater Hrakert Rift module, changing
	their appearance to the environment suit. Modified to remove Force Speed if
	present, since that would remain applied otherwise.
	
	See also k_pman_airlock02, k_pman_airlock11.
	
	Issue #775: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/775
	
	DP 2024-04-19																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_man"

void main() {
 	
	CP_RemoveForceSpeed(GetFirstPC());
	
	DonSuits();
 	
	StartNewModule("manm28ad", "from" + GetTag(OBJECT_SELF));
}
