////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptar_basealert
	
	Fires if the player opens a security door in the Bek base, making the Beks
	go hostile.	Edited to make the Beks equip their weapons properly and react
	to the intrusion.
	
	JC 2019-05-06                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_generic"
#include "cp_inc_k1"

void main() {

if( GetGlobalBoolean("Tar_KandonMission") ) {
	object oAreaObject;
	SetLocked(OBJECT_SELF, 0);
	ActionOpenDoor(OBJECT_SELF);
	SetGlobalBoolean("TAR_BEKSHOSTILE", 1);
	BarkString(OBJECT_INVALID, 38453);
	oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while( GetIsObjectValid(oAreaObject) ) {
		if( !IsObjectPartyMember(oAreaObject) ) {
			AssignCommand(oAreaObject, ClearAllActions());
			AssignCommand(oAreaObject, CP_EquipFirstWeapon(oAreaObject));
			DelayCommand(0.2, ChangeToStandardFaction(oAreaObject, 1));
			DelayCommand(0.3, AssignCommand(oAreaObject, GN_DetermineCombatRound(OBJECT_INVALID)));
			}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
		}
	}
}