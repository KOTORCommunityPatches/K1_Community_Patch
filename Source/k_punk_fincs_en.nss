//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for unk41_fincs.utt in unk_m41aa (Lehon Central Beach).
	
	This is the trigger OnEnter that starts the final cutscene on the beach after
	the temple summit showdown with Bastila. Edited to add in some exclusion masks
	for the DLG since it now has forced animations on the starting node to make
	sure the hide weapons and masks flags take effect.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {	
	
	if (GetGlobalNumber("G_FinalChoice") > 0 && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			SetGlobalFadeOut();
			
			SetPartyLeader(NPC_PLAYER);
			
			UT_TeleportPartyMember(GetPartyMemberByIndex(0), GetLocation(GetObjectByTag("pcstart", 0)));
			UT_TeleportPartyMember(GetPartyMemberByIndex(1), GetLocation(GetObjectByTag("n2start", 0)));
			UT_TeleportPartyMember(GetPartyMemberByIndex(2), GetLocation(GetObjectByTag("n1start", 0)));
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			SetGlobalNumber("K_KOTOR_MASTER", 50);
			
			NoClicksFor(0.4);
			
			// Add tag masks for potentially missing NPCs to ensure forced DLG anim node fires correctly.
			DelayCommand(0.15, AssignCommand(GetObjectByTag("carth", 0), ActionStartConversation(GetFirstPC(), "unk41_carth", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "zaalbar", "hk47", "bastila", "jolee", "juhani")));
		}
}
