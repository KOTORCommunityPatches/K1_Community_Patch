//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for dan15_door05.utd in danm15 (Dantooine Ruins).
	
	This script fires on opening the door leading to the Star Map chamber. For
	some reason, there are two separate cutscenes. One opening the door and
	walking towards the Star Map, the other of the map opening requiring the
	player to run forwards and hit a trigger. These two scenes have been merged
	into a single scene, so the trigger is now destroyed by this script. It also
	jumps the party into position behind the door for a nicer opening.
	
	Updated 2020-12-06 to remove Force Speed from the player and Bastila, if it
	is present, to prevent them walking too quickly. Also extended the fade-out
	delay a tad to better mask the cutscene start and switched the DLG owner to
	Bastila to prevent her looking at the floor.
	
	See also cp_dan15_facemap, cp_dan15_mapstrt, k_pdan_cut50, k_pdan_starmap02,
	k_pdan_starmap05.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01 / DP 2021-12-06												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM2 = CP_GetPartyMember(2);
	object oTrig = GetObjectByTag("dan15_trig05", 0);
	location lPC = Location(Vector(147.5,161.6,4.417), 90.0);
	location lBast = Location(Vector(149.0,159.8,4.417), 90.0);
	location lPM2 = Location(Vector(146.0,159.8,4.417), 90.0);
	
	if (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.0, 0.5);
			
			NoClicksFor(1.5);
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			DestroyObject(oTrig);
			
			SetPartyLeader(NPC_PLAYER);
			
			// Strip off Force Speed, if present, to prevent power walking.
			AssignCommand(oPC, ClearAllEffects());
			AssignCommand(oBast, ClearAllEffects());
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oBast, lBast);
			
			// Since Bastila will always be returned as PM1 by the CP_GetPartyMember Include function due
			// to the alphabetical order of the NPC IDs, we can simply call PM2 with no further checks.
			CP_PartyJump(oPM2, lPM2);
			
			DelayCommand(0.5, AssignCommand(oBast, ActionStartConversation(oPC, "cp_dan15_starmap", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
