//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_ffcontrol.utp in tar_m05aa (Taris Lower Sewers)
	
	This is the OnUsed script for the computer console outside the forcefield that
	blocks access to the Upper Sewers and the Vulkar base. It fires a cutscene if
	Mission is in the party, or a regular computer terminal dialogue if she isn't.
	The cutscene is further split into two, depending on whether or not Zaalbar
	has been freed yet. The vanilla setup is typical Bioware sloppiness/laziness,
	with no party herding to speak of and Mission not even interacting with the
	terminal. This script now jumps the party into position in preparation for
	some interaction during the cutscene. It also locks their orientation to keep
	them focused on the task at hand.
	
	See also cp_tar05_ffend, cp_tar05_ffopen, cp_tar05_ffstart, cp_tar05_ffwalk.
	
	Issue #66: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/66
	
	DP 2020-06-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oMission = GetObjectByTag("mission", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oFField = GetObjectByTag("tar05_forcefield", 0);
	object oComp = GetObjectByTag("tar05_ffcontrol", 0);
	location lPCStart = Location(Vector(278.655,133.906,27.893), 135.0);
	location lMissStart = Location(Vector(276.767,132.297,27.893), 135.0);
	location lPM2Start = Location(Vector(280.459,135.94,27.893), 135.0);
	location lPC = Location(Vector(276.699,135.862,27.893), 135.0);
	location lMiss = Location(Vector(276.785,134.14,27.893), 100.0);
	location lPM2 = Location(Vector(278.058,133.334,27.893), 121.0);
	
	if (!GetIsOpen(oFField) && IsNPCPartyMember(NPC_MISSION))
		{
			NoClicksFor(3.0);
			
			SetGlobalFadeOut();
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyJump(oPC, lPCStart);
			DelayCommand(0.9, CP_PartyJump(oPC, lPC));
			DelayCommand(1.3, SetLockOrientationInDialog(oPC, TRUE));
			
			CP_PartyJump(oMission, lMissStart);
			DelayCommand(0.9, CP_PartyJump(oMission, lMiss));
			
			// Establish which slot the remaining party member is in.
			if (GetIsObjectValid(oPM1) && oPM1 != oMission)
				{
					CP_PartyJump(oPM1, lPM2Start);
					DelayCommand(0.9, CP_PartyJump(oPM1, lPM2));
					DelayCommand(1.3, SetLockOrientationInDialog(oPM1, TRUE));
				}
				else if (GetIsObjectValid(oPM2) && oPM2 != oMission)
					{
						CP_PartyJump(oPM2, lPM2Start);
						DelayCommand(0.9, CP_PartyJump(oPM2, lPM2));
						DelayCommand(1.3, SetLockOrientationInDialog(oPM2, TRUE));
					}
			
			// Fire the cutscene.
			DelayCommand(1.1, AssignCommand(oPC, ActionStartConversation(oComp, "tar05_ff_dlg2", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
		else
			{
				// Fire the regular computer terminal conversation.
				// The vanilla script used CONVERSATION_TYPE_COMPUTER, but that is outmoded (this variable is ignored in the shipping build of the game).
				//ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_COMPUTER, TRUE);
				ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE);
			}
}
