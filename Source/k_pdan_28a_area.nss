//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for manm28aa (Manaan Hrakert Station).
	
	This is the OnEnter script for Hrakert Station. By default, the vanilla script
	closes the door near the first corridor every time the module loads. This door
	will spawn Darth Bandon or Calo Nord via its OnOpen script based on their plot
	state. This behaviour has now been tweaked so the door only closes when either
	one is ready to spawn.
	
	Issue #142: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/142
	
	DP 2023-07-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"

void main() {
	
	object oEntering = GetEnteringObject();
	int nGlobal = GetGlobalNumber("K_KALO_BANDON");
	
	if (GetIsPC(oEntering))
		{
			SetPlayerRestrictMode(FALSE);
			
			AssignCommand(GetObjectByTag("FirixaFish01", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 1.0, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish02", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 1.0, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish03", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP02, 0.5, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish04", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 0.7, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish05", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 0.6, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish06", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 0.8, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish07", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 0.6, 0.0));
			AssignCommand(GetObjectByTag("FirixaFish08", 0), ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01, 0.8, 0.0));
			
			SetGlobalBoolean("MAN_HRAKERT_START", TRUE);
			
			if (GetManaanMainPlotVariable() >= PLOT_HARVEST_STOPPED)
				{
					ClearSelkathFromThisLevel();
				}
			
			DelayCommand(1.0, RemoveSuits());
			
			// Close the door if Bandon or Calo are ready to spawn.
			if (nGlobal == 10 || nGlobal == 30)
				{
					object oDoor = GetObjectByTag("man28aa_door02", 0);
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
				}
			
			if (GetManaanMainPlotVariable() >= 4)
				{
					DestroyFish(OBJECT_SELF);
				}
			
			if (GetManaanMainPlotVariable() >= PLOT_HARVEST_STOPPED)
				{
					int nCnt = 0;
					object oMerc = GetObjectByTag("man28_merc", nCnt);
					
					while (GetIsObjectValid(oMerc))
						{
							DelayCommand(0.1, DestroyObject(oMerc, 0.0, TRUE));
							
							nCnt++;
							
							oMerc = GetObjectByTag("man28_merc", nCnt);
						}
				}
		}
}
