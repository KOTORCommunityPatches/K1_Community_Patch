//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnHeartbeat for tat18ac_cont_004.utp in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is the OnHeartbeat for the placeable human corpse in the entrance of the
	Krayt Dragon cave on Tatooine. The vanilla script was one of the generic low
	quality treasure scripts that spawns some random items into the placeable's
	inventory. The corpse starts out with a preset inventory containing a Master
	robe and a blaster rifle. This seems like an odd combination for an apparent
	Jedi, so this script moves the blaster over to the nearby Twi'lek corpse.
	
	Issue #210: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/210
	
	DP 2020-06-14																*/
////////////////////////////////////////////////////////////////////////////////// 

#include "k_inc_treasure"

void main() {
	
	object oTwiCrps = GetObjectByTag("ChwdTwlk", 0);
	object oBlaster = GetItemPossessedBy(OBJECT_SELF, "g_w_blstrrfl001");
	int SW_PLOT_HAS_TALKED_TO = 10;
	
    if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO))
		{
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
			
			CreateItemOnObject("g_w_blstrrfl001", oTwiCrps, 1);
			
			DestroyObject(oBlaster);
			
			// Most likely a small number of credits, with a low chance for a medpac.
			SWTR_PopulateTreasure(OBJECT_SELF, SWTR_TABLE_CORPSE_CONTAINER_LOW, 2, TRUE);
		}
}
