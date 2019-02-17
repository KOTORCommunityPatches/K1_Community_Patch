////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_casus01_2
	
	Reward for turning in the diary to the Sandral droid instead of Nurik.\
	
	Corrects the reward amount.
	
	JC 2019-02-05                                                             */
////////////////////////////////////////////////////////////////////////////////
void main() {

	SetGlobalNumber("DAN_CASUS_PLOT", 3);
	DestroyObject(GetItemPossessedBy(GetPCSpeaker(), "dan14_diary"), 0.0, 0, 0.0);
	GiveGoldToCreature(GetPCSpeaker(), 200);
	
}

