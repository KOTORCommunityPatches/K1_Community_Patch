//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in ebo_m41aa (Ebon Hawk Lehon).

	This is an added script that reorients the PC off-screen so that they are
	facing Carth in preparation for a subsequent line.
	
	See also cp_ebo41_facejol, cp_ebo41_misswlk, cp_ebo41_pc3crth, k_punk_cut02,
	k_punk_faceall, k_punk_joleeface, k_punk_juhface, k_punk_misfacep2, k_punk_misfacepc,
	k_punk_pcwalk

	Issue #174: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/174

	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("Carth");
	
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oCarth))));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT));
}
