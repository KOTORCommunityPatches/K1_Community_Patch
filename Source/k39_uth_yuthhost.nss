////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired during the final showdown in korr_m39aa (Tomb of Naga Sadow).
	
	Fix by AFP that makes sure Yuthura uses both of her weapons rather than
	just one.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oYuthura = GetObjectByTag("kor39_yuthura", 0);
	object oPC = GetFirstPC();
	object oSaber = GetItemPossessedBy(oYuthura, "g_w_lghtsbr02");
	object oShtSaber = GetItemPossessedBy(oYuthura, "g_w_shortsbr02");
	
	ChangeToStandardFaction(oYuthura, 1);
	
	SetGlobalNumber("KOR39_SITH_HOSTILE", 1);
	
	if (GetIsObjectValid(oSaber))
		{
			object oRWeap = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oYuthura);
			
			if ((!GetIsObjectValid(oRWeap)))
				{
					AssignCommand(oYuthura, ClearAllActions());
					AssignCommand(oYuthura, ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON));
				}
		}
	
	if (GetIsObjectValid(oShtSaber))
		{
			object oLWeap = GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oYuthura);
			
			if ((!GetIsObjectValid(oLWeap)))
				{
					AssignCommand(oYuthura, ActionEquipItem(oShtSaber, INVENTORY_SLOT_LEFTWEAPON));
				}
		}
	
	SetMinOneHP(oYuthura, FALSE);
	
	DelayCommand(1.0, AssignCommand(oYuthura, GN_DetermineCombatRound(oPC)));
}
