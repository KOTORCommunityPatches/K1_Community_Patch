//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_hurt_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This script fires when the player chooses to heal Grrrwahrr. The original
	script didn't conform to the starting conditional check, making no provision
	for party member powers/skills, so those have been added. The medpac item
	check has also been expanded to include all more expensive variants and to
	remove the antidote.
	
	Updated 2021-12-04 to streamline the code, add a Force Heal VFX to Grrrwahrr,
	change the animation the party uses for Force Heal (to stop them moving), and
	add in an animation if using a medpac.
	
	See also k_pkas_heal_y.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-11-21																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void CP_MedpacHeal(object oType) {
	SetWookieHealedLocal(TRUE, GetArea(OBJECT_SELF));
	UT_AlterItemStack(oType, 1, TRUE);
	AssignCommand(GetFirstPC(), ActionPlayAnimation(ANIMATION_FIREFORGET_ACTIVATE));
	PlaySound("gui_inject");
	DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), GetObjectByTag("kas25_hurt_01")));
}

void CP_ForceHeal(object oNPC) {
	object oWookiee = GetObjectByTag("kas25_hurt_01");
	SetWookieHealedLocal(TRUE, GetArea(OBJECT_SELF));
	AssignCommand(oNPC, ActionCastFakeSpellAtObject(FORCE_POWER_LIGHTNING, oWookiee));
	DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAL), oWookiee));
	DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oWookiee));
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oMedpac = GetItemPossessedBy(oPC, "g_i_medeqpmnt01");
	object oAdvMedpac = GetItemPossessedBy(oPC, "g_i_medeqpmnt02");
	object oLifeSupport = GetItemPossessedBy(oPC, "g_i_medeqpmnt03");
	object oAdvMedpac5x = GetItemPossessedBy(oPC, "g_i_medeqpmnt06");
	object oLifeSupport5x = GetItemPossessedBy(oPC, "g_i_medeqpmnt07");
	
	if (GetHasSpell(FORCE_POWER_CURE, oPC) || GetHasSpell(FORCE_POWER_HEAL, oPC))
		{
			CP_ForceHeal(oPC);
		}
		else if (GetHasSpell(FORCE_POWER_CURE, oPM1) || GetHasSpell(FORCE_POWER_HEAL, oPM1))
			{
				CP_ForceHeal(oPM1);
			}
			else if (GetHasSpell(FORCE_POWER_CURE, oPM2) || GetHasSpell(FORCE_POWER_HEAL, oPM2))
				{
					CP_ForceHeal(oPM2);
				}
				else if (GetSkillRank(SKILL_TREAT_INJURY, oPC) > 0 || GetSkillRank(SKILL_TREAT_INJURY, oPM1) > 0 || GetSkillRank(SKILL_TREAT_INJURY, oPM2) > 0)
					{
						if (GetIsObjectValid(oMedpac))
							{
								CP_MedpacHeal(oMedpac);
							}
							else if (GetIsObjectValid(oAdvMedpac))
								{
									CP_MedpacHeal(oAdvMedpac);
								}
								else if (GetIsObjectValid(oLifeSupport))
									{
										CP_MedpacHeal(oLifeSupport);
									}
									else if (GetIsObjectValid(oAdvMedpac5x))
										{
											CP_MedpacHeal(oAdvMedpac5x);
										}
										else if (GetIsObjectValid(oLifeSupport5x))
											{
												CP_MedpacHeal(oLifeSupport5x);
											}
					}
}
