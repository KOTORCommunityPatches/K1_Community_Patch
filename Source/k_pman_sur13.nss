//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by man28_sur3.dlg in manm28ac (Manaan Hrakert Kolto Control).
	
	Fires if the player chooses to kill the surviving scientists in the Hrakert
	rift. Has them equip their weapons, then executes the original script that
	makes them hostile.
	
	Updated 2023-10-18 to merge the added contents into the vanilla script, since
	that can now be decompiled.
	
	Issue #94: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/94
	
	JC 2019-05-06 / DP 2023-10-18												*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oSami = GetObjectByTag("man28_sur4", 0);
	
	ActionEquipMostDamagingMelee();
	AssignCommand(oSami, ActionEquipMostDamagingRanged());

	DelayCommand(0.1, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_2));
 	DelayCommand(0.1, ChangeToStandardFaction(oSami, STANDARD_FACTION_HOSTILE_2));
 	
	DelayCommand(0.2, GN_DetermineCombatRound());
	DelayCommand(0.2, AssignCommand(oSami, GN_DetermineCombatRound()));
 }
