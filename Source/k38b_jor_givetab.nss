////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires at the end of the scene if Mekel has died. Jorak gives
	the player his tablet and then departs. Because droid party members were
	reduced to 1HP in order to force them to play their injured idle anim,
	provision had to be made to heal them. A little extra coaxing was also
	required for the PC to get them to break out of the sleeping anim.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_jor_gastrap, k38b_init_jorak, k38b_init_jorak1, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void ToggleAI(int nIndex, int nState) {
	SetLocalBoolean(OBJECT_SELF, nIndex, nState);
}

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oArea = GetArea(OBJECT_SELF);
	object oDoor = GetObjectByTag("k38b_door_jorak", 0);
	object oWP_Jorak = GetObjectByTag("K38B_WAY_K36", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(0.75);
	
	MusicBattleStop(oArea);
	DelayCommand(0.1, MusicBackgroundPlay(oArea));
	
	SetLocked(oDoor, FALSE);
	ActionOpenDoor(oDoor);
	
	CreateItemOnObject("kor_itm_sithtabl", oPC, 1);
	
	ActionMoveToObject(oWP_Jorak, TRUE);
	ActionDoCommand(DestroyObject(OBJECT_SELF));
	SetCommandable(FALSE, OBJECT_SELF);
	
	DelayCommand(0.1, AssignCommand(oPC, ClearAllEffects()));
	DelayCommand(0.1, AssignCommand(oPC, ClearAllActions()));
	DelayCommand(0.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE)));
	
	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ToggleAI(SW_FLAG_AI_OFF, FALSE));
			DelayCommand(0.1, AssignCommand(oPM1, ClearAllEffects()));
			DelayCommand(0.1, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(0.2, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE)));
			
			if (((GetTag(oPM1) == "HK47") || (GetTag(oPM1) == "T3M4")))
				{
					// Since a hacky workaround (reduce to 1HP) was used to get the
					// droids to play a suitable animation, heal them back to full
					DelayCommand(0.2, UT_HealNPC(oPM1));
				}
			
			DelayCommand(0.5, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(0.6, AssignCommand(oPM1, ActionMoveToObject(oPC, FALSE, 3.0)));
		}
	
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ToggleAI(SW_FLAG_AI_OFF, FALSE));
			DelayCommand(0.1, AssignCommand(oPM2, ClearAllEffects()));
			DelayCommand(0.1, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(0.2, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE)));
			
			if (((GetTag(oPM2) == "HK47") || (GetTag(oPM2) == "T3M4")))
				{
					// Since a hacky workaround (reduce to 1HP) was used to get the
					// droids to play a suitable animation, heal them back to full
					DelayCommand(0.2, UT_HealNPC(oPM2));
				}
			
			DelayCommand(0.5, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(0.6, AssignCommand(oPM2, ActionMoveToObject(oPC, FALSE, 3.0)));
		}
	
	DelayCommand(0.6, ActionResumeConversation());
}
