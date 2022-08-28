//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for manm26ad (Manaan Docking Bay).
	
	This is the OnEnter for the Manaan Docking Bay. If the player followed the DS
	route and was exiled for killing the Bigger Fish, it was possible to bypass
	the lockdown using the rapid transit system, at least before leaving Manaan.
	To prevent this, the transit back identifier is now nulled out when the player
	is exiled.
	
	Issue #670: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/670

	DP 2022-08-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"

void SpawnSith() {
	DestroyObject(GetObjectByTag("vek", 0));
	DestroyObject(GetObjectByTag("vekdroid", 0));
	CreateObject(OBJECT_TYPE_CREATURE, "man26_sithkol1", GetLocation(GetObjectByTag("wp_man26_sithkol1", 0)), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "man26_sithkol2", GetLocation(GetObjectByTag("wp_man26_sithkol2", 0)), 0);
}

void SpawnIthorak() {
	DestroyObject(GetObjectByTag("man26_sithkol1", 0));
	DestroyObject(GetObjectByTag("man26_sithkol2", 0));
	CreateObject(OBJECT_TYPE_CREATURE, "vek", GetLocation(GetObjectByTag("wp_vek1", 0)), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "vekdroid", GetLocation(GetObjectByTag("wp_vekdroid1", 0)), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "Ithorak", GetLocation(GetObjectByTag("wp_Ithorak1", 0)), 0);
}

void main() {
	
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
	object oHawkDoor = GetObjectByTag("man26ad_door30", 0);
	//object oIthDoor1 = GetObjectByTag("IthorakDoor1", 0);
	object oIthDoor2 = GetObjectByTag("IthorakDoor2", 0);
	int nExiled = GetGlobalBoolean("MAN_EXILED");
	
	if (oEntering == oPC)
		{
			if (nExiled)
				{
					// Clear the transit back destination to prevent bypassing the ban.
					SetGlobalString("K_LAST_MODULE", "NO_MODULE");
				}
			
			if (!GetLoadFromSaveGame())
				{
					RevealMap();
					
					if (GetManaanMainPlotVariable() == 4 && HasNeverTriggered())
						{
							SetGlobalBoolean("MAN_PORT_ZONE", TRUE);
						}
					
					if (GetGlobalNumber("K_Geno_Ithorak") == 10 && !GetGlobalBoolean("K_IthorakSpawn"))
						{
							SetGlobalBoolean("K_IthorakSpawn", TRUE);
							SetGlobalBoolean("K_SithDestroy", TRUE);
							DelayCommand(0.2, SpawnIthorak());
							
							// First door doesn't exist.
							//AssignCommand(oIthDoor1, ActionCloseDoor(oIthDoor1));
							AssignCommand(oIthDoor2, ActionCloseDoor(oIthDoor2));
						}
					
					if (GetGlobalNumber("K_Geno_Ithorak") > 10 && GetGlobalBoolean("K_SithDestroy"))
						{
							SetGlobalBoolean("K_SithDestroy", FALSE);
							DelayCommand(0.2, SpawnSith());
						}
						
					if (nExiled)
						{
							SetLocked(oHawkDoor, TRUE);
							AssignCommand(oHawkDoor, ActionCloseDoor(oHawkDoor));
						}
				}
		}
}
