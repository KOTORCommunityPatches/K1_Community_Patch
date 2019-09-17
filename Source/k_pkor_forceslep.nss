////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires on most of Jorak's questions during the torture sequence
	in order to keep the player, party members, and Mekel in their sleep anim
	loops. The vanilla script only applied it to Mekel and the player, so
	companions could prematurely break out of their loops if the player took
	too long making a reply choice. In order to prevent having to replace all
	references to it in the DLG, the script is now just a clone of k_pkor_animstun.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_gaschoke,
	k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu, k38b_jor_gastrap,
	k38b_jor_givetab, k38b_jor_hostile, k38b_init_jorak, k38b_init_jorak1,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
	AssignCommand(oMekel, ClearAllActions());
	AssignCommand(oMekel, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ClearAllActions());
			AssignCommand(oPM1, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
		}
	
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ClearAllActions());
			AssignCommand(oPM2, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
		}
	
	DelayCommand(2.0, ActionResumeConversation());
}
