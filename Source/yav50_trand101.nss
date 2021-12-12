//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by yav47_suvam.dlg in liv_m99aa (Yavin Station).
	
	This script fires on the first node of the scene where the player encounters
	Trandoshans hassling Suvam Tan on Yavin Station. When using the walk-to points
	of the original script, the pathfinding of the Trandos would freak out because
	the party members were in the way. Now the whole party is sent to positions
	further back out of the way so the Trandos have a clear path to exit.
	
	Issue #528: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/528
	
	DP 2021-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oTrando = GetObjectByTag("yav47_trand01", 0);
	object oSuvam = GetObjectByTag("yav47_suvam", 0);
	location lPC = GetLocation(GetObjectByTag("wp201", 0));
	location lPM1 = GetLocation(GetObjectByTag("wp202", 0));
	location lPM2 = GetLocation(GetObjectByTag("wp203", 0));
	location lPC_Walk = Location(Vector(8.97,87.85,7.23), 177.07);
	location lPM1_Walk = Location(Vector(10.83,88.59,7.23), 174.18);
	location lPM2_Walk = Location(Vector(10.24,86.30,7.23), 164.76);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 1.5);
	
	NoClicksFor(3.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	// Clear off Force Speed.
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oPM1, ClearAllEffects());
	AssignCommand(oPM2, ClearAllEffects());
	
	DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
	
	DelayCommand(0.2, CP_PartyMove(oPC, lPC_Walk));
	DelayCommand(1.0, CP_PartyMove(oPM1, lPM1_Walk));
	DelayCommand(2.0, CP_PartyMove(oPM2, lPM2_Walk));
	
	DelayCommand(2.0, CP_FaceNPC(oPC, oTrando));
	DelayCommand(2.5, CP_FaceNPC(oPM1, oTrando));
	DelayCommand(3.0, CP_FaceNPC(oPM2, oTrando));
	
	AssignCommand(oSuvam, ActionJumpToLocation(GetLocation(GetObjectByTag("suvam101", 0))));
	DelayCommand(0.1, CP_FaceNPC(oSuvam, oTrando));
	
	DelayCommand(3.0, ActionResumeConversation());
}
