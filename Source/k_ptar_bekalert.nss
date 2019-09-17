////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_bekdoor.utd tar_m03aa (Taris Lower City).
	
	This is the OnFailToOpen for the front door of the Bek base. An additional
	check has been added if the player interacts with it post-swoop race and
	Gadon is dead.
	
	See also k_ptar_03aa_en and k_ptar_vuldoor.
	
	Issue #203: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/203
	
	DP 2019-08-13                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"

void main() {
	
	if ((GetJournalEntry("tar_escape") >= 1) && (GetGlobalBoolean("Tar_GadonDead")))
		{
			BarkString(OBJECT_SELF, 10235);
			return;
		}
	
	if (((TAR_GetWearingSithArmor(OBJECT_INVALID) || (!GetGlobalBoolean("TAR_BEKBASEOPEN"))) && (!GetGlobalBoolean("Tar_GadonMission"))))
		{
			UT_NPC_InitConversation("tar03_hiddenbek", "", OBJECT_INVALID);
		}
		else
			{
				ClearAllActions();
				ActionOpenDoor(OBJECT_SELF);
			}
}
