////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired during the final showdown in korr_m39aa (Tomb of Naga Sadow).
	
	Fix by AFP that makes sure Yuthura uses both of her weapons rather than
	just one.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oPC = GetFirstPC();
	object oYuthura = GetObjectByTag("kor39_yuthura", 0);
	object oDblSaber = GetItemPossessedBy(OBJECT_SELF, "G_W_DBLSBR002");
	object oSaber = GetItemPossessedBy(oYuthura, "g_w_lghtsbr02");
	object oShtSaber = GetItemPossessedBy(oYuthura, "g_w_shortsbr02");
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oYuthura, STANDARD_FACTION_HOSTILE_1);
	
	SetGlobalNumber("KOR39_SITH_HOSTILE", 3);
	
	if (GetIsObjectValid(oDblSaber))
		{
			object oRWeap = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
			
			if ((!GetIsObjectValid(oRWeap)))
				{
					ClearAllActions();
					ActionEquipItem(oDblSaber, INVENTORY_SLOT_RIGHTWEAPON);
				}
		}
	
	if (GetIsObjectValid(oSaber))
		{
			object oRWeapYuth = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oYuthura);
			
			if ((!GetIsObjectValid(oRWeapYuth)))
				{
					AssignCommand(oYuthura, ClearAllActions());
					AssignCommand(oYuthura, ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON));
				}
		}
	
	if (GetIsObjectValid(oShtSaber))
		{
			object oLWeapYuth = GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oYuthura);
			
			if ((!GetIsObjectValid(oLWeapYuth)))
				{
					AssignCommand(oYuthura, ActionEquipItem(oShtSaber, INVENTORY_SLOT_LEFTWEAPON));
				}
		}
	
	SetMinOneHP(OBJECT_SELF, FALSE);
	SetMinOneHP(oYuthura, FALSE);
	
	DelayCommand(1.0, GN_DetermineCombatRound(oPC));
	DelayCommand(1.0, AssignCommand(oYuthura, GN_DetermineCombatRound(oPC)));
}
