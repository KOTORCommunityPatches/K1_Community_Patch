//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_onespk.utt in unk_m43aa (Lehon The One's Settlement).
	
	This is the trigger OnEnter that fires when the party enters The One's
	compound for the first time. It has been altered to jump the party into a
	cleaner starting formation for the following cutscene to avoid pathfinding
	and player-following behaviour issues with the party members.
	
	See also k_punk_theone01.
	
	Issue #477: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/477
	
	DP 2021-10-24																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oTheOne = GetObjectByTag("unk43_theone", 0);
	location lPC = Location(Vector(50.33,136.79,40.68), 180.00);
	location lPM1 = Location(Vector(52.94,135.29,40.68), 180.00);
	location lPM2 = Location(Vector(52.94,138.29,40.68), 180.00);
	
	if (GetIsPC(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			HoldWorldFadeInForDialog();
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.5, 1.5);
			
			NoClicksFor(1.2);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
			
			DelayCommand(1.0, AssignCommand(oTheOne, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
