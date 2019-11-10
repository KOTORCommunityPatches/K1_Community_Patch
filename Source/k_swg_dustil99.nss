//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_hdustil_dialog.dlg in korr_m35aa (Korriban Sith Academy).
	
	This script fires if you piss Dustil off while talking to him, turning him
	hostile. Since the PC's facing is locked when initiating the conversation,
	it needs to be unlocked here since the script to do so that fires on other
	exit nodes won't be triggered in this branch. Additionally, Carth has been
	given a bit of a kick in the pants to prevent him standing there like a
	gimp once Dustil attacks.
	
	See also cp_k35_facedust.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-11-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("Carth", 0);
	
	SetGlobalNumber("KOR_DANEL", 5);
	SetGlobalNumber("K_SWG_CARTH", 99);
	
	SetLockOrientationInDialog(oPC, FALSE);
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.5, GN_DetermineCombatRound(oCarth));
	DelayCommand(1.0, AssignCommand(oCarth, GN_DetermineCombatRound(OBJECT_INVALID)));
}
