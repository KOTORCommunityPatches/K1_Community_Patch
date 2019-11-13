//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_mechanic.dlg in tar_m03af (Taris Swoop Platform).
	
	This script fires on one of the exit nodes when the player is ready to run
	another of their heats. It reequips whatever weapons they had at the start
	of the conversation by grabbing the tags of the duplicate items stored in
	the invisible placeables. Those placeables are then destroyed in preparation
	for any subsequent conversations (simply destroying the items seemed to lead
	to crashes during testing).
	
	See also k_ptar_brejikatk, k_ptar_playermec, k_ptar_swoop0.
	
	Issue #301: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/301
	
	DP 2019-11-14																*/
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
							AssignCommand(oPC, ActionEquipItem(oRWeap, INVENTORY_SLOT_RIGHTWEAPON, TRUE));
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
							AssignCommand(oPC, ActionEquipItem(oLWeap, INVENTORY_SLOT_LEFTWEAPON, TRUE));
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
	
	SetGlobalBoolean("Tar_SwoopNew", TRUE);
	SetGlobalNumber("Tar_SwoopStatus", 0);
	
	CP_WeapEquip();
}
