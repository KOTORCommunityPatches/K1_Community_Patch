//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_gurney021.dlg in tar_m02ac (Taris Upper City South).
	
	This script fires on the first node of the branch where Gurney accosts the
	player about the Rakghoul serum when leaving the clinic. It now jumps the
	party into position in order to reduce facing issues.
	
	Updated 2023/07/28 to face the party and Gurney.
	
	See also cp_tar02_fcegurn, k_ptar_zelkatk2x.
	
	Issue #494: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/494
	
	DP 2021/12/08 / DP 2023/07/28												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oGurney = GetObjectByTag("gurney021", 0);
	location lPC = Location(Vector(187.47,69.09,0.00), 45.00);
	location lPM1 = Location(Vector(186.68,66.18,0.00), 45.00);
	location lPM2 = Location(Vector(184.56,68.30,0.00), 45.00);
	
	SetGlobalFadeOut();
	DelayCommand(0.75, SetGlobalFadeIn(0.1, 1.5));
	
	NoClicksFor(3.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	// Face everyone and prevent the player freezing at end of convo.
	DelayCommand(0.5, CP_FaceNPC(oPC, oGurney));
	DelayCommand(0.5, CP_FaceNPC(oPM1, oGurney));
	DelayCommand(0.5, CP_FaceNPC(oPM2, oGurney));
	DelayCommand(0.5, CP_FaceNPC(oGurney, oPC));
	
	SetGlobalNumber("Tar_ZelkaTk", 3);
	SetGlobalBoolean("Tar_Gurney_Talk", TRUE);
}
