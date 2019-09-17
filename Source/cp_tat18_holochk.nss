////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tat18_bastila.dlg in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is a safety check fired by the added DLG derived from the KOTOR Bug
	Fix Attempt by danil-ch when obtaining the Holocron in the Krayt Dragon
	cave. Since there were suggestions that the item could be duplicated, this
	will check the placeable for a dupe and destroy it, now that the DLG is
	gated behind the player already possessing the holocron.
	
	Issue #219: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/219
	
	DP 2019-09-05                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBackpack = GetObjectByTag("K_SWG_HELENA01", 0);
	object oHolocron = GetItemPossessedBy(oBackpack, "holocron");
	
	if (GetIsObjectValid(oHolocron))
		{
			DestroyObject(oHolocron);
		}
}
