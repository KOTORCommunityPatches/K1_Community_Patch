////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by the exit node of k_player_dialog.dlg in danm13 (Jedi Enclave).
	
	This script fires at the end of the training montage cutscene. It sets
	some globals and gets Zhar to initiate the post-training conversation
	with the PC. The actual jumping/setup was originally done by scripts
	fired by the first node of that DLG (dan13_zhar.dlg, scripts k_pdan_zhar12
	and k_pdan_player18), but those functions have now all been rolled into
	this script.
	
	Issue #83: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/83
	
	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
    object oZhar = GetObjectByTag("dan13_zhar", 0);
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
    object oPCWP = GetObjectByTag("dan13_WP_PC02", 0);
	location lPC = Location(Vector(74.463,46.358,4.925), -90.0);
	location lPM1 = Location(Vector(77.5,48.0,4.925), -90.0);
	location lPM2 = Location(Vector(77.5,44.65,4.925), -90.0);
	
	SetGlobalBoolean("DAN_CORT_START", 1);
	SetGlobalBoolean("DAN_ZHAR_TRAIN", 1);
	
	NoClicksFor(1.5);
	
	SetGlobalFadeOut();
	
	//Zhar previously jumped into place by k_pdan_vandar01
	DelayCommand(0.1, AssignCommand(oZhar, ClearAllActions()));
	DelayCommand(0.2, AssignCommand(oZhar, SetFacingPoint(GetPosition(oPCWP))));
	
	CP_DLGSetup("dan13_zhar");
	CP_DLGHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	CP_DLGInit("dan13_zhar", "", FALSE, 1.0, 0.5);
}
