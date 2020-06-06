//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_kas22_elikill.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	One of several scripts that fire during the new cutscene showing Matton kill
	Eli after the player brings him the droid head from the Shadowlands. In the
	vanilla game, Eli is killed outside a cutscene and the player is required to
	manually reinitiate dialogue with Matton, so this has been changed to add this
	interstitial scene that bridges to Matton's conversation. This initial script
	has Matton re-equip his blaster, since he was changed to unequip it in his
	OnSpawn.
	
	See also cp_kas22_matatk0, cp_kas22_matatk2, cp_kas22_matatk3, cp_kas22_matatk4,
	k_pkas_dasolatck.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBlaster = GetItemPossessedBy(OBJECT_SELF, "g_w_blstrpstl001");
	location lMatt = Location(Vector(114.476,88.861,62.876), 15.0);
	
	ActionPauseConversation();
	
	// Simplification of Kashyyyk include function SetEliDeadLocal
	// 0 = SW_PLOT_BOOLEAN_01
	SetLocalBoolean(OBJECT_SELF, 0, TRUE);
	
	// Set a local for Eli's OnDeath to check against
	SetLocalBoolean(OBJECT_SELF, 58, TRUE);
	
	// Standing so close to Eli apparently cramps Matton's combat style, so move him back a bit.
	ActionMoveToLocation(lMatt, FALSE);
	
	ActionDoCommand(SetFacing(15.0));
	
	ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTWEAPON, FALSE);
	ActionPlayAnimation(ANIMATION_LOOPING_READY, 1.0, 1.4);
	
	ActionResumeConversation();
}
