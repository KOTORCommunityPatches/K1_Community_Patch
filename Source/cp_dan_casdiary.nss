////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_dan_casdiary
	
	OnClosed for dan14aa_casus
	
	Gives the player Casus' diary if they opened his inventory but didn't take
	it.
	
	Issue #27: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/27
	
	JC 2019-05-09                                                             */
////////////////////////////////////////////////////////////////////////////////
void main() {

	object oPC = GetFirstPC();
	string sItem = "dan14_diary";

	// Only give diary if the player didn't loot the diary yet, didn't initiate the
	// diary quest before, and the diary actually exists to be looted
	
	if (!GetIsObjectValid(GetItemPossessedBy(oPC, sItem)) && GetGlobalNumber("DAN_CASUS_PLOT") < 2 && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF, sItem)))
		{
			CreateItemOnObject(sItem, oPC, 1);
			DestroyObject(GetItemPossessedBy(OBJECT_SELF, sItem));
		}
}
