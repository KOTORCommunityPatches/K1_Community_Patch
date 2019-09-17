////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pebo_hk47x
	
	Post-Leviathan cleanup for HK. Gives him all the stat bonuses he can get if
	you repair him because you can't repair him after this scene.
	
	Issue #3: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/3
	
	JC 2019-05-14                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oHK = GetObjectByTag("HK47", 0);
	object oOldHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oHK);
	object oNewHide = CreateItemOnObject("g_i_crhide012", oHK);

	if (GetIsObjectValid(oOldHide))
		{
			DestroyObject(oOldHide);
		}
	
	AssignCommand(oHK, ActionEquipItem(oNewHide, INVENTORY_SLOT_CARMOUR, TRUE));
	SetGlobalBoolean("Ebo_HK47", TRUE);
}
