//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_gangcs.utt in tar_m03aa (Taris Lower City).
	
	This is the trigger OnEnter that starts the Bek vs Vulkar cutscene when entering
	the Lower City for the first time. Edited to jump the party so that they are all
	visible in the establishing shot.
	
	Issue #233: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/233
	
	DP 2019-11-06																*/
//////////////////////////////////////////////////////////////////////////////////


#include "cp_inc_k1"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oEntering = GetEnteringObject();
	object oCSHelper = GetObjectByTag("tar03_gangtalker", 0);
	location lPM1 = Location(Vector(403.869,143.2,8.246), 90.0);
	location lPM2 = Location(Vector(401.369,143.2,8.246), 90.0);
	
	if (GetIsPC(oEntering) && CP_HasNeverTalkedTo())
		{
			// Mask the jump
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.5, 0.5);
			
			SetPartyLeader(NPC_PLAYER);
			
			// There shouldn't ever be two companions for this scene, but just in case...
			CP_PartyJump(oPM1, lPM1);
			CP_PartyJump(oPM2, lPM2);
			
			AssignCommand(oCSHelper, ActionStartConversation(oCSHelper));
		}
}
