//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in ebo_m41aa (Ebon Hawk Lehon).

	This is an added script that fires when T3 interjects with some beeping. It
	has Mission walk away from her starting point to stand next to a different
	console/command panel. Done in conjunction with a walkmesh edit (m12aa_01f.wok)
	in order to allow her to get close enough to the panel.
	
	See also cp_ebo41_facejol, cp_ebo41_pc2crth, cp_ebo41_pc3crth, k_punk_cut02,
	k_punk_faceall, k_punk_joleeface, k_punk_juhface, k_punk_misfacep2, k_punk_misfacepc,
	k_punk_pcwalk

	Issue #174: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/174

	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMiss = GetObjectByTag("mission", 0);
	location lComp = Location(Vector(43.44872,48.54255,1.8), 144.0);
	
	ActionPauseConversation();
	
	AssignCommand(oMiss, ClearAllActions());
	AssignCommand(oMiss, ActionDoCommand(SetCommandable(TRUE, oMiss)));
	AssignCommand(oMiss, ActionMoveToLocation(lComp, FALSE));
	
	DelayCommand(3.0, ActionResumeConversation());
}
