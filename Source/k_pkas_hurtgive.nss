//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_hurt_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This script makes Grrrwahrr give the player the Rough-Cut Upari Amulet. The
	vanilla script failed to do anything because Grrrwahrr's UTC didn't have
	amulet in its inventory. The script has been altered to give him one first.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-11-21																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	NoClicksFor(1.0);
	
	CreateItemOnObject("kas25_wookcrysta");
	
	DelayCommand(0.5, ActionGiveItem(GetItemPossessedBy(OBJECT_SELF, "kas25_wookcrysta"), GetPCSpeaker()));
}
