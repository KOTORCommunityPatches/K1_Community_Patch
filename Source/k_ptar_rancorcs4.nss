//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_pile_dlg.dlg in tar_m05abc (Taris Upper Sewers).
	
	This is the script that fires at the end of the Rancor scene if the corpse
	pile contains both the odour lure and appropriate grenades. It now destroys
	the original placeable so that it no longer remains interactive after the
	Rancor is dead.
	
	Updated 2021-12-04 to remove any remaining synthesised odours and the Bek
	datapad explaining their use.
	
	Issue #430: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/430
	
	DP 2020-09-09 / DP 2021-12-04												*/
//////////////////////////////////////////////////////////////////////////////////

void CP_DestroyItems() {
	object oPC = GetFirstPC();
	object oItem = GetFirstItemInInventory(oPC);
	while (GetIsObjectValid(oItem))
		{
			if (GetTag(oItem) == "tar05_synthodor" || GetTag(oItem) == "tar05_bekplan")
				{
					DestroyObject(oItem);
				}
			
			oItem = GetNextItemInInventory(oPC);
		}
}

void main() {
	
	object oStampy = GetObjectByTag("tar05_stampy", 0);
	object oPile = GetObjectByTag("tar05_corpsepile", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, TRUE), oStampy);
	
	CP_DestroyItems();
	DestroyObject(oPile, 0.0, TRUE);
	
	GivePlotXP("tar_misc", 20);
	
	DelayCommand(3.0, ActionResumeConversation());
}
