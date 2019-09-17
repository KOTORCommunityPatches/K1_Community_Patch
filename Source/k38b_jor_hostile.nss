////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires at the end of the scene if Mekel survives, turning Jorak
	hostile. Because droid party members were reduced to 1HP in order to force
	them to play their injured idle anim, provision had to be made to heal them.
	A little extra coaxing was also required for the PC to get them to break out
	of the sleeping anim. Mekel's MinOneHP flag that was added during the torture
	sequence also gets disabled at this point.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_jor_gastrap, k38b_jor_givetab, k38b_init_jorak, k38b_init_jorak1,
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
	
	object oPC = GetPCSpeaker();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	object oJorak = GetObjectByTag("kor38b_jorakuln", 0);
	object oDoor = GetObjectByTag("k38b_door_jorak", 0);
	object oSaber = GetItemPossessedBy(OBJECT_SELF, "G_W_DBLSBR002");
	
	ActionPauseConversation();
	
	NoClicksFor(0.7);
	
	SetLocked(oDoor, FALSE);
	
	SetMinOneHP(oMekel, FALSE);
	
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
			
			DelayCommand(0.5, AssignCommand(oPM1, ActionAttack(oJorak)));
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
			
			DelayCommand(0.5, AssignCommand(oPM2, ActionAttack(oJorak)));
		}
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oMekel, STANDARD_FACTION_FRIENDLY_1);
	
	if (GetIsObjectValid(oSaber))
		{
			ClearAllActions();
			ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON);
		}
	
	DelayCommand(0.5, GN_DetermineCombatRound(oPC));
	DelayCommand(0.5, AssignCommand(oMekel, GN_DetermineCombatRound(oJorak)));
	
	DelayCommand(0.5, ActionResumeConversation());
}
