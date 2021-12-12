//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by yav47_suvam.dlg in liv_m99aa (Yavin Station).
	
	This script fires on the first node of the second encounter with the Trandos
	on Yavin Station. The original positioning is retained, but there's now a
	NoClicksFor in conjunction with a static camera shot in the DLG.
	
	Issue #528: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/528
	
	DP 2021-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSuvam = GetObjectByTag("yav47_suvam", 0);
	location lPC = GetLocation(GetObjectByTag("wp201", 0));
	location lPM1 = GetLocation(GetObjectByTag("wp202", 0));
	location lPM2 = GetLocation(GetObjectByTag("wp203", 0));
	location lPC_Walk = GetLocation(GetObjectByTag("wp204", 0));
	location lPM1_Walk = GetLocation(GetObjectByTag("wp205", 0));
	location lPM2_Walk = GetLocation(GetObjectByTag("wp206", 0));
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.7, 1.0);
	
	NoClicksFor(6.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	// Clear off Force Speed.
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oPM1, ClearAllEffects());
	AssignCommand(oPM2, ClearAllEffects());
	
	DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
	
	DelayCommand(0.4, CP_PartyHerder(lPC_Walk, lPM1_Walk, lPM2_Walk, FALSE, FALSE));
	
	AssignCommand(oSuvam, ActionJumpToLocation(GetLocation(GetObjectByTag("suvam101", 0))));
	DelayCommand(0.1, CP_FaceNPC(oSuvam, oPC));
	
	ActionResumeConversation();
}
