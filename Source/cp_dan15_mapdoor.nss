//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefined for cp_dan15_mapdoor.utp in danm15 (Dantooine Ruins).
	
	This is the OUD for an added invisible placeable in an attempt to stop users
	breaking the damn cutscene when opening the door to the star map room. Transfers
	the content that was formerly in k_pdan_cut51 (the door OnOpen), which has been
	relegated to a simple event signal. 
	
	For some reason, the vanilla module had two separate cutscenes. One opening the
	door and walking towards the Star Map, the other of the map opening. This required
	the player to run forwards after opening the door and hit a trigger. These two
	scenes have been merged into a single scene, so the trigger is now obsolete
	(OnEnter script is removed). It also jumps the party into position behind the door
	for a nicer opening. Additionally removes Force Speed from the player and Bastila,
	if it is present, to prevent them walking forwards too quickly. Also switched the
	DLG owner to Bastila to prevent her looking at the floor.
	
	See also  cp_dan15_facemap, cp_dan15_mapstrt, k_pdan_cut50, k_pdan_cut51,
	k_pdan_starmap02, k_pdan_starmap05.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	Issue #590: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/590
	
	DP 2026-11-10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM2 = CP_GetPartyMember(2);
	object oTrig = GetObjectByTag("dan15_trig05", 0);
	int iUser = GetUserDefinedEventNumber();
	location lPC = Location(Vector(147.5,161.6,4.417), 90.0);
	location lBast = Location(Vector(149.0,159.8,4.417), 90.0);
	location lPM2 = Location(Vector(146.0,159.8,4.417), 90.0);
	
	switch (iUser) {
		case 10:
			if (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
				{
					NoClicksFor(1.5);
					
					SetGlobalFadeOut();
					SetGlobalFadeIn(1.0, 0.5);
					
					UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
					
					SetPartyLeader(NPC_PLAYER);
					
					// Strip off Force Speed, if present, to prevent power walking.
					CP_RemoveForceSpeed(oPC);
					CP_RemoveForceSpeed(oBast);
					
					CP_PartyJump(oPC, lPC);
					CP_PartyJump(oBast, lBast);
					
					// Since Bastila is a forced party member for this module, she will always be returned as PM1 by
					// the CP_GetPartyMember include function due to the alphabetical order of the NPC IDs. So we can
					// simply call PM2 with no further checks. Although this assumes vanilla story behaviour and NPCs.
					CP_PartyJump(oPM2, lPM2);
					
					DestroyObject(oTrig); // Vanilla trigger for second half of the scene. Its OnEnter was already removed.
					
					DelayCommand(0.5, AssignCommand(oBast, ActionStartConversation(oPC, "cp_dan15_starmap", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
			break;
	}
}
