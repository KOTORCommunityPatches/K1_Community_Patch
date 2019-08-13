////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for tar_m05ab (Taris Upper Sewers).
	
	This is the OnEnter for the Upper Sewers which has been edited to add in
	a check for the player returning post-swoop race. It will close and lock
	the door of the elevator to the Vulkar base. The base is not intended to
	be entered again at this point of the game.
	
	See also cp_tar05_elebrk.
	
	DP 2019-08-13                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"

void main() {
	
	object oVulkDoor = GetObjectByTag("tar05_elevator", 0);
	
	TAR_CleanupDeadObjects(OBJECT_SELF);
	
	if (GetJournalEntry("tar_escape") >= 1)
		{
			AssignCommand(oVulkDoor, ActionCloseDoor(oVulkDoor));
			SetLocked(oVulkDoor, TRUE);
		}
}
