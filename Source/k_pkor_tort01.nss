//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_torturer.dlg in korr_m35aa (Korriban Sith Academy).
	
	This script fires on the exit node of the torturer's DLG when the player chooses
	to fight them after interrogating the Mando prisoner in the Korriban Sith Academy.
	In the subsequent fight, the party members had a tendency to stand around watching,
	so everyone now gets a prompt into action. The torturer also equips his weapon
	before turning hostile to prevent any attacking with fists shenanigans.
	
	See also k35_init_torture, k35_plc_startvic, k35_tor_move, k35_vic_collapse,
	k35_vic_drugged, k35_vic_narc, k_pkor_destvictm, k_pkor_painreset.
	
	Issue #434: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/434
	
	DP 2023-08-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSaber = GetItemPossessedBy(OBJECT_SELF, "G_W_DBLSBR002");
	
	SetGlobalNumber("KOR_TORT_END", 2);
	
	if (GetIsObjectValid(oSaber))
		{
			ClearAllActions();
			ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON);
		}
	
	DelayCommand(0.3, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.5, GN_DetermineCombatRound());
	
	DelayCommand(0.5, AssignCommand(oPC, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oPM2, GN_DetermineCombatRound()));
}
