////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script was added to Jorak's "Slander! That's what it is!" line when
	the player tells him he recognises him as the old hermit in hiding. The
	audio for the line ends abruptly, which caused the following line to 
	start straight away. This is simply a clone of k_pkor_animstun but with
	an appropriate delay to give the line some breathing room.
	
	See also cp_k38_jorakbow, k_pkor_animstun, k_pkor_forceslep, k_pkor_gaschoke,
	k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu, k38b_jor_gastrap,
	k38b_init_jorak, k38b_init_jorak1, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
	AssignCommand(oMekel, ClearAllActions());
	AssignCommand(oMekel, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ClearAllActions());
			AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
		}
	
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ClearAllActions());
			AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
		}
	
	DelayCommand(9.5, ActionResumeConversation());
}
