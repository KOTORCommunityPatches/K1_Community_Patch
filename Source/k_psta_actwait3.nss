////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta_malak1.dlg in sta_m45aa (Star Forge Deck 1).
	
	This script fires at the start of the Malak "send out the droids" cutscene.
	It turns the player controlled character (and thus any companions) 180° to
	face the door closing and locking behind them. The only change is to turn
	the party back around again (off-screen) so that they aren't still staring
	at the door in the subsequent scenes. See also k_psta_doorx1 and k_psta_doorx2.
	
	DP 2019-06-27                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oJump0_WP = GetNearestObjectByTag("STA_JUMP0_WP", OBJECT_SELF, 1);
	object oJump1_WP = GetNearestObjectByTag("STA_JUMP1_WP", OBJECT_SELF, 1);
	object oJump2_WP = GetNearestObjectByTag("STA_JUMP2_WP", OBJECT_SELF, 1);
	object oDoor = GetNearestObjectByTag("sta_door_unlock1", OBJECT_SELF, 1);
	float fDirection = 90.0;
	
	CancelCombat(oPM1);
	CancelCombat(oPM2);
	
	UT_ActionPauseConversation(4.5);
	
	UT_TeleportWholeParty(oJump0_WP, oJump1_WP, oJump2_WP);
	
	CancelCombat(oPM1);
	CancelCombat(oPM2);
	
	DelayCommand(0.3, AssignCommand(oPM0, SetFacing(fDirection)));
	DelayCommand(0.3, AssignCommand(oPM1, SetFacing(fDirection)));
	DelayCommand(0.3, AssignCommand(oPM2, SetFacing(fDirection)));
	
	DelayCommand(1.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
	
	DelayCommand(1.4, SetDialogPlaceableCamera(19));
	
	DelayCommand(2.2, SetLocked(oDoor, TRUE));
	
	DelayCommand(2.3, DestroyObject(GetObjectByTag("sta_Jedi001", 0), 0.0, 0, 0.0));
	DelayCommand(2.3, DestroyObject(GetObjectByTag("sta_Jedi002", 0), 0.0, 0, 0.0));
	DelayCommand(2.3, DestroyObject(GetObjectByTag("sta_Jedi003", 0), 0.0, 0, 0.0));
	DelayCommand(2.3, DestroyObject(GetObjectByTag("sta_Jedi004", 0), 0.0, 0, 0.0));
	
	// Have the party turn back around to face away from the door
	DelayCommand(3.3, AssignCommand(oPM0, SetFacing(270.0)));
	DelayCommand(3.3, AssignCommand(oPM1, SetFacing(270.0)));
	DelayCommand(3.3, AssignCommand(oPM2, SetFacing(270.0)));
}
