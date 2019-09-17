////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kas25_xbeast_01.dlg in kas_m25aa (Lower Shadowlands).

	Originally from The Comprehensive KOTOR Bug Fix Collection by blennus

	This script is an alteration of the vanilla script that fires if you
	kill the Great Beast in the Kashyyyk Lower Shadowlands after having
	completed the main quest on the planet and taken the Dark Side route,
	siding with Chuundar. The vanilla version of the script only removes
	the blade from the player's inventory, not the hilt.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSpeaker = GetPCSpeaker();
	object oBlade = GetItemPossessedBy(GetFirstPC(), "kas25_swordblade");
	object oHilt = GetItemPossessedBy(GetFirstPC(), "kas25_swordhilt");
	
	if (GetIsObjectValid(oBlade))
		{
			ActionDoCommand(DestroyObject(oBlade, 0.0, FALSE, 0.0));
		}
	
	if (GetIsObjectValid(oHilt))
		{
			ActionDoCommand(DestroyObject(oHilt, 0.0, FALSE, 0.0));
		}
	
	CreateItemOnObject("G_w_Vbroswrd05", oSpeaker, 1);
}
