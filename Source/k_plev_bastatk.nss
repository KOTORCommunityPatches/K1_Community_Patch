//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_carth.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	As part of returning Bastila's equipped gear at the end of the Malak showdown
	on the Leviathan, she now only equips a stunt saber if she doesn't already
	have a saber equipped, in much the same way as Carth is already dealt with
	in the vanilla scene. Since the use of the saber throw power on the previous
	node apparently causes the equipped weapon to turn invisible, she is given
	a command to unequip and re-equip it. The original script simply spawned
	another stunt saber on her and made her equip that. In order to properly
	re-equip a dual wield setup, the item tag names are grabbed from invisible
	placeables that her equipped weapons were duplicated onto earlier in the
	scene.
	
	See also k_plev_destweap, k_plev_finale1, k_plev_malakmov2, k_plev_pause.
	
	Issue #419: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/419
	
	DP 2021/11/26																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMalak = GetObjectByTag("darthmalak400", 0);
	object oBastila = GetObjectByTag("bastila", 0);
	object oBastRW = GetFirstItemInInventory(GetObjectByTag("lev_invis_conv_target1", 0));
	object oBastLW = GetFirstItemInInventory(GetObjectByTag("lev_invis_conv_target2", 0));
	
	ActionPauseConversation();
	
	NoClicksFor(5.0);
	
	CancelCombat(oBastila);
	
	AssignCommand(oMalak, ClearAllActions());
	
	// Re-equip Bastila to account for the saber throw causing screwiness. Make provision for a dual wield case.
	DelayCommand(0.25, AssignCommand(oBastila, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oBastila), TRUE)));
	DelayCommand(0.5, AssignCommand(oBastila, ActionEquipItem(GetItemPossessedBy(OBJECT_SELF, GetTag(oBastRW)), INVENTORY_SLOT_LEFTWEAPON, TRUE)));
	DelayCommand(0.8, AssignCommand(oBastila, ActionEquipItem(GetItemPossessedBy(OBJECT_SELF, GetTag(oBastLW)), INVENTORY_SLOT_LEFTWEAPON, TRUE)));
	DelayCommand(1.0, SetLightsaberPowered(oBastila, TRUE, TRUE, FALSE));
	
	DelayCommand(1.0, AssignCommand(oMalak, CutsceneAttack(oBastila, 115, ATTACK_RESULT_HIT_SUCCESSFUL, 0)));  // 115 = F2A3, single saber Power Attack
	
	DelayCommand(5.0, ActionResumeConversation());
}
