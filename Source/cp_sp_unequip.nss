////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_sp_unequip
	
	OnSpawn script for creatures that makes them unequip their weapons.
	
	JC 2019-05-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oRWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
	object oLWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, OBJECT_SELF);
	
	ActionUnequipItem(oRWeapon, TRUE);
	ActionUnequipItem(oLWeapon, TRUE);
	DelayCommand(0.1, ExecuteScript("k_def_spawn01", OBJECT_SELF, -1));
}
