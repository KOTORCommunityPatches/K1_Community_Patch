#include "k_inc_generic"

void ToggleAI(int nIndex, int nState) {
	SetLocalBoolean(OBJECT_SELF, nIndex, nState);
}

void main() {
	
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	object oJorak = GetObjectByTag("kor38b_jorakuln", 0);
	object oPC = GetPCSpeaker();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oDoor = GetObjectByTag("k38b_door_jorak", 0);
	object oSaber = GetItemPossessedBy(OBJECT_SELF, "G_W_DBLSBR002");
	
	SetLocked(oDoor, FALSE);
	
	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ToggleAI(SW_FLAG_AI_OFF, FALSE));
		}
	
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ToggleAI(SW_FLAG_AI_OFF, FALSE));
		}
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oMekel, STANDARD_FACTION_FRIENDLY_1);
	
	if (GetIsObjectValid(oSaber))
		{
			ClearAllActions();
			ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON);
		}
	
	DelayCommand(0.5, GN_DetermineCombatRound(oPC));
	DelayCommand(0.5, AssignCommand(oMekel, GN_DetermineCombatRound(oJorak)));
}
