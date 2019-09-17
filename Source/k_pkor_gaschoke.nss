////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires after the trigger in Jorak Uln's trapped corridor starts
	the cutscene. The party is now walked into the corridor on this node and
	starts choking (or sparking/smoking in the case of droids), in conjunction
	with a static camera adjustment for better framing.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu, k38b_init_jorak,
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
	effect eVFXDrd = EffectVisualEffect(VFX_PRO_DROID_DISABLE);
	effect eVFXGas = EffectVisualEffect(VFX_FNF_GRENADE_POISON);
	location lPC = Location(Vector(105.0,75.0,0.75), 0.0);
	location lPM1 = Location(Vector(101.0,73.5,0.75), 0.0);
	location lPM2 = Location(Vector(101.0,76.5,0.75), 0.0);
	location lGas = Location(Vector(101.0,75.0,0.75), 0.0);
	
	SetGlobalFadeIn(0.0, 1.0);
	
	NoClicksFor(6.0);
	
	ActionPauseConversation();
	
	CP_PartyHerder(lPC, lPM1, lPM2, FALSE, FALSE);
	
	DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFXGas, lPC));
	DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFXGas, lGas));
	
	DelayCommand(3.0, AssignCommand(oPM0, ClearAllActions()));
	DelayCommand(3.0, AssignCommand(oPM0, ActionPlayAnimation(ANIMATION_LOOPING_CHOKE, 1.0, 10.0)));
	
	if (((GetTag(oPM1) != "HK47") && (GetTag(oPM1) != "T3M4")))
		{
			DelayCommand(3.0, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(3.0, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_CHOKE, 1.0, 10.0)));
		}
	else
		{
			DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXDrd, oPM1, 1.0));
		}
	
	if (((GetTag(oPM2) != "HK47") && (GetTag(oPM2) != "T3M4")))
		{
			DelayCommand(3.0, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(3.0, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_CHOKE, 1.0, 10.0)));
		}
	else
		{
			DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFXDrd, oPM2, 1.0));
		}
	
	DelayCommand(6.0, ActionResumeConversation());
}
