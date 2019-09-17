////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kas23_chuunda_01.dlg in kas_m23ad *Chieftain's Hall).

	Originally from The Comprehensive KOTOR Bug Fix Collection by blennus

	This script is an alteration of the vanilla script that fires when Chuundar
	gives you the hilt of Bacca's Blade after the resolution of the plot in the
	Chieftain's Hall without having yet found the blade. The vanilla version
	specifies the wrong item tag, which fails to spawn the item in the player's
	inventory.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSpeaker = GetPCSpeaker();
	
	CreateItemOnObject("kas25_swordhilt", oSpeaker, 1);
}
