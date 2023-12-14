//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnOpen for ptar_davdoor002.utd in tar_m08aa (Taris Davik's Estate).
	
	This script triggers the scene with the bounty hunter having a secret date
	night in Davik's Estate. It now jumps the party into position in order to
	allow the slave girl room to run past when she flees at the beginning of
	the scene.
	
	See also k_ptar_davslav01.
	
	Issue #728: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/728
	
	DP 2023-12-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oHunter = GetObjectByTag("tar08_davikguest02", 0);
	location lPC = Location(Vector(82.26,94.98,0.00), 260.45);
	location lPM1 = Location(Vector(83.39,96.39,0.00), 248.17);
	location lPM2 = Location(Vector(81.54,96.75,0.00), -90.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.2, 1.0);
	
	NoClicksFor(1.5);
	
	SetPartyLeader(NPC_PLAYER);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.5, CP_FaceNPC(oPC, oHunter));
	DelayCommand(0.5, CP_FaceNPC(oPM1, oHunter));
	DelayCommand(0.5, CP_FaceNPC(oPM2, oHunter));
	
	DelayCommand(1.0, AssignCommand(oHunter, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
}
