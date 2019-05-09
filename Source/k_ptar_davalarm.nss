////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davguest81/2/3.dlg in tar_m08aa (Taris Davik's Estate).

	This is an intermediary script that fires when certain guest conversations
	end with the subject going hostile. If the creature is unarmed, it equips
	the first weapon in their inventory before firing the original script that
	summons the nearest guards. Done to prevent the attacking with fists AI
	problem. See also cp_tar08_davalrm.

	DP 2019-05-09                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	AssignCommand(OBJECT_SELF, CP_EquipFirstWeapon(OBJECT_SELF));
	//Fire original alarm script
	DelayCommand(0.2, ExecuteScript("cp_tar08_davalrm", OBJECT_SELF, -1));
}