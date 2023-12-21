//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for manm26ae (Manaan East Central).
	
	This is the OnEnter for East Central, now combined with the contents of the
	vanilla script thanks to clues from AmanoJyaku on getting DeNCS to decompile
	the original. It checks for the presence of the Sith prisoner in the Republic
	embassy, opening the force cage if he is no longer there. Additionally, it
	will destroy Lorgal's fake corpse on subsequent visits to the area, since it
	clips through the force cage base, and it is unrealistic that the Republic
	would leave a corpse just laying around in the middle of their embassy for
	(presumably) hours/days/weeks.
	
	Updated 2023-12-21 to now lock the embassy door during the pre-Hrakert trial
	event to allow for the new scene setup. Also stripped out all the k_inc_man
	functions to reduce the amount of unnecessary cruft.
	
	See also cp_man26ae_am01.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	Issue #333: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/333
	
	DP 2019-05-17 / DP 2019-11-11 / DP 2020-06-15 / DP 2023-12-21				*/
//////////////////////////////////////////////////////////////////////////////////

void SpawnNPC(string sTemplate) {
	
	location lLocation = GetLocation(GetObjectByTag("cut_" + sTemplate, 0));
	
	if (!GetIsObjectValid(GetObjectByTag(sTemplate, 0)))
		{
			CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lLocation);
		}
}

void main() {
	
	object oEntering = GetEnteringObject();
	object oCorpse = GetObjectByTag("deadrodian", 0);
	int PLOT_HARVEST_STOPPED = 3;
	int SW_PLOT_BOOLEAN_01 = 0;
	int SW_PLOT_BOOLEAN_10 = 9;
	
	if (GetIsPC(oEntering))
		{
			SetLocalBoolean(GetObjectByTag("man26_repsolshp", 0), SW_PLOT_BOOLEAN_01, FALSE);
			
			if (!GetLoadFromSaveGame() && GetIsObjectValid(oCorpse))
				{
					DestroyObject(oCorpse, 0.0, TRUE);
				}
			
			if (GetGlobalNumber("K_Geno_Lorgal") != 1)
				{
					DelayCommand(0.2, AssignCommand(GetObjectByTag("EnergyCage", 0), PlayAnimation(ANIMATION_PLACEABLE_OPEN)));
				}
			
			if (GetGlobalBoolean("MAN_HRAKERT_START"))
				{
					AssignCommand(GetObjectByTag("man26_repdip", 0), JumpToObject(GetObjectByTag("man26_wp_repdipt", 0)));
				}
			
			// Post-Hrakert Rift cutscene setup.
			if (GetGlobalNumber("MAN_PLANET_PLOT") >= PLOT_HARVEST_STOPPED && GetGlobalBoolean("MAN_STARMAP_FOUND") && !GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_10))
				{
					object oDoor = GetObjectByTag("man26ac_door30", 0);
					
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
					
					oDoor = GetObjectByTag("man26ac_door31", 0);
					
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
					AssignCommand(oDoor, SetLocked(oDoor, TRUE));
					
					SpawnNPC("man26_cutdrd01");
					SpawnNPC("man26_cutdrd02");
					SpawnNPC("man26_cutdrd03");
					SpawnNPC("man26_cutdrd04");
					SpawnNPC("man26_cutsel01");
					
					SetAreaUnescapable(TRUE);
					
					SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_10, TRUE);
				}
			
			if (GetGlobalBoolean("MAN_SITHBASE_SEALED"))
				{
					DelayCommand(0.2, AssignCommand(GetObjectByTag("cp_m26ae_fccage", 0), PlayAnimation(ANIMATION_PLACEABLE_OPEN)));
					
					DestroyObject(GetObjectByTag("man26_reptech", 0));
					DestroyObject(GetObjectByTag("man26_repint", 0));
					DestroyObject(GetObjectByTag("man26_sithpris", 0));
				}
		}
}
