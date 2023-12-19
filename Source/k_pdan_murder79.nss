//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_bolook.dlg in danm14ac (Dantooine Grove)
	
	This script fires when Bolook goes to examine Rickard's wound at the conclusion
	of the Murder Mystery. It has been altered to have Bolook walk to him first to
	prevent him running and to face the party towards him.
	
	See also k_pdan_murder78.
	
	Issue #110: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/110
	
	DP 2023-12-19																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRickard = GetObjectByTag("dan14_rickard", 0);
	
	ActionPauseConversation();
	
	ActionMoveToObject(oRickard);
	ActionTakeItem(GetItemPossessedBy(oRickard, "dan14_nothing"), oRickard);
	
	DelayCommand(2.0, CP_FaceNPC(oPC, oRickard));
	DelayCommand(2.0, CP_FaceNPC(oPM1, oRickard));
	DelayCommand(2.0, CP_FaceNPC(oPM2, oRickard));
	
	ActionResumeConversation();
}
