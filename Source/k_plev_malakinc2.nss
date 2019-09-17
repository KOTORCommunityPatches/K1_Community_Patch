////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired during the Revelation scene on the Leviathan.
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Locks Bastila's facing during the cutscene.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBastila = GetObjectByTag("bastila", 0);
	
	SetGlobalNumber("Lev_MalakVision", (GetGlobalNumber("Lev_MalakVision") + 1));
	SetLockOrientationInDialog(oBastila, 1);
}
