////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn script for some Spice Lab Techs tar_m08aa (Taris Davik's Estate).

	This is an intermediary OnSpawn script to have a couple of the unequipped
	Rodians in the Spice Lab equip the weapons they have in their inventory
	when they spawn in order to prevent them attacking with their fists. It
	simply issues that command and then fires their original OnSpawn.

	DP 2019-05-09                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	AssignCommand(OBJECT_SELF, CP_EquipFirstWeapon(OBJECT_SELF));
	//Fire original OnSpawn
	DelayCommand(0.2, ExecuteScript("k_def_spawn01", OBJECT_SELF, -1));
}