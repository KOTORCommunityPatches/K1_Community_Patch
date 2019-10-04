//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in ebo_m41aa (Ebon Hawk Lehon).

	This script fires on the second line of the scene, walking the PC into shot
	as Carth is explaining the situation. The PC was supposed to face the center
	of the room once they had reached their destination, but they failed to do
	so and ended up facing away from Carth. Adding an animation forces them to
	follow directions. Carth is also given a facing command just to be safe, since
	he was facing in the opposite direction on the previous line when listening
	to Mission.
	
	See also cp_ebo41_facejol, cp_ebo41_misswlk, cp_ebo41_pc2crth, cp_ebo41_pc3crth,
	k_punk_cut02, k_punk_faceall, k_punk_joleeface, k_punk_juhface, k_punk_misfacep2,
	k_punk_misfacepc

	Issue #174: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/174

	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("Carth");
	
	AssignCommand(oCarth, SetFacing(DIRECTION_EAST));
	AssignCommand(oPC, ActionMoveToLocation(GetLocation(GetObjectByTag("playerface", 0)), 0));
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("centerface", 0)))));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT));
}
