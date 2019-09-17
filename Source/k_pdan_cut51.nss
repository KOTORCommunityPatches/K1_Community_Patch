////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan15_door05.utd in danm15 (Dantooine Ruins).
	
	This script fires on opening the door leading to the Star Map chamber. For
	some reason, there are two separate cutscenes. One opening the door and
	walking towards the Star Map, the other of the map opening requiring the
	player to run forwards and hit a trigger. These two scenes have been merged
	into a single scene, so the trigger is now destroyed by this script. It also
	jumps the party into position behind the door for a nicer opening.
	
	See also k_pdan_cut50, k_pdan_starmap02, k_pdan_starmap05, and cp_dan15_facemap.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oStarmap = GetObjectByTag("dan15_starmap", 0);
	object oTrig = GetObjectByTag("dan15_trig05", 0);
	location lPC = Location(Vector(147.5,161.6,4.417), 90.0);
	location lBast = Location(Vector(149.0,159.8,4.417), 90.0);
	location lPM2 = Location(Vector(146.0,159.8,4.417), 90.0);
	
	if (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			SetGlobalFadeOut();
			
			NoClicksFor(1.0);
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			DestroyObject(oTrig);
			
			SetPartyLeader(NPC_PLAYER);
			
			AssignCommand(oPC, ClearAllActions());
			CP_PartyJump(oPC, lPC);
			AssignCommand(oPC, SetFacing(DIRECTION_NORTH));
			
			AssignCommand(oBast, ClearAllActions());
			CP_PartyJump(oBast, lBast);
			AssignCommand(oBast, SetFacing(DIRECTION_NORTH));
			
			if (GetTag(oPM1) != "bastila")
				{
					AssignCommand(oPM1, ClearAllActions());
					CP_PartyJump(oPM1, lPM2);
					AssignCommand(oPM1, SetFacing(DIRECTION_NORTH));
				}
			
			if (GetTag(oPM2) != "bastila")
				{
					AssignCommand(oPM2, ClearAllActions());
					CP_PartyJump(oPM2, lPM2);
					AssignCommand(oPM2, SetFacing(DIRECTION_NORTH));
				}
			
			SetGlobalFadeIn(0.6, 0.0);
			
			AssignCommand(oStarmap, DelayCommand(0.5, ActionStartConversation(oPC, "cp_dan15_starmap", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
