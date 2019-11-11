//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by switchparty.utt in unk_m44ab (Unknown World Temple Catacombs).
	
	This is the trigger OnEnter that fires when you step into the room with the
	floor puzzle in the temple's lower level. The vanilla version would trigger
	again every time you entered it until the puzzle was completed, which could
	prove annoying. It has now been changed to only fire the first time the party
	enters the room. Additionally, it would only switch solo mode back on once 
	passing through after the puzzle was complete, so this has been moved out
	to the tile scripts so solo mode is deactivated when the puzzle is finished.
	
	See also k_punk_floor01, k_punk_floor02, k_punk_floor03, k_punk_floor04,
	k_punk_floor05, k_punk_floor06, k_punk_floor07, k_punk_floor08, k_punk_floor09.
	
	Issue #338: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/338
	
	DP 2019-11-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oDLGHelper = GetObjectByTag("invis", 0);
	
	if (GetIsPC(oEntering) && !GetGlobalBoolean("UNK_SWITCH_DONE") && !GetGlobalBoolean("UNK_TILES"))
		{
			
			SetGlobalFadeOut();
			
			SetPartyLeader(NPC_PLAYER);
			
			DelayCommand(0.1, UT_TeleportPartyMember(oPC, GetLocation(GetObjectByTag("playerwp", 0))));
			DelayCommand(0.1, UT_TeleportPartyMember(oPM1, GetLocation(GetObjectByTag("joleewp", 0))));
			DelayCommand(0.1, UT_TeleportPartyMember(oPM2, GetLocation(GetObjectByTag("juhaniwp", 0))));
			
			SetGlobalBoolean("UNK_SWITCH_DONE", TRUE);
			
			DelayCommand(0.15, AssignCommand(oDLGHelper, ActionStartConversation(oPC, "unk44_sparty")));
		}
}
