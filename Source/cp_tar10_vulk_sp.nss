////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn script for some Vulkar mooks in tar_m10aa (Taris Black Vulkar
	Base Upper).

	This is an intermediary OnSpawn script to have a couple of the unequipped
	Vulkars in the pool area equip the weapons they have in their inventory
	when they spawn in order to prevent them attacking with their fists. It
	simply issues that command and then fires their original OnSpawn.

	Issue #64: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/64

	DP 2019-05-08                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	AssignCommand(OBJECT_SELF, CP_EquipFirstWeapon(OBJECT_SELF));
	
	//Fire original OnSpawn
	DelayCommand(0.2, ExecuteScript("k_ptar_ambcom_sp", OBJECT_SELF, -1));
}
