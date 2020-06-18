//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_brejik031.dlg in tar_m03af (Taris Swoop Platform).
	
	Script that fires on Bejik's final line in the Taris Swoop Race finale cutscene.
	Since he had his blaster removed on spawn-in, it is now reequipped for the
	impending combat. Ditto for the player, since their weapons were unequipped to
	prevent them self-impaling during the bowing scene.
	
	See also cp_tar03_brejfce, k_ptar_brejikatk, k_ptar_brejik_sp, k_ptar_dieswoopy,
	k_ptar_swpie_ud.
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	DP 2020-06-18																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_WeapEquip() {
	
	object oPC = GetFirstPC();
	object oStoreR = GetObjectByTag("cp_tar03_pchandr");
	object oStoreL = GetObjectByTag("cp_tar03_pchandl");
	object oRWeapStore = GetFirstItemInInventory(oStoreR);
	object oLWeapStore = GetFirstItemInInventory(oStoreL);
	object oRWeap;
	object oLWeap;
		
	if (GetIsObjectValid(oRWeapStore))
		{
			oRWeap = GetFirstItemInInventory(oPC);
			
			while (GetIsObjectValid(oRWeap))
				{
					if (GetTag(oRWeap) == GetTag(oRWeapStore))
						{
							AssignCommand(oPC, ActionEquipItem(oRWeap, INVENTORY_SLOT_RIGHTWEAPON, FALSE));
							DestroyObject(oStoreR);
							break;
						}
						else
							{
								oRWeap = GetNextItemInInventory(oPC);
							}
				}
		}
	
	if (GetIsObjectValid(oLWeapStore))
		{
			oLWeap = GetFirstItemInInventory(oPC);
			
			while (GetIsObjectValid(oLWeap))
				{
					if (GetTag(oLWeap) == GetTag(oLWeapStore))
						{
							AssignCommand(oPC, ActionEquipItem(oLWeap, INVENTORY_SLOT_LEFTWEAPON, FALSE));
							DestroyObject(oStoreL);
							break;
						}
						else
							{
								oLWeap = GetNextItemInInventory(oPC);
							}
				}
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oBrejik = GetObjectByTag("Brejik031", 0);
	object oBlaster = GetItemPossessedBy(oBrejik, "g_w_blstrpstl001");
	
	AssignCommand(oBrejik, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTWEAPON, TRUE));
	
	CP_WeapEquip();
	DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_READY, 1.0, 5.081)));
}
