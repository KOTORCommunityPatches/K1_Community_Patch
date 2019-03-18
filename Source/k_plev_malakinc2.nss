////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired during the Revalation scene on the Leviathan.
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Locks Bastila's facing during the cutscene.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	SetGlobalNumber("Lev_MalakVision", (GetGlobalNumber("Lev_MalakVision") + 1));
	object oBastila = GetObjectByTag("bastila", 0);
	SetLockOrientationInDialog(oBastila, 1);
}