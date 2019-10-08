//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_cut01.dlg in end_m01aa (Endar Spire Command Module).
	
	This script fires during the the Darth Bandon confrontation/Trask's sacrifice
	cutscene. It is a stripped down version of the original script, since most of
	the original functionality that handled giving Trask a sword, via a call to
	case 500 of his OUD (k_pend_trask_d), has been moved to earlier scripts in the
	scene.
	
	See also k_pend_cut02, k_pend_cut23, k_pend_cut32, k_pend_traskdie1.
	
	Issue #230: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/230
	
	DP 2019-10-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oTrask = GetObjectByTag("end_trask");
	object oDoor = GetObjectByTag("end_door19", 0);
	object oDie_WP = GetObjectByTag("end_wp_traskdie2", 0);
	location lPC = GetLocation(GetObjectByTag("wp_player01", 0));
	
	SetLocked(oDoor, TRUE);
	AssignCommand(oDoor, ActionCloseDoor(oDoor));
	
	AssignCommand(oPC, ActionJumpToLocation(lPC));
	
	AssignCommand(oTrask, ActionForceMoveToObject(oDie_WP, TRUE));
}
