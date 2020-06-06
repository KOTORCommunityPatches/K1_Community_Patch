//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_kas22_elikill.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	One of several scripts that fire during the new cutscene showing Matton kill
	Eli after the player brings him the droid head from the Shadowlands. In the
	vanilla game, Eli is killed outside a cutscene and the player is required to
	manually reinitiate dialogue with Matton, so this has been changed to add this
	interstitial scene that bridges to Matton's conversation. This script sets him
	back to neutral and unequips his blaster.
	
	See also cp_kas22_matatk0, cp_kas22_matatk1, cp_kas22_matatk2, cp_kas22_matatk4,
	k_pkas_dasolatck.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	location lMatt = Location(Vector(116.402,89.399,62.876), -42.0);
	
	CancelCombat(OBJECT_SELF);
	
	ClearAllActions();
	
	ActionPauseConversation();
	
	// Since Matton was moved backwards at the start of the scene, walk him back to his original position.
	ActionMoveToLocation(lMatt, FALSE);
	
	ActionDoCommand(SetFacing(-50.0));
	
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF), FALSE);
	
	// AI is reactivated
	SetLocalBoolean(OBJECT_SELF, 62, FALSE);
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
	
	ActionWait(1.0);
	
	ActionResumeConversation();
}
