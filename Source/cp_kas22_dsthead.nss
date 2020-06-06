//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_eli_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	In the vanilla game, when you find the droid head in the Shadowlands and show
	it to Matton, the DLG indicates that he takes it from you. However, it is not
	actually removed until the main planet quest with Chuundar is resolved and you
	return to the Landing Pad. This script removes it from the player's inventory
	on Matton's line "Droid head? On Kashyyyk? Let me see that!".
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oHead = GetItemPossessedBy(GetFirstPC(), "kas24_droidhead");
	
	DestroyObject(oHead);
}
