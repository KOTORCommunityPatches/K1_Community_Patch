//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_ithor01.dlg in unk_m41aa (Lehon Central Beach).
	
	This script runs the Duros out from behind the rocks towards the party at
	the start of the scene. Originally this scene had three individuals (presumably
	Ithorians, judging by the filenames). At some point that was changed to just
	two, but for some reason this script kept the third waypoint, and ran the
	second Duros to that after having run to the second one. That caused it to
	end up completely out of frame for the rest of the conversation. That was
	corrected, along with delaying its commands to prevent it bumping into the
	first Duros.
	
	See also k_punk_ith01, k_punk_ith05, k_punk_41aa_def.
	
	Issue #285: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/285
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oDuros1 = GetObjectByTag("unk41_ithor01", 0);
	object oDuros2 = GetObjectByTag("unk41_ithor02", 0);
	location lDuros1 = GetLocation(GetWaypointByTag("ith1wp"));
	location lDuros2 = GetLocation(GetWaypointByTag("ith2wp"));
	
	ActionPauseConversation();
	
	SetGlobalFadeIn(0.7, 2.0);
	
	AssignCommand(oDuros1, ActionMoveToLocation(lDuros1, TRUE));
	
	DelayCommand(0.7, AssignCommand(oDuros2, ActionMoveToLocation(lDuros2, TRUE)));
	DelayCommand(0.8, AssignCommand(oDuros1, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
	
	DelayCommand(2.0, ActionResumeConversation());
}
