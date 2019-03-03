////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_ptat_maanatrig
	
	Triggers the encounter with Maana Demkot, the Duros who directs you to
	Helena Shan.

	Reconstructed based on the byte code. Should prevent him from spawning if
	the player has completed the Leviathan.
	
	JC 2019-03-03                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

if( GetGlobalNumber("K_SWG_HELENA") == 2 && GetGlobalNumber("K_CAPTURED_LEV") < 10 ) {
	location lSpawn = GetLocation(GetWaypointByTag("tat17_maana_wp"));
	CreateObject(OBJECT_TYPE_CREATURE, "tat17aa_bastplot", lSpawn, FALSE);
	DestroyObject(OBJECT_SELF, 0.0, FALSE, 0.0);
	}

}