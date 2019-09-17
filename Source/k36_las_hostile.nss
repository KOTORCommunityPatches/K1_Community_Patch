////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).

	This script causes Lashowe to go hostile if you refuse to let her keep
	the holocron after the battle with the Tukata mother. The override on
	her saber is disabled so she can ignite it again in the following battle.
	
	See also k_pkor_las36!plt.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oSaber = GetItemPossessedBy(OBJECT_SELF, "g_w_lghtsbr01");
	object oPC = GetFirstPC();
	
	// Turn saber blade override off, since she's about to use it again
	SetLightsaberPowered(OBJECT_SELF, FALSE, FALSE, FALSE);
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	
	if (GetIsObjectValid(oSaber))
		{
			object oEqipped = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
			
			if ((!GetIsObjectValid(oEqipped)))
				{
					ClearAllActions();
					ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON, FALSE);
				}
		}
	
	DelayCommand(0.5, GN_DetermineCombatRound(oPC));
}
