//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for danm14aa (Dantooine Jedi Enclave Courtyard).
	
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	Updated 2019-05-19 to streamline code using vanilla include functions.
	
	Updated 2021-10-21 to add an additional provision to prevent an erroneous
	duplicate encounter happening when fast travelling back to the Hawk after
	having already dealt with Xor's ambush.
	
	Updated 2023-10-18 to remove the erroneous Sharina spawn block, since that
	has been moved to danm13's OnEnter where it belongs. Also cleaned up the
	code formatting to remove DeNCS's excesses and improve readability.
	
	Issue #29: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/29
	
	Issue #468: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/468
	
	Issue #705: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/705	
	
	JC 2019-04-13 / DP 2021-10-21 / DP 2023-10-18								*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void main() {
	
	if (GetIsPC(GetEnteringObject()) && GetLoadFromSaveGame() == FALSE)
		{
			int nKath = (2 - GetNumberOfWanderingKathHounds());
			
			if (GetGlobalBoolean("DAN_GARL_DONE") == FALSE && GetGlobalNumber("DAN_MAND_STATE") < 5)
				{
					PlaceNPC("dan14_settlerf", "");
					PlaceNPC("dan14_settlerm", "");
				}
				else
					{
						if (GetIsObjectValid(GetObjectByTag("dan14_settlerf", 0)))
							{
								DestroyObject(GetObjectByTag("dan14_settlerf", 0));
							}
						
						if (GetIsObjectValid(GetObjectByTag("dan14_settlerm", 0)))
							{
								DestroyObject(GetObjectByTag("dan14_settlerm", 0));
							}
					}
			
			if (GetGlobalNumber("DAN_JEDI_PLOT") < 7)
				{
					PlaceNPC("dan14_nemo", "");
				}
			
			if (GetGlobalBoolean("DAN_RUINS_GONE"))
				{
					DestroyObject(GetObjectByTag("dan14_nemo", 0));
					SetLocked(GetObjectByTag("man14aa_door04", 0), FALSE);
				}
			
			object oElise = GetObjectByTag("dan14_elise", 0);
			
			if (GetEliseInCompound() || GetElisePlotDone())
				{
					DestroyObject(oElise);
					DestroyObject(GetObjectByTag("dan14aa_speeder", 0));
				}
				else
					{
						if (GetEliseDroidReturned())
							{
								PlaceNPC("dan14_c8692", "");
							}
					}
			
			if (nKath > 0)
				{
					SpawnWanderingKathHound(nKath);
				}
			
			if (GetGlobalNumber("KOR_FINAL_TEST") == 7)
				{
					PlaceNPC("dan13_yuthura", "");
				}
		}

	// Added Xor fix ~JC
	if( GetGlobalBoolean("K_MESS_JUHANI") == TRUE )
		{
			if (GetGlobalNumber("K_XOR_AMBUSH") < 1)
				{
					SetGlobalNumber("K_XOR_AMBUSH", 1);
					// Prevent k_sup_gohawk duplicating the attack again the
					// next time the player fast travels to the Ebon Hawk.
					SetGlobalBoolean("K_XOR_AMBUSH_FIX", TRUE);
				}
		}
}
