//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_10czerk_01.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is the script that removes the chief's gaffi stick when handing it in to
	the Czerka protocol officer. It has been changed to simply destroy it rather
	than using ActionTakeItem, which caused the protocol officer to walk up to the
	PC.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2023-12-14																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oGaffi = GetItemPossessedBy(GetFirstPC(), "tat20_gaffichief");
	int SW_PLOT_BOOLEAN_03 = 2;
	
	DestroyObject(oGaffi);
	
	//SetChieftainStickGivenLocal(TRUE);
	// This uses SW_PLOT_BOOLEAN_03 for Czerka protocol officer.
	SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_03, TRUE);
}
