//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_chuunda_01.dlg (E41) in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This script fires when siding with Chuundar, having killed Freyyr in the
	Shadowlands and retrieved the blade of Bacca's sword. Chuundar takes the
	blade and unites it with the hilt that he has. The vanilla version of the
	script uses ActionTakeItem, which causes Chuundar to approach the player.
	Since he doesn't move back to his starting position and he's waving a
	giant double-bladed sword around, this tends to clip into the player for
	the rest of the scene. In order to keep the now defined positions with
	the party herding implemented earlier in this scene, it has been changed
	to simply destroying the object in the player's inventory instead. 
	
	N.B. The vanilla script was named k_pkas_takeblade, but a modified script
	using the same name is already included in K1CP for use in kas_m25aa
	(Lower Shadowlands). The name had to be changed to avoid a filename clash.
	
	Issue #121: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/121
	
	DP 2021-01-13																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBlade = GetItemPossessedBy(GetFirstPC(), "kas25_swordblade");
	
	DestroyObject(oBlade);
}
