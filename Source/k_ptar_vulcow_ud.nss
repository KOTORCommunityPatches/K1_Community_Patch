//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for tar10_vulkcow001.utc in tar_m10aa (Taris Black Vulkar Base (Upper)).
	
	This is the UserDefine script for the "coward" in the control room of the
	Vulkar base that surrenders as soon as he is damaged. There was an issue with
	him initiating the post-surrender conversation with a player that was in melee
	with him, where the camera could end up clipping right into his head because
	he was so close. Added a check to move everyone apart if they are too close.
	
	Issue #239: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/239
	
	DP 2023-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_ClearNPC(object oNPC, object oTarget) {
	CancelCombat(oNPC);
	AssignCommand(oNPC, ClearAllActions());
	
	if (GetDistanceBetween(oNPC, oTarget) < 1.5)
		{
			AssignCommand(oNPC, ActionMoveAwayFromObject(oTarget, FALSE, 1.5));
			DelayCommand(0.1, CP_FaceNPC(oNPC, oTarget));
		}
}

void CP_InitConv() {
	SetPartyLeader(NPC_PLAYER);
	ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE);
}

void main() {
	
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{
			if (!UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
				{
					object oPC = GetFirstPC();
					object oPM1 = CP_GetPartyMember(1);
					object oPM2 = CP_GetPartyMember(2);
					object oSelf = OBJECT_SELF;
					
					UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
					
					NoClicksFor(3.0);
					
					ClearAllActions();
					SurrenderToEnemies();
					ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
					
					CP_ClearNPC(oPC, oSelf);
					CP_ClearNPC(oPM1, oSelf);
					CP_ClearNPC(oPM2, oSelf);
					
					if (GetDistanceBetween(oSelf, oPC) < 1.5)
						{
							ActionMoveAwayFromObject(oPC, FALSE, 1.5);
							ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
							ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
						}
					
					DelayCommand(1.0, ActionDoCommand(CP_InitConv()));
				}
		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
