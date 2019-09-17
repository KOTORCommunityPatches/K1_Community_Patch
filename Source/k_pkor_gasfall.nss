////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires on the subsequent node to the party walking into the corridor,
	causing them to fall down. Because droids have no prone animation, in the
	vanilla version they would just stand there, so as a hacky workaround they
	are reduced to 1HP in order to force them to play their injured idle anim.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_jorakmove, k_pkor_jorstunmu, k38b_init_jorak,
	k38b_init_jorak1, k38b_jor_gastrap, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM0 = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	AssignCommand(oPM0, ClearAllActions());
	AssignCommand(oPM0, SetFacing(DIRECTION_EAST));
	AssignCommand(oPM0, ActionPlayAnimation(ANIMATION_LOOPING_PRONE, 1.0, 90.0));
	
	if (((GetTag(oPM1) != "HK47") && (GetTag(oPM1) != "T3M4")))
		{
			AssignCommand(oPM1, ClearAllActions());
			AssignCommand(oPM1, SetFacing(DIRECTION_EAST));
			AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PRONE, 1.0, 90.0));
		}
	else
		{
			int nPM1_HP = GetCurrentHitPoints(oPM1);
			int nDamage1 = nPM1_HP - 1;
			effect eDamage1 = EffectDamage(nDamage1, DAMAGE_TYPE_UNIVERSAL);
			
			AssignCommand(oPM1, ClearAllActions());
			ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage1, oPM1);
		}
	
	if (((GetTag(oPM2) != "HK47") && (GetTag(oPM2) != "T3M4")))
		{
			AssignCommand(oPM2, ClearAllActions());
			AssignCommand(oPM2, SetFacing(DIRECTION_EAST));
			AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PRONE, 1.0, 90.0));
		}
	else
		{
			int nPM2_HP = GetCurrentHitPoints(oPM2);
			int nDamage2 = nPM2_HP - 1;
			effect eDamage2 = EffectDamage(nDamage2, DAMAGE_TYPE_UNIVERSAL);
			
			AssignCommand(oPM2, ClearAllActions());
			ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage2, oPM2);
		}
	
	DelayCommand(3.0, ActionResumeConversation());
}
