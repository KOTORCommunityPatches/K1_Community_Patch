//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for k35_init_torture.utt in korr_m35aa (Korriban Sith Academy).
	
	This is the trigger OnEnter that starts a conversation with the torturer when
	the player enters the interrogation room in the Korriban Sith Academy for the
	first time. It has been edited to jump the party into position so that the
	torturer can more easily pathfind past them post-conversation. It also faces
	the Mandalorian prisoner towards the console, since otherwise he seems to
	just blankly stare straight ahead, despite DLG speaker/listener tags.
	
	See also k35_plc_startvic, k35_tor_move, k35_vic_collapse, k35_vic_drugged,
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
	object oTorturer = GetObjectByTag("kor35_torturer", 0);
	object oVictim = GetObjectByTag("kor35_victim", 0);
	int SW_PLOT_BOOLEAN_01 = 0;
	location lPC = Location(Vector(186.01,91.76,6.15), 108.99);
	location lPM1 = Location(Vector(185.85,89.90,6.15), 108.99);
	location lPM2 = Location(Vector(187.27,90.39,6.15), 108.99);
	
	if (GetIsPC(GetEnteringObject()) && !GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			NoClicksFor(1.0);
			
			SetGlobalFadeOut();
			DelayCommand(0.5, SetGlobalFadeIn(0.5, 1.0));
			
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			AssignCommand(oTorturer, ClearAllActions());
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oPM1, lPM1);
			CP_PartyJump(oPM2, lPM2);
			
			DelayCommand(0.1, CP_FaceNPC(oVictim, oTorturer));
			
			DelayCommand(0.5, AssignCommand(oTorturer, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
