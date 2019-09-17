////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires on the opening node of the torture scene in the tomb.
	The primary change is the removal of the companions being jumped, and an
	extension of the sleep animations to cover unexpected pauses in the scene
	progression. A quicker fade-in was also added, and the one in the DLG
	removed.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k38b_jor_gastrap,
	k38b_init_jorak, k38b_init_jorak1, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oArea = GetArea(OBJECT_SELF);
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	
	ActionPauseConversation();
	
	MusicBackgroundStop(oArea);
	DelayCommand(0.1, MusicBattlePlay(oArea));
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
	if (GetIsObjectValid(oMekel))
		{
			AssignCommand(oMekel, ClearAllActions());
			AssignCommand(oMekel, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
		}
	
	if (((GetTag(oPM1) != "HK47") && (GetTag(oPM1) != "T3M4")))
		{
			DelayCommand(3.0, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(3.0, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0)));
		}
			
	if (((GetTag(oPM2) != "HK47") && (GetTag(oPM2) != "T3M4")))
		{
			DelayCommand(3.0, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(3.0, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0)));
		}
	
	ActionResumeConversation();
}
