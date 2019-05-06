////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptar_basealert
	
	Fires if the player goes to assassinate Gadon, making the Beks hostile.
	Edited to make the Beks equip their weapons properly.
	
	JC 2019-05-06                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_generic"
#include "cp_inc_k1"

void main() {

object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
while( GetIsObjectValid(oAreaObject) ) {
	if( !IsObjectPartyMember(oAreaObject) ) {
		AssignCommand(oAreaObject, ClearAllActions());
		AssignCommand(oAreaObject, CP_EquipFirstWeapon(oAreaObject));
		DelayCommand(0.2, ChangeToStandardFaction(oAreaObject, 1));
		DelayCommand(0.3, AssignCommand(oAreaObject, GN_DetermineCombatRound(OBJECT_INVALID)));
		}
	oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
SetGlobalBoolean("TAR_BEKSHOSTILE", 1);

}