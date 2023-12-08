//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithmas.dlg in manm27aa (Manaan Sith Base).
	
	This script fires on the first node of the scene with the Sith Master and his
	two Selkath apprentices. The original script only gave a walk command to the
	PC, but now the entire party is walked. It's also delayed so it can be seen
	on the subsequent entry with a static camera for that purpose.
	
	See also k_pman_sithmas02, k_pman_sithmas05.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-12-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMaster = GetObjectByTag("man27_sithmas", 0);
	location lPC = Location(Vector(240.14,-13.55,0.00), -90.00);
	location lPM1 = Location(Vector(242.14,-11.63,0.00), 250.00);
	location lPM2 = Location(Vector(238.14,-11.63,0.00), -70.00);
	
	ActionPauseConversation();
	
	NoClicksFor(6.0);
	
	DelayCommand(4.0, CP_PartyHerder(lPC, lPM1, lPM2, FALSE, FALSE));
	DelayCommand(5.0, CP_FaceNPC(oPM1, oMaster));
	DelayCommand(5.0, CP_FaceNPC(oPM2, oMaster));
	
	ActionWait(3.0);
	ActionResumeConversation();
}
