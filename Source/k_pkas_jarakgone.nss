//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_worrroz_01.dlg in kas_m23ac (Kashyyyk Worrroznor's Home).
	
	This script fires at the conclusion of the trial in the "A Wookiee Lost"
	quest. By default it destroys the bowcaster bolt casing quest item but not
	the slaver contract datapad, causing it to be left orphaned in the player's
	inventory for the rest of the game. The datapad is now destroyed as well.
	
	Issue #521: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/521
	
	DP 2023-08-17																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oWoorwill = GetObjectByTag("kas23_woorwil_01", 0);
	object oJaarak = GetObjectByTag("kas23_jaarak_01", 0);
	object oCasing = GetItemPossessedBy(oPC, "kas24_bowcasbolt");
	object oDatapad = GetItemPossessedBy(oPC, "kas24_datapad");
	
	MusicBackgroundStop(GetArea(OBJECT_SELF));
	
	DestroyObject(oWoorwill, 0.0, TRUE);
	DestroyObject(oJaarak, 0.0, TRUE);
	DestroyObject(oCasing);
	DestroyObject(oDatapad);
}
