////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for manm26ae (Manaan East Central).
	
	This is the OnEnter for East Central, now combined with the contents of the
	vanilla script thanks to clues from AmanoJyaku on getting DeNCS to decompile
	the original. It checks for the presence of the Sith prisoner in the Republic
	embassy, opening the force cage if he is now longer there. Additionally, it
	will destroy Lorgal's fake corpse on subsequent visits to the area, since it
	clips through the force cage base, and it is unrealistic that the Republic
	would leave a corpse just laying around in the middle of their embassy for
	(presumably) hours/days/weeks.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	Issue #333: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/333
	
	DP 2019-05-17 / DP 2019-11-11 / DP 2020-06-15                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"

void SpawnNPC(string sTemplate) {
	
	location lLocation = GetLocation(GetObjectByTag(("cut_" + sTemplate), 0));
	
	if (GetIsObjectValid(GetObjectByTag(sTemplate, 0)) == FALSE)
		{
			CreateObject(OBJECT_TYPE_CREATURE, sTemplate, lLocation, 0);
		}
}

void main() {
	
	object oEntering = GetEnteringObject();
	object oCorpse = GetObjectByTag("deadrodian", 0);
	

	
	if (GetFirstPC() == oEntering)
		{
			UT_SetPlotBooleanFlag(GetObjectByTag("man26_repsolshp", 0), SW_PLOT_BOOLEAN_01, FALSE);
			
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
			if (GetManaanMainPlotVariable() >= PLOT_HARVEST_STOPPED && GetManaanStarMapFound() && HasNeverTriggered())
				{
					object oDoor = GetObjectByTag("man26ac_door30", 0);
					
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
					
					oDoor = GetObjectByTag("man26ac_door31", 0);
					
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
					
					SpawnNPC("man26_cutdrd01");
					SpawnNPC("man26_cutdrd02");
					SpawnNPC("man26_cutdrd03");
					SpawnNPC("man26_cutdrd04");
					SpawnNPC("man26_cutsel01");
					
					SetAreaUnescapable(TRUE);
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
