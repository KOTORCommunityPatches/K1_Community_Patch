//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas24_jolee_02.dlg in kas_m24aa (Kashyyyk Upper Shadowlands).

	This script is fired on the starting node of the branch where the player
	meets Jolee post-Leviathan and already knows they are Revan. The original
	script has been extended to include the party jump from the added script
	that has been applied to every other starting node. The only difference
	is the setting of a global boolean.
	
	See also cp_kas24_jolpjmp.
	
	Issue #122: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/122

	DP 2022-08-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJolee = GetObjectByTag("jolee", 0);
	location lPC = Location(Vector(149.32,141.36,6.84), 213.75);
	location lPM1 = Location(Vector(150.79,141.44,6.85), 188.75);
	location lPM2 = Location(Vector(149.96,142.69,6.98), 227.75);
	
	SetGlobalFadeOut();
	DelayCommand(0.6, SetGlobalFadeIn(0.5, 0.5));
	
	SetPartyLeader(NPC_PLAYER);
	
	NoClicksFor(1.0);
	
	SetGlobalBoolean("Kas_Jolee_Revan", TRUE);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	// Realign Jolee in case the PC initiated the convo from off to one side
	DelayCommand(0.2, CP_FaceNPC(oPC, oJolee));
	DelayCommand(0.2, CP_FaceNPC(OBJECT_SELF, oPC));
}
