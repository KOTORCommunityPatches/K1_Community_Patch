////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k38b_init_jorak1.utt in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires when the PC hits the trigger inside the tomb after being
	jumped from the ambush cutscene in the corridor. This then starts the
	next cutscene of Jorak torturing the PC and Mekel. The primary change is
	the removal of the companions being jumped, and an extension of the sleep
	animations to cover unexpected pauses in the scene progression.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_jor_gastrap, k38b_init_jorak, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int GetFlag() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

void main() {

	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	object oJorak = GetObjectByTag("kor38b_jorakuln", 0);
	
	if ((GetEnteringObject() == oPC) && !GetFlag())
		{
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			AssignCommand(oMekel, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
			AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
			
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
			
			AssignCommand(oJorak, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
}
