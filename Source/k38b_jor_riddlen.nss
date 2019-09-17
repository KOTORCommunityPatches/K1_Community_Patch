////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires whenever the player answers a question incorrectly (or
	refuses to answer), causing Jorak to shock them with lightning. Some of
	the timings were adjusted to better match the effects to the animations
	and the screams were replaced with player soundset versions. The sleeping
	anims for Mekel and the companions were also lengthened, as per the other
	scripts modified in this scene.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_jor_gastrap, k38b_init_jorak, k38b_init_jorak1, k38b_jor_givetab,
	k38b_jor_hostile, and k38b_jor_riddley.
	
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
	object oSndLig = GetObjectByTag("k38b_snd_lghtnng", 0);
	int nCurHP = GetCurrentHitPoints(oPC);
	int nDamHP = (nCurHP / 4);
	effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING_DARK_S, OBJECT_SELF, BODY_NODE_HAND);
	effect eDamage = EffectDamage(nDamHP, DAMAGE_TYPE_ELECTRICAL);
	effect eVFX = EffectVisualEffect(VFX_PRO_LIGHTNING_S);
	
	ActionPauseConversation();
		
	AssignCommand(oPC, ClearAllActions());
	ActionCastFakeSpellAtObject(FORCE_POWER_LIGHTNING, oPC);
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
	DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oPC, 0.4));
	DelayCommand(1.2, SoundObjectPlay(oSndLig));
	DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oPC, 1.8));
	DelayCommand(1.2, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 2.0)));

	if ((GetGender(oPC) == GENDER_FEMALE))
		{
			PlaySound("p_plyerfw_hit5");
		}
		else
			{
				PlaySound("p_plyermw_hit6");
			}
	
	
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
	
	if (GetIsObjectValid(oMekel))
		{
			AssignCommand(oMekel, ClearAllActions());
			AssignCommand(oMekel, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
		}
	
	DelayCommand(1.0, ActionResumeConversation());
}
