//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for tar04_miscrt.utt in tar_m04aa (Taris Undercity).
	
	This is the script that spawns Mission in the Undercity where she pleads for
	help rescuing Zaalbar. The original script started the conversation with
	the party leader, which could result in the player spinning on the spot on
	every line if Carth was leading the party when the script fired. Switched to
	initiate the convo with the player character instead. Also jumped the party
	into position to prevent some issues with Mission navigating to the party
	from her spawn point.
	
	See also cp_tar04_miskill, k_ptar_addmissio, k_ptar_desmis, k_ptar_misrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-09-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oMission;
	object oMissionWP = GetObjectByTag("tar04_spmission", 0);
	location lPC = Location(Vector(255.00,214.50,3.00), 49.19);
	location lPM1 = Location(Vector(252.50,215.00,3.00), 39.19);
	location lPM2 = Location(Vector(256.00,212.00,3.00), 59.19);
	
	if (GetIsPC(GetEnteringObject()) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF) && UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			NoClicksFor(4.0);
			
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.5, 1.0);
			
			// Although a vanilla game will only have Carth as a companion at this point,
			// make provision for jumping a second party member for modded games.
			CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			SetPartyLeader(NPC_PLAYER);
			
			oMission = CreateObject(OBJECT_TYPE_CREATURE, "tar04_mission", GetLocation(oMissionWP));
			
			DelayCommand(1.0, AssignCommand(oMission, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
