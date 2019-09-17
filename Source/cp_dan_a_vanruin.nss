////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_dan_a_vanruin

	Fired when the player talks to Vandar about investigating the ruins.	
	
	JC 2019-04-29                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oVandar = GetObjectByTag("dan13_vandar", 0);
	
	SetLocalBoolean(oVandar, 49, TRUE);
}
