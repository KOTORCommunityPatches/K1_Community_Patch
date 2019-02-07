////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_dan_casdiary
	
	OnClosed for dan14aa_casus
	
	Gives the player Casus' diary if they opened his inventory but didn't take
	it.
	
	JC 2019-02-05                                                             */
////////////////////////////////////////////////////////////////////////////////
void main() {

object oPC = GetFirstPC();
string sItem = "dan14_diary";

if( !GetIsObjectValid(GetItemPossessedBy(oPC, sItem)) ){
	CreateItemOnObject(sItem, oPC, 1);
	DestroyObject(GetItemPossessedBy(OBJECT_SELF, sItem));
	}

}