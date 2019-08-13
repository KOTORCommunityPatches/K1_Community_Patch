////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_elevator.utd in tar_m05ab (Taris Upper Sewers).
	
	This is an added OnFailToOpen for the door of the elevator leading to the
	Vulkar base. It will display a message about the door being locked if the
	player interacts with it post-swoop race.
	
	See also k_ptar_a05ab_en.
	
	DP 2019-08-13                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	if (GetJournalEntry("tar_escape") >= 1)
		{
			BarkString(OBJECT_SELF, 10235);
		}
}
