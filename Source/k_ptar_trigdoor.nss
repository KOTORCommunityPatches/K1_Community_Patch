//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_trigdoor.utt in tar_m05aa (Taris Lower Sewers)
	
	This script is fired by a trigger in front of the door to Zaalbar's "cell"
	in the sewers. Changed from the vanilla version in order to jump the party
	into a neater starting position in preparation for having Mission walk to
	the door to unlock it during the following cutscene.
	
	See also cp_tar05_misswlk, k_ptar_addzaal, k_ptar_destzaal, k_ptar_misunlock,
	k_ptar_zaalrun.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int HostileCheck(object oTarget) {
	
	object oHostile = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oTarget, 1);
	
	if (GetIsObjectValid(oHostile))
		{
			if (GetDistanceBetween(oHostile, oTarget) < 10.0)
				{
					return TRUE;
				}
		}
	return FALSE;
}

void main() {
	
	object oEntering = GetEnteringObject();
	object oTalker = GetObjectByTag("tar05_celltalker", 0);
	object oFakeZaal = GetObjectByTag("tar05_zaalbar", 0);
	object oPC = GetFirstPC();
	object oMission = GetObjectByTag("mission", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(242.0,188.0,29.0), 150.0);
	location lPM2 = Location(Vector(242.0,185.25,29.0), 128.0);
	location lMissStart = Location(Vector(240.6,186.6,29.0), 130.0);
	
	if (!UT_GetTalkedToBooleanFlag(oTalker) && GetIsPC(oEntering) && IsNPCPartyMember(NPC_MISSION) && !HostileCheck(oEntering))
		{
			NoClicksFor(3.0);
			
			SetGlobalFadeOut();
			
			CancelCombat(oPC);
			CancelCombat(oPM1);
			CancelCombat(oPM2);
			
			SetPartyLeader(NPC_PLAYER);
			
			UT_RestorePartyToOneHealth();
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oMission, lMissStart);
			
			// Establish which slot the remaining party member (presumably Carth) is in
			if (GetIsObjectValid(oPM1) && oPM1 != oMission)
				{
					CP_PartyJump(oPM1, lPM2);
				}
			
			if (GetIsObjectValid(oPM2) && oPM2 != oMission)
				{
					CP_PartyJump(oPM2, lPM2);
				}
			
			SetGlobalFadeIn(1.0, 2.5);
			
			DelayCommand(1.0, AssignCommand(oPC, ActionStartConversation(oFakeZaal, "missdoor_dlg", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "Carth")));
		}
}
