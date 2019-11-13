//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_brejik031.dlg in tar_m03af (Taris Swoop Platform).
	
	Starts the fight after the swoop race. Edited to make Redros equip a weapon,
	then executes the original code.
	
	Issue #59: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/59
	
	JC 2019-05-07
	
//////////////////////////////////////////////////////////////////////////////////
	
	Updated to hide the PC's weapons the post-final race sequence where they bow,
	typically skewering themselves through the head if they have a sword equipped.
	The scene can't be set to hide weapons directly in the DLG, because Bastila
	needs to be shown with a weapon equipped when breaking out of her cage. Instead,
	whatever weapons the player has equipped are duplicated in a couple of invisible
	placeables and they are unequipped. The duplicates act as references to grab the
	item tags from in order to reequip the player when the conversation ends. Since
	the player was unequipped during the prior scene after their last heat, they
	need to be reequipped at the end of this scene when Brejik goes hostile.
	
	See also k_ptar_playermec, k_ptar_swoop0, k_ptar_swoopnew.
	
	Issue #301: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/301
	
	DP 2019-11-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

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
							// Set bInstant to FALSE in this instance so there is an equip flourish
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
							// Set bInstant to FALSE in this instance so there is an equip flourish
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

	object oRedros = GetObjectByTag("Redros", 0);
	
	AssignCommand(oRedros, CP_EquipFirstWeapon(oRedros));
	CP_WeapEquip();
	
	DelayCommand(0.5, ExecuteScript("cp_tar_brejikatk", OBJECT_SELF, -1));

}
