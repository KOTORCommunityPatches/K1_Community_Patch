//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUsed for kor35_torturecom.utp in korr_m35aa (Korriban Sith Academy).
	
	This is the OnUsed script for the torture console in the Korriban Sith
	Academy. It fires the appropriate DLG depending on whether or not the
	Mando prisoner is still alive. It has been adjusted to jump the party
	into position for the subsequent interrogation scene.
	
	See also k35_init_torture, k35_tor_move, k35_vic_collapse, k35_vic_drugged,
	k35_vic_narc, k_pkor_destvictm, k_pkor_painreset, k_pkor_tort01.
	
	Issue #434: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/434
	
	DP 2023-08-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oVic = GetObjectByTag("kor35_victim", 0);
	object oComp = GetObjectByTag("kor35_torturecomp", 0);
	location lPC = Location(Vector(185.13,94.0,6.15), 90.00);
	location lPM1 = Location(Vector(185.60,92.03,6.15), 127.52);
	location lPM2 = Location(Vector(186.80,92.95,6.15), 127.52);
	
	if (!GetIsDead(oVic) && GetGlobalBoolean("KOR_PC_INTERROGATE"))
		{
			NoClicksFor(1.0);
			
			SetGlobalFadeOut();
			DelayCommand(0.5, SetGlobalFadeIn(0.5, 1.0));
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oPM1, lPM1);
			CP_PartyJump(oPM2, lPM2);
			
			DelayCommand(0.2, AssignCommand(oVic, ActionStartConversation(oPC, "kor35_victim", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
		else if (GetIsDead(oVic))
			{
				ActionStartConversation(oPC, "kor35_nocons", FALSE, CONVERSATION_TYPE_COMPUTER, FALSE);
			}
}
