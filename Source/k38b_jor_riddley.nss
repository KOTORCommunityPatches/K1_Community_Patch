////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires whenever the player answers a question correctly, causing
	Jorak to shock Mekel with lightning. Some of the timings were adjusted to
	better match the effects to the animations and the scream was replaced
	with one of Trask's. Additionally, Mekel was given a MinOneHP flag in order
	to prevent him being killed instantly on the third occasion he is shocked,
	before the VFXs have a chance to display. The sleeping anims for the player
	and the companions was also lengthened, as per the other scripts modified in
	this scene.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_jor_gastrap, k38b_init_jorak, k38b_init_jorak1, k38b_jor_givetab,
	k38b_jor_hostile, and k38b_jor_riddlen.
	
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
	vector vJorak = GetPosition(OBJECT_SELF);
	int nMaxHP = GetMaxHitPoints(oMekel);
	int nDamHP = (nMaxHP / 3);
	int nTorture = GetGlobalNumber("KOR38B_MEKEL_TORTURE");
	effect eDamage = EffectDamage(nDamHP, DAMAGE_TYPE_ELECTRICAL);
	effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING_DARK_S, OBJECT_SELF, BODY_NODE_HAND);
	effect eVFX = EffectVisualEffect(VFX_PRO_LIGHTNING_S);
	
	ActionPauseConversation();
	
	SetMinOneHP(oMekel, TRUE);
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
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
		
	ActionCastFakeSpellAtObject(FORCE_POWER_LIGHTNING, oMekel);
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oMekel);
	PlaySound("p_trask_hit1");
	
	AssignCommand(oMekel, ClearAllActions());
	DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oMekel, 0.4));
	DelayCommand(1.2, SoundObjectPlay(oSndLig));
	DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, oMekel, 2.0));
	DelayCommand(1.2, AssignCommand(oMekel, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 2.0)));

	nTorture = (nTorture + 1);
	SetGlobalNumber("KOR38B_MEKEL_TORTURE", nTorture);
	
	if ((nTorture == 3))
		{
			SetGlobalNumber("KOR_MEKEL_KILLED", 1);
			DelayCommand(2.3, SetMinOneHP(oMekel, FALSE));
			DelayCommand(2.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, TRUE), oMekel));
			DelayCommand(2.3, ActionResumeConversation());
		}
		else
			{
				DelayCommand(0.5, ActionResumeConversation());
			}
}
