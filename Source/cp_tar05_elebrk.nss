////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_elevator.utd in tar_m05ab (Taris Upper Sewers).
	
	This is an added OnFailToOpen for the door of the elevator leading to the
	Vulkar base. It will display a message about the door being locked if the
	player interacts with it post-swoop race.
	
	See also k_ptar_a05ab_en.
	
	Issue #203: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/203
	
	DP 2019-08-13                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	if (GetJournalEntry("tar_escape") >= 1)
		{
			BarkString(OBJECT_SELF, 10235);
		}
}
