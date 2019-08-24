////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_repdip.dlg in manm26ae (Manaan East Central).
	
	This script is fired during the post-Hrakert Station wrap-up with Roland
	Wann, giving the player a reward. However, the ResRef used for the sonic
	rifle in the vanilla script (g_w_sonicrfl003) is invalid, so this has been
	changed to point to the nearest valid equivalent (Arkanian Sonic Rifle).
	
	DP 2019-08-24                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetPCSpeaker();
	
	CreateItemOnObject("g_w_sonicrfl03", oPC, 1);
	CreateItemOnObject("g_i_implant305", oPC, 1);
	GiveGoldToCreature(oPC, 500);
}
