//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for tar05_corpsepile.utp in tar_m05abc (Taris Upper Sewers).
	
	This is the OnOpen script for the corpse pile the player has to spike with
	a scent to lure the Rancor in the Taris sewers. This script simply filters
	the player's inventory in the Give Item screen so that only the relevant
	items are shown. Credit to JC for coming up with the filtering trick.
	
	Issue #430: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/430
	
	DP 2020-09-07																*/
//////////////////////////////////////////////////////////////////////////////////

int ItemCheck(object oItem) {
	
	string sItemTag = GetTag(oItem);
	
	if (sItemTag == "G_w_StunGren01" ||
	sItemTag == "g_w_adhsvgren001" ||
	sItemTag == "g_w_fraggren01" ||
	sItemTag == "G_w_SonicGren01" ||
	sItemTag == "G_w_ThermlDet01" ||
	sItemTag == "G_W_FIREGREN001" ||
	sItemTag == "g_w_poisngren01" ||
	sItemTag == "G_W_CRYOBGREN001" ||
	sItemTag == "g_w_iongren01" ||
	sItemTag == "tar05_synthodor")
		{
			return TRUE;
		}
	else
		{
			return FALSE;
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oItem;
	string sTag;
	
	oItem = GetFirstItemInInventory(oPC);
	
	while (GetIsObjectValid(oItem))
		{
			sTag = GetTag(oItem);
				
			if (!GetPlotFlag(oItem) && !ItemCheck(oItem))
				{
					SetPlotFlag(oItem, TRUE);
					DelayCommand(0.5, SetPlotFlag(oItem, FALSE));
				}
			
			oItem = GetNextItemInInventory(oPC);
		}
}
