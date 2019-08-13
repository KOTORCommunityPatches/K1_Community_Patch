////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_blkdoor.utd tar_m03aa (Taris Lower City).
	
	This is the OnFailToOpen for the front door of the Vulkar base. An additional
	check has been added if the player interacts with it post-swoop race.
	
	See also k_ptar_03aa_en and k_ptar_bekalert.
	
	DP 2019-08-13                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	if (GetJournalEntry("tar_escape") >= 1)
		{
			BarkString(OBJECT_SELF, 35505);
		}
		else
			{
				BarkString(OBJECT_SELF, 24091);
			}
}
