////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_dan_casdiary
	
	OnClosed for dan14aa_casus
	
	Gives the player Casus' diary if they opened his inventory but didn't take
	it.
	
	JC 2019-05-09                                                             */
////////////////////////////////////////////////////////////////////////////////
void main() {

object oPC = GetFirstPC();
string sItem = "dan14_diary";

// Only give diary if the player didn't loot the diary yet, didn't initiate the
// diary quest before, and the families are alive
if( !GetIsObjectValid(GetItemPossessedBy(oPC, sItem)) &&
	GetGlobalNumber("DAN_CASUS_PLOT") < 2 &&
	!GetGlobalNumber("DAN_ROMANCE_PLOT") == 7 ){
	CreateItemOnObject(sItem, oPC, 1);
	DestroyObject(GetItemPossessedBy(OBJECT_SELF, sItem));
	}

}