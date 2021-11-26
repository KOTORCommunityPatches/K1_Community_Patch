//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_carth.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch. Adds a grunt
	for Malak during the showdown on the Leviathan.
	
	Updated 2021/11/26 As part of returning Bastila's equipped gear at the end
	of the Malak showdown on the Leviathan, she now only equips a stunt saber
	if she doesn't already have a saber equipped, in much the same way as Carth
	is already dealt with in the vanilla scene. Since the saber throw she performs
	in this script messes up the equipped weapon, have her unequip any off-hand
	weapon first to be re-equipped in the next shot. Carth's stunt weapon is now
	destroyed in this script, if he has it, while he is still off in the background.
	
	See also k_plev_bastatk, k_plev_destweap, k_plev_malakmov2, k_plev_pause.
	
	Issue #419: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/419
	
	2019-03-18 / DP 2021/11/26													*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBastila = GetObjectByTag("bastila", 0);
	object oMalak = GetObjectByTag("darthmalak400", 0);
	object oCarthGun = GetItemPossessedBy(GetObjectByTag("Carth", 0), "carth_temp_gun");
	talent tSaberThrow = TalentSpell(FORCE_POWER_LIGHT_SABER_THROW);
	
	ActionPauseConversation();
	
	// Preemptively unequip any offhand weapon to be re-equipped after the saber throw.
	AssignCommand(oBastila, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oBastila), TRUE));
	
	// Destroy Carth's stunt weapon, if applicable.
	DestroyObject(oCarthGun);
	
	AssignCommand(oBastila, ActionUseTalentOnObject(tSaberThrow, oMalak));
	
	DelayCommand(1.0, SetDialogPlaceableCamera(30));
	
	DelayCommand(0.05, PlaySound("cb_ls_hitsoft1"));
	DelayCommand(0.25, PlaySound("n_drth_mal_atk2"));
	
	ActionWait(1.75);
	ActionResumeConversation();
}
