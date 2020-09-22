//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by banter triggers across the game (typically g_partyinit001.utt).
	
	This is the OnEnter for the various banter triggers scattered throughout the
	game. Due to the change to the starting conditional for Carth's "out of the
	loop" conversation, he could end up in a state where his DLG would be triggered
	on Dantooine but he would apparently have nothing to say. The check for that
	state now accounts for the changes.
	
	See also k_swg_carth06.
	
	Issue #2: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/2
	
	DP 2020-09-22																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {

	object oPC = GetEnteringObject();
	object oHostile = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oPC, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	object oNPC;
	int nStarmap = GetGlobalNumber("K_STAR_MAP");
	int nBastilaState = GetGlobalNumber("K_SWG_BASTILA");
	int nBastilaLvl = GetGlobalNumber("K_SWG_BASTILA_LEVEL");
	int nCarthState = GetGlobalNumber("K_SWG_CARTH");
	int nCarthLvl = GetGlobalNumber("K_SWG_CARTH_LEVEL");
	int nPCLevel = GetHitDice(GetFirstPC());
	int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
	int nMissionState = GetGlobalNumber("MIS_MISSIONTALK");
	int nJoleeState = GetGlobalNumber("K_SWG_JOLEE");
	int nJuhaniState =  GetGlobalNumber("G_JUHANIH_STATE");
	int nCandState = GetGlobalNumber("G_CAND_STATE");
	int nTalk = FALSE;
	string sNPC;
	
	if ((oPC == GetPartyMemberByIndex(0) && !GetIsObjectValid(oHostile)) || (GetIsObjectValid(oHostile) && GetDistanceBetween(oPC, oHostile) > 40.0))
		{
			if (oPC == GetPartyMemberByIndex(0))
				{
					if (UT_CheckCanPartyMemberInterject(NPC_BASTILA, 8.0) && nStarmap >= 20 && nBastilaState <= 9 && nPCLevel > nBastilaLvl && GetGlobalNumber("K_SWG_HELENA") != 2 && GetGlobalNumber("K_SWG_HELENA") != 3)
						{
							sNPC = "Bastila";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_BASTILA, 8.0) && nStarmap >= 10 && nBastilaState <= 6 && nPCLevel > nBastilaLvl && GetGlobalNumber("K_SWG_HELENA") != 2 && GetGlobalNumber("K_SWG_HELENA") != 3)
						{
							sNPC = "Bastila";
							nTalk = TRUE;
						}
					// Adjust the initial Carth state check to account for the changes to his "out of the loop" starting conditional, so it only fires after getting the star map quest.
					else if (UT_CheckCanPartyMemberInterject(NPC_CARTH, 8.0) && nCarthState <= 5 && GetGlobalNumber("DAN_PLANET_PLOT") >= 2 && nPCLevel > nCarthLvl)
						{
							sNPC = "Carth";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_BASTILA, 8.0) && nBastilaState == 0 && nPCLevel > nBastilaLvl && GetGlobalNumber("K_SWG_HELENA") != 2 && GetGlobalNumber("K_SWG_HELENA") != 3)
						{
							sNPC = "Bastila";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_CARTH, 8.0) && nCarthState <= 2 && nPCLevel > nCarthLvl)
						{
							sNPC = "Carth";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_MISSION, 8.0) && nMissionState <= 3 && nPlanet != 10)
						{
							sNPC = "Mission";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_JOLEE, 8.0) && nJoleeState == 0 && GetGlobalNumber("K_Current_Planet") != 20)
						{
							sNPC = "Jolee";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_JUHANI, 8.0) && nJuhaniState == 0)
						{
							sNPC = "Juhani";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_CANDEROUS, 8.0) && nCandState == 0)
						{
							sNPC = "Cand";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_MISSION, 8.0) && nMissionState <= 1)
						{
							sNPC = "Mission";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_BASTILA, 8.0) && nBastilaState <= 3 && nStarmap >= 10 && nPCLevel > nBastilaLvl && GetGlobalNumber("K_SWG_HELENA") != 2 && GetGlobalNumber("K_SWG_HELENA") != 3)
						{
							sNPC = "Bastila";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_CARTH, 8.0) && nCarthState <= 4 && nPCLevel > nCarthLvl)
						{
							sNPC = "Carth";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_MISSION, 8.0) && nMissionState <= 2)
						{
							sNPC = "Mission";
							nTalk = TRUE;
						}
					else if (UT_CheckCanPartyMemberInterject(NPC_JOLEE, 8.0) && nJoleeState <= 1 && nJoleeState > GetGlobalNumber("K_SWG_JOLEE_LEVEL") && GetGlobalNumber("K_Current_Planet") != 20)
						{
							sNPC = "Jolee";
							nTalk = TRUE;
						}
					
					if (nTalk == TRUE && UT_GetTalkedToBooleanFlag(OBJECT_SELF) == FALSE)
						{
							UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
							DelayCommand(300.0,UT_SetTalkedToBooleanFlag(OBJECT_SELF, FALSE));
							oNPC = GetObjectByTag(sNPC);
							
							if (GetIsObjectValid(oNPC))
								{
									SetGlobalBoolean("G_NPC_TALK", TRUE);
									SetPartyLeader(NPC_PLAYER);
									AssignCommand(oNPC, ClearAllActions());
									AssignCommand(oNPC, ActionStartConversation(GetFirstPC()));

								}
						}

				}
		}
}
