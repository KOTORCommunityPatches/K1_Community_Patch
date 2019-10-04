//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in ebo_m41aa (Ebon Hawk Lehon).

	This script fires at the start of the scene. The vanilla script simply sets
	a boolean, but this has now been extended to make sure Mission and Carth are
	facing each other for the initial line, and locking Mission's head following
	in order to prevent her incorrectly looking down in later parts of the scene.
	
	See also cp_ebo41_facejol, cp_ebo41_misswlk, cp_ebo41_pc2crth, cp_ebo41_pc3crth,
	k_punk_faceall, k_punk_joleeface, k_punk_juhface, k_punk_misfacep2, k_punk_misfacepc,
	k_punk_pcwalk

	Issue #174: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/174

	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMiss = GetObjectByTag("Mission");
	object oCarth = GetObjectByTag("Carth");
	
	AssignCommand(oMiss, SetFacingPoint(GetPosition(oCarth)));
	DelayCommand(2.0, SetLockHeadFollowInDialog(oMiss, TRUE));
	SetGlobalBoolean("UNK_TEMP3", TRUE);
}
