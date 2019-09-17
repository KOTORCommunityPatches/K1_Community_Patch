////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).

	This script is fired at the end of the conversation with Lashowe if you
	agreed to help her kill a Tukata mother to get a holocron. It sets the
	faction states of the Tukata and Lashowe and assigns attack orders. In
	the vanilla script, Lashowe is ordered to attack Tukata mook 1, but Mook
	1 itself is given no attack orders, so it has now been assigned to attack
	Lashowe. Mook 2 was originally ordered to attack the PC along with the
	mother, but it has now been ordered to attack the closest non-PC party
	member (or the PC if solo). Additionally, since the Tukata AI was toggled
	off when they spawned in, it is now turned back on so they can engage in
	combat.
	
	See also k_pkor_lashqueen and k_pkor_lashtukat.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void ToggleAI(int nIndex, int nState) {
	SetLocalBoolean(OBJECT_SELF, nIndex, nState);
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oLash = GetObjectByTag("kor36_lashowe", 0);
	object oTukQueen = GetObjectByTag("kor36_tukataquee", 0);
	object oTukMook1 = GetObjectByTag("kor36_tukatahen1", 0);
	object oTukMook2 = GetObjectByTag("kor36_tukatahen2", 0);
	object oSaber = GetItemPossessedBy(OBJECT_SELF, "g_w_lghtsbr01");
	
	SetPlotFlag(OBJECT_SELF, TRUE);
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_FRIENDLY_1);
	
	AssignCommand(oTukQueen, ToggleAI(SW_FLAG_AI_OFF, FALSE));
	AssignCommand(oTukMook1, ToggleAI(SW_FLAG_AI_OFF, FALSE));
	AssignCommand(oTukMook2, ToggleAI(SW_FLAG_AI_OFF, FALSE));
	
	ChangeToStandardFaction(oTukQueen, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oTukMook1, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oTukMook2, STANDARD_FACTION_HOSTILE_1);
	
	AssignCommand(oTukMook1, ActionAttack(oLash));
	AssignCommand(oTukQueen, ActionAttack(oPC));
	
	if (GetIsObjectValid(oPM1))
		{
			if (GetIsObjectValid(oPM2) && GetDistanceBetween(oTukMook2, oPM2) < GetDistanceBetween(oTukMook2, oPM1))
				{
					AssignCommand(oTukMook2, ActionAttack(oPM2));
				}
					else
						{
							AssignCommand(oTukMook2, ActionAttack(oPM1));
						}
		}
			else
				{
					AssignCommand(oTukMook2, ActionAttack(oPC));
				}
	
	if (GetIsObjectValid(oSaber))
		{
			object oEquipped = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
			
			if ((!GetIsObjectValid(oEquipped)))
				{
					ClearAllActions();
					ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON);
				}
		}
	
	DelayCommand(0.5, ActionAttack(oTukMook1));
}
