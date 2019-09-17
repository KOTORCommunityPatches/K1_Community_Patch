////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptar_brejikatk
	
	Starts the fight after the swoop race. Edited to make Redros equip a weapon,
	then executes the original code.
	
	Issue #59: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/59
	
	JC 2019-05-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oRedros = GetObjectByTag("Redros", 0);
	
	AssignCommand(oRedros, CP_EquipFirstWeapon(oRedros));
	DelayCommand(0.2, ExecuteScript("cp_tar_brejikatk", OBJECT_SELF, -1));

}
