//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for cp_tar04_missspl.utt / cp_tar04_missspl.utt in tar_m04aa
	(Taris Undercity).
	
	This is the script that spawns Mission in the Undercity where she pleads for
	help rescuing Zaalbar. The original script started the conversation with
	the party leader, which could result in the player spinning on the spot on
	every line if Carth was leading the party when the script fired. Switched to
	initiate the convo with the player character instead. The original single
	trigger has been split into two separate triggers in order to jump the party
	into position on either the left or right side of the gate. This prevents
	some issues with Mission navigating to the party from her spawn point.
	
	Updated 2021-12-10 to switch the PM1/2 jump positions for the righthand
	trigger to try and prevent the initial shot clipping through their head.
	
	See also cp_tar04_miskill, k_ptar_addmissio, k_ptar_desmis, k_ptar_hdfate_ud,
	k_ptar_misrun, k_ptar_rakrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-10-30 / DP 2021-12-10												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oMission;
	location lPC_Left = Location(Vector(250.69,217.79,3.00), 40.87);
	location lPM1_Left = Location(Vector(248.29,218.65,3.00), 30.87);
	location lPM2_Left = Location(Vector(251.32,215.17,3.00), 50.87);
	location lPC_Right = Location(Vector(265.16,201.59,3.00), 12.95);
	location lPM1_Right = Location(Vector(264.49,198.98,3.00), 22.95);
	location lPM2_Right = Location(Vector(263.44,203.47,3.00), 2.95);
	location lMissSp_Left = Location(Vector(272.75,226.75,3.00), 190.00);
	location lMissSp_Right = Location(Vector(277.70,211.50,3.00), 250.00);
	
	if (GetIsPC(GetEnteringObject()) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF) && UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			NoClicksFor(4.0);
			
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.5, 1.0);
			
			// Although a vanilla game will only have Carth as a companion at this point,
			// make provision for jumping a second party member for modded games.
			if (GetTag(OBJECT_SELF) == "cp_tar04_missspl")
				{
					CP_PartyHerder(lPC_Left, lPM1_Left, lPM2_Left, TRUE, FALSE);
					oMission = CreateObject(OBJECT_TYPE_CREATURE, "tar04_mission", lMissSp_Left);
				}
			
			if (GetTag(OBJECT_SELF) == "cp_tar04_missspr")
				{
					CP_PartyHerder(lPC_Right, lPM1_Right, lPM2_Right, TRUE, FALSE);
					oMission = CreateObject(OBJECT_TYPE_CREATURE, "tar04_mission", lMissSp_Right);
				}
			
			// Flag both triggers to prevent a duplicate Mission spawning later.
			UT_SetTalkedToBooleanFlag(GetObjectByTag("cp_tar04_missspl"), TRUE);
			UT_SetTalkedToBooleanFlag(GetObjectByTag("cp_tar04_missspr"), TRUE);
			
			// Set a second flag to identify which trigger fired.
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_05, TRUE);
			
			SetPartyLeader(NPC_PLAYER);
			
			DelayCommand(1.0, AssignCommand(oMission, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
