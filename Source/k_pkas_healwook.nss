//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_hurt_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This script fires when the player chooses to heal Grrrwahrr. The original
	script didn't conform to the starting conditional check, making no provision
	for party member powers/skills, so those have been added. The medpac item
	check has also been expanded to include all more expensive variants and to
	remove the antidote.
	
	See also k_pkas_heal_y.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-11-21																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oWookiee = GetObjectByTag("kas25_hurt_01");
	object oMedpac = GetItemPossessedBy(oPC, "g_i_medeqpmnt01");
	object oAdvMedpac = GetItemPossessedBy(oPC, "g_i_medeqpmnt02");
	object oLifeSupport = GetItemPossessedBy(oPC, "g_i_medeqpmnt03");
	object oAdvMedpac5x = GetItemPossessedBy(oPC, "g_i_medeqpmnt06");
	object oLifeSupport5x = GetItemPossessedBy(oPC, "g_i_medeqpmnt07");
	
	if (GetHasSpell(FORCE_POWER_HEAL, oPC) || GetHasSpell(FORCE_POWER_CURE, oPC) 
	|| GetHasSpell(FORCE_POWER_HEAL, oPM1) || GetHasSpell(FORCE_POWER_CURE, oPM1)
	|| GetHasSpell(FORCE_POWER_HEAL, oPM2) || GetHasSpell(FORCE_POWER_CURE, oPM2))
		{
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oWookiee);
			
			SetWookieHealedLocal(TRUE, GetArea(OBJECT_SELF));
			
			if (GetHasSpell(FORCE_POWER_HEAL, oPC) || GetHasSpell(FORCE_POWER_CURE, oPC))
				{
					AssignCommand(oPC, ActionCastFakeSpellAtObject(FORCE_POWER_HEAL, oWookiee));
				}
				else if (GetHasSpell(FORCE_POWER_HEAL, oPM1) || GetHasSpell(FORCE_POWER_CURE, oPM1))
					{
						AssignCommand(oPM1, ActionCastFakeSpellAtObject(FORCE_POWER_HEAL, oWookiee));
					}
					else if (GetHasSpell(FORCE_POWER_HEAL, oPM2) || GetHasSpell(FORCE_POWER_CURE, oPM2))
						{
							AssignCommand(oPM2, ActionCastFakeSpellAtObject(FORCE_POWER_HEAL, oWookiee));
						}
		}
		else if (GetSkillRank(SKILL_TREAT_INJURY, oPC) > 0 || GetSkillRank(SKILL_TREAT_INJURY, oPM1) > 0 || GetSkillRank(SKILL_TREAT_INJURY, oPM2) > 0)
			{
				SetWookieHealedLocal(TRUE, GetArea(OBJECT_SELF));
				
				if (GetIsObjectValid(oMedpac) == TRUE)
					{
						UT_AlterItemStack(oMedpac, 1, TRUE);
						
						PlaySound("gui_inject");
						
						ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(FloatToInt(GetMaxHitPoints(OBJECT_SELF) / 2.0)), OBJECT_SELF);
					}
					else if (GetIsObjectValid(oAdvMedpac) == TRUE)
						{
							UT_AlterItemStack(oAdvMedpac, 1, TRUE);
							
							PlaySound("gui_inject");
							
							ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oWookiee);
						}
						else if (GetIsObjectValid(oLifeSupport) == TRUE)
							{
								UT_AlterItemStack(oLifeSupport, 1, TRUE);
								
								PlaySound("gui_inject");
								
								ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oWookiee);
							}
							else if (GetIsObjectValid(oAdvMedpac5x) == TRUE)
								{
									UT_AlterItemStack(oAdvMedpac5x, 1, TRUE);
									
									PlaySound("gui_inject");
									
									ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oWookiee);
								}
								else if (GetIsObjectValid(oLifeSupport5x) == TRUE)
									{
										UT_AlterItemStack(oLifeSupport5x, 1, TRUE);
										
										PlaySound("gui_inject");
										
										ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(500), oWookiee);
									}
			}
}
