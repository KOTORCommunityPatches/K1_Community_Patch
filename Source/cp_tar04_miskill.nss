//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine script for cp_tar04_miskill.utp in tar_m04aa (Taris Undercity).
	
	This is UserDefine script for an added invisible placeable. This now handles
	the final cleanup for the end of the scene where Mission meets the party in
	the Undercity. Stunt Mission is now jumped out of sight before being knocked
	on the head, while party Mission is jumped into her now vacated position, both
	under the cover of the fadeout. Once the fadein starts, party Mission walks
	over to her designated party position behind the player.
	
	See also k_ptar_addmissio, k_ptar_desmis, k_ptar_hdfate_ud, k_ptar_miscrt_en,
	k_ptar_misrun, k_ptar_rakrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-10-30																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 891) // CUSTOM K1CP WOODSHED EVENT
		{
			location lWoodshed = Location(Vector(200.0,240.0,3.00), 229.19);
			location lMissJmp;
			location lMissWlk;
			
			SetGlobalFadeIn(0.5, 2.0);
			
			// Jump stunt Mission (0th Mission in the module) out behind the woodshed.
			CP_PartyJump(GetObjectByTag("Mission", 0), lWoodshed);
			
			// Check which of the two triggers initiated the scene to determine where party
			// Mission should jump and walk to.
			if (!UT_GetPlotBooleanFlag(GetObjectByTag("cp_tar04_missspl"), SW_PLOT_BOOLEAN_05))
				{
					lMissJmp = Location(Vector(269.50,202.50,3.00), 190.00);
					lMissWlk = Location(Vector(263.44,203.47,3.00), 2.95);
				}
				else
					{
						lMissJmp = Location(Vector(254.00,220.50,3.00), 220.00);
						lMissWlk = Location(Vector(251.32,215.17,3.00), 50.87);
					}
			
			// Jump party Mission to where stunt Mission used to be standing.
			DelayCommand(0.5, CP_PartyJump(GetObjectByTag("Mission", 1), lMissJmp));
			
			// Give stunt Mission the Old Yella treatment.
			DelayCommand(1.75, DestroyObject(GetObjectByTag("Mission", 0), 0.0, TRUE, 0.0));
			
			// Walk party Mission (now the 0th Mission in the module, since stunt Mission is dead)
			// over to the PM2 spot behind the player.
			DelayCommand(2.0, CP_PartyMove(GetObjectByTag("Mission", 0), lMissWlk, FALSE));
		}
	else if (nUser == 1001) // ON HEARTBEAT
		{
			
		}
	else if (nUser == 1002) // ON PERCEIVED
		{
			
		}
	else if (nUser == 1003) // END OF COMBAT
		{
			
		}
	else if (nUser == 1004) // ON DIALOGUE
		{
			
		}
	else if (nUser == 1005) // ON ATTACKED
		{
			
		}
	else if (nUser == 1006) // ON DAMAGED
		{
			
		}
	else if (nUser == 1007) // ON DEATH
		{
			
		}
	else if (nUser == 1008) // ON DISTURBED
		{
			
		}
	else if (nUser == 1009) // ON BLOCKED
		{
			
		}
	else if (nUser == 1010) // ON SPELL CAST AT
		{
			
		}
	else if (nUser == 1011) // ON DIALOGUE END
		{
			
		}
	else if (nUser == 1100) // ON HOSTILE RETREAT
		{
			
		}
}
