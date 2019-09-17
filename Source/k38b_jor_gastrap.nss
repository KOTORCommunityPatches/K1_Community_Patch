////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires at the end of the corridor ammbush scene, warping the
	party and Jorak to the tomb for the torture scene. For some reason the
	companions were jumped in three separate scripts during this transition,
	which was possibly what caused issues with them occasionally ending up
	trapped outside the room. This has been cleaned up, moving to a single
	transition for everyone using the K1CP Include functions.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_init_jorak, k38b_init_jorak1, k38b_jor_givetab, k38b_jor_hostile,
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
	object oWP_PC = GetObjectByTag("k38b_way_player", 0);
	object oWP_Jorak = GetObjectByTag("k38b_way_jorak", 0);
	location lPM1 = Location(Vector(154.416,79.429,3.75), -135.0);
	location lPM2 = Location(Vector(152.512,81.349,3.75), -135.0);
	
	SetGlobalFadeOut(1.0, 4.0);
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	SetGlobalBoolean("KOR_JORAK_MEET", TRUE);
	
	CP_PartyJump(OBJECT_SELF, GetLocation(oWP_Jorak));
	
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oPC, ClearAllActions());
	CP_PartyJump(oPC, GetLocation(oWP_PC));
	DelayCommand(1.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 90.0)));

	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ClearAllEffects());
			AssignCommand(oPM2, ClearAllActions());
			CP_PartyJump(oPM1, lPM1);
			DelayCommand(1.0, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 90.0)));
		}
			
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ClearAllEffects());
			AssignCommand(oPM2, ClearAllActions());
			CP_PartyJump(oPM2, lPM2);
			DelayCommand(1.0, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 90.0)));
		}

	SetGlobalFadeIn(2.5, 1.5);
}
