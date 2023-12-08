//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for man27aa_door06.utd in manm27aa (Manaan Sith Base).
	
	This is the door OnOpen script that triggers the scene with the Sith Master
	and his two Selkath apprentices. It has been altered to jump the party into
	a good starting position for their subsequent walk in, stripping off Force
	speed to prevent power walking. It also locks the party member's orientation
	and head tracking, since the interjections by Jolee and HK have some serious
	reorientation issues otherwise.
	
	See also k_pman_sithmas02, k_pman_sithmas06.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-12-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMaster = GetObjectByTag("man27_sithmas", 0);
	location lPC = Location(Vector(240.14,-5.52,0.00), -90.00);
	location lPM1 = Location(Vector(241.14,-3.60,0.00), -90.00);
	location lPM2 = Location(Vector(239.14,-3.60,0.00), -90.00);
	
	SetGlobalFadeOut();
	DelayCommand(1.5, SetGlobalFadeIn(0.1, 1.0));
	
	NoClicksFor(1.5);
	
	SetPartyLeader(NPC_PLAYER);
	
	SetLightsaberPowered(oMaster, TRUE, TRUE, FALSE);
	
	CP_RemoveForceSpeed(oPC);
	CP_RemoveForceSpeed(oPM1);
	CP_RemoveForceSpeed(oPM2);
	
	DelayCommand(0.5, CP_PartyHerder(lPC, lPM1, lPM2));
	
	DelayCommand(0.75, CP_DLGLock(oPM1, TRUE));
	DelayCommand(0.75, CP_DLGLock(oPM2, TRUE));
	
	DelayCommand(1.0, AssignCommand(oMaster, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
}
