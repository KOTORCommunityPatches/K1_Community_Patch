//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting conditional for kas25_hurt_01.dlg in kas_m25aa (Kashyyyk Lower
	Shadowlands).
	
	This is the starting conditional that checks whether the PC has the ability
	to heal Grrrwahrr, either via a Force power or medpac. The original script
	was a bit odd in that one of the items it checked for was the antibiotic, but
	it left out some of the higher priced medpack variants. It has been adjusted
	to account for them and remove the antibiotic. Additionally, the heal script
	checks for SKILL_TREAT_INJURY, so that has also been added here.
	
	See also k_pkas_healwook.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-11-21																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oMedpac = GetItemPossessedBy(oPC, "g_i_medeqpmnt01");
	object oAdvMedpac = GetItemPossessedBy(oPC, "g_i_medeqpmnt02");
	object oLifeSupport = GetItemPossessedBy(oPC, "g_i_medeqpmnt03");
	object oAdvMedpac5x = GetItemPossessedBy(oPC, "g_i_medeqpmnt06");
	object oLifeSupport5x = GetItemPossessedBy(oPC, "g_i_medeqpmnt07");
	
	if (GetHasSpell(FORCE_POWER_HEAL, oPC) || GetHasSpell(FORCE_POWER_CURE, oPC)
	|| GetHasSpell(FORCE_POWER_HEAL, oPM1) || GetHasSpell(FORCE_POWER_CURE, oPM1)
	|| GetHasSpell(FORCE_POWER_HEAL, oPM2) || GetHasSpell(FORCE_POWER_CURE, oPM2))
		{
			return TRUE;
		}
		else if (GetIsObjectValid(oMedpac) || GetIsObjectValid(oAdvMedpac) || GetIsObjectValid(oLifeSupport) || GetIsObjectValid(oAdvMedpac5x) || GetIsObjectValid(oLifeSupport5x))
			{
				if (GetSkillRank(SKILL_TREAT_INJURY, oPC) > 0 || GetSkillRank(SKILL_TREAT_INJURY, oPM1) > 0 || GetSkillRank(SKILL_TREAT_INJURY, oPM2) > 0)
					{
						return TRUE;
					}
					else
						{
							return FALSE;
						}
			}
	
	return FALSE;
}
