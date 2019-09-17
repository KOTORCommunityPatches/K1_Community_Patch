////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for tar_m03aa (Taris Lower City).
	
	This is the OnEnter for the Lower City which has been edited to add in
	a check for the player returning post-swoop race. It will close and lock
	the doors of the Vulkar and Bek bases (if hostile in the latter case).
	They are not intended to be entered again at this point of the game.
	
	See also k_ptar_vuldoor and k_ptar_bekalert.
	
	Issue #203: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/203
	
	DP 2019-08-13                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"

void main() {
	
	object oBekDoor = GetObjectByTag("tar03_bekdoor", 0);
	object oJavyDoor = GetObjectByTag("tar03_javydoor", 0);
	object oVulkDoor = GetObjectByTag("tar03_blkdoor", 0);
	
	TAR_CleanupDeadObjects(OBJECT_SELF);
	
	AssignCommand(oBekDoor, ActionCloseDoor(oBekDoor));
	AssignCommand(oJavyDoor, ActionCloseDoor(oJavyDoor));
	
	if (GetGlobalBoolean("TAR_VULKARBASE_OPEN"))
		{
			SetLocked(oVulkDoor, FALSE);
		}
	
	if (GetGlobalBoolean("Tar_KandonMission"))
		{
			
			object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
			
			while (GetIsObjectValid(oAreaObject))
				{
					
					if (((GetStandardFaction(oAreaObject) == STANDARD_FACTION_HOSTILE_1) && (!IsObjectPartyMember(oAreaObject))))
						{
							DestroyObject(oAreaObject, 0.0, TRUE);
						}
					oAreaObject = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
				}
		}
	
	if (GetGlobalBoolean("TAR_BEKSHOSTILE"))
		{
			ChangeToStandardFaction(GetObjectByTag("tar03_hiddenbek", 0), STANDARD_FACTION_HOSTILE_1);
			SetPlotFlag(GetObjectByTag("tar03_hiddenbek", 0), FALSE);
		}
	
	if (GetJournalEntry("tar_escape") >= 1)
		{
			
			if ((GetIsOpen(oVulkDoor)))
				{
					AssignCommand(oVulkDoor, ActionCloseDoor(oVulkDoor));
				}
			
			SetLocked(oVulkDoor, TRUE);
			
			if (GetGlobalBoolean("Tar_GadonDead"))
				{
					SetLocked(oBekDoor, TRUE);
				}
		}
}
