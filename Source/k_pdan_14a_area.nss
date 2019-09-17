////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pdan_14a_area
	
	OnEnter script for danm14aa.
	
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	2019-05-19 Updated to streamline code using vanilla include functions.
	
	Issue #29: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/29
	
	JC 2019-04-13                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void main() {
	
	if ((GetIsPC(GetEnteringObject()) && (GetLoadFromSaveGame() == 0)))
		{
			int int3 = (2 - GetNumberOfWanderingKathHounds());
			if (((GetGlobalBoolean("DAN_GARL_DONE") == 0) && (GetGlobalNumber("DAN_MAND_STATE") < 5)))
				{
					PlaceNPC("dan14_settlerf", "");
					PlaceNPC("dan14_settlerm", "");
				}
			else
				{
					if (GetIsObjectValid(GetObjectByTag("dan14_settlerf", 0)))
						{
							DestroyObject(GetObjectByTag("dan14_settlerf", 0), 0.0, 0, 0.0);
						}
					if (GetIsObjectValid(GetObjectByTag("dan14_settlerm", 0)))
						{
							DestroyObject(GetObjectByTag("dan14_settlerm", 0), 0.0, 0, 0.0);
						}
				}
			if ((GetGlobalNumber("DAN_JEDI_PLOT") < 7))
				{
					PlaceNPC("dan14_nemo", "");
				}
			if (GetGlobalBoolean("DAN_RUINS_GONE"))
				{
					DestroyObject(GetObjectByTag("dan14_nemo", 0), 0.0, 0, 0.0);
					SetLocked(GetObjectByTag("man14aa_door04", 0), 0);
				}
			
			object oDan14_elise = GetObjectByTag("dan14_elise", 0);
			
			if ((GetEliseInCompound() || GetElisePlotDone()))
				{
					DestroyObject(oDan14_elise, 0.0, 0, 0.0);
					DestroyObject(GetObjectByTag("dan14aa_speeder", 0), 0.0, 0, 0.0);
				}
			else
				{
					if (GetEliseDroidReturned())
						{
							PlaceNPC("dan14_c8692", "");
						}
				}
			if ((int3 > 0))
				{
					SpawnWanderingKathHound(int3);
				}
			if (GetGlobalBoolean("tat_SharinaPaidFull"))
				{
					PlaceNPC("dan13_zzshari", "");
				}
			if ((GetGlobalNumber("KOR_FINAL_TEST") == 7))
				{
					PlaceNPC("dan13_yuthura", "");
				}
		}

	// Added Xor fix ~JC
	if( GetGlobalBoolean("K_MESS_JUHANI") == TRUE )
		{
			if( GetGlobalNumber("K_XOR_AMBUSH") < 1 ) SetGlobalNumber("K_XOR_AMBUSH", 1);
		}
}
