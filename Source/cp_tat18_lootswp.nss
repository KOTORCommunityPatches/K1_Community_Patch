//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnHeartbeat for tat18ac_cont_004.utp in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is the OnHeartbeat for the placeable human corpse in the entrance of the
	Krayt Dragon cave on Tatooine. The vanilla script was one of the generic low
	quality treasure scripts that spawns some random items into the placeable's
	inventory. The corpse starts out with a preset inventory containing a master
	robe and a blaster rifle. This seems like an odd combination for an apparent
	Jedi, so this script moves the blaster over to the nearby Twi'lek corpse.
	
	Updated 2022-08-07 to swap to using GiveItem and additionally move the two
	saber crystals from rubble placeables in the cave to the Jedi corpse as well.
	
	Issue #210: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/210
	
	DP 2020-06-14 / DP 2022-08-07												*/
////////////////////////////////////////////////////////////////////////////////// 

#include "k_inc_treasure"

void main() {
	
	object oTwiCrps = GetObjectByTag("ChwdTwlk", 0);
	object oRubble1 = GetObjectByTag("tat18ac_cont_01", 0);
	object oRubble2 = GetObjectByTag("tat18ac_cont_02", 0);
	object oBlaster = GetItemPossessedBy(OBJECT_SELF, "g_w_blstrrfl001");
	object oOpila = GetItemPossessedBy(oRubble1, "g_w_sbrcrstl06");
	object oPurp = GetItemPossessedBy(oRubble2, "g_w_sbrcrstl17");
	int SW_PLOT_HAS_TALKED_TO = 10;
	
    if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO))
		{
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
			
			GiveItem(oBlaster, oTwiCrps);
			
			GiveItem(oOpila, OBJECT_SELF);
			
			GiveItem(oPurp, OBJECT_SELF);
			
			// Most likely a small number of credits, with a 20% chance for a medpac.
			SWTR_PopulateTreasure(OBJECT_SELF, SWTR_TABLE_CORPSE_CONTAINER_LOW, 2, TRUE);
		}
}
