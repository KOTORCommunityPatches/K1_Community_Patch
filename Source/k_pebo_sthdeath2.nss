////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	One of the fighter death scripts for the turret mini-game sequence.
	
	Part of reordering the post-Taris escape sequence. Shows the Dantooine
	landing movie before the conversation with Bastila and Carth and swaps
	the Ebon Hawk's cockpit background from space to Dantooine, since it
	is heavily implied that it is taking place after having already landed.
	
	Taken from DP's "Taris Escape Sequence Adjustments" mod. Original script
	edits for the mod developed with the help of JC.
	
	2019-09-17 Updated to streamline code with vanilla include functions
	
	Issue #56: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/56
	
	DP 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_stunt"

void CP_PlayPostTurret() {
	
	int nStarMap = GetGlobalNumber("K_STAR_MAP");
	int nKOTOR = GetGlobalNumber("K_KOTOR_MASTER");
	int nSimu = GetGlobalBoolean("K_HK47_SIMULATION");
	int nRandom = GetGlobalBoolean("K_RANDOM_MINI_GAME");
	
	SetGlobalNumber("K_TURRET_SKYBOX", -1);
	
	if(nSimu == TRUE)
		{
			SetGlobalBoolean("K_HK47_SIMULATION", FALSE);
			StartNewModule("ebo_m12aa", "K_MINI_GAME");
		}
		else if(nRandom == TRUE)
			{
				SetGlobalBoolean("K_RANDOM_MINI_GAME", FALSE);
				StartNewModule("ebo_m12aa", "", "11b", ST_GetLandingRender());
				SetGlobalNumber("K_CURRENT_PLANET", GetGlobalNumber("K_FUTURE_PLANET"));
			}
			else if(nStarMap == 0 && nKOTOR == 10) //Blasting Off Taris for Dantooine
				{
					SetGlobalBoolean("K_SPACE_SKYBOX_ON", FALSE);
					StartNewModule("ebo_m12aa", "K_TARIS_DESTROYED", "11b", "05_2a");
				}
				else if(nStarMap == 40 && nKOTOR == 20) //Blasting Off the Leviathan
					{
						StartNewModule("ebo_m40ad", "","11b");
					}
					else if(nStarMap == 50 && nKOTOR == 40) //Landing on the Unknown World
						{
							ST_PlayStunt35();
						}
}

void main() {
	
	int nFighters = (GetGlobalNumber("ebo_num_fighters") - 1);
	
	SWMG_OnDeath();
	SWMG_PlayAnimation(SWMG_GetPlayer(), "SithLoop02d", 1, 0, 1);
	
	SetGlobalNumber("ebo_num_fighters", nFighters);
	
	if ((nFighters <= 0))
		{
			SetGlobalBoolean("ebo_turret_done", TRUE);
			DelayCommand(2.0, CP_PlayPostTurret());
		}
}
