//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	An alternative OnSpawn script for creatures that makes them unequip their
	weapons, then proceeds to the vanilla ambient animations OnSpawn.
	
	See also cp_sp_unequip.
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oRWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
	object oLWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, OBJECT_SELF);
	
	ActionUnequipItem(oRWeapon, TRUE);
	ActionUnequipItem(oLWeapon, TRUE);
	
	DelayCommand(0.1, ExecuteScript("k_def_ambient", OBJECT_SELF, -1));
}
