//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting condition for E1 of man28_merc.dlg in manm28aa (Manaan Hrakert Station).
	
	This is the starting conditional for the crazed mercenary's line "Where did you
	go? How did you get back here without being eaten?" which is intended to play
	after you have left the station and returned again via the sub. The original
	starting conditional referenced a global that is set after leaving the Sith
	base, meaning that line would always fire the second time you talk to the merc
	regardless of whether you had surfaced again or not. That has been replaced
	with this script which checks a local boolean on the area, set when you return
	to the surface via the sub. It then sets a local boolean on the merc to ensure
	that the line only triggers a single time.
	
	See also k_pman_sub03.
	
	Issue #378: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/378
	
	DP 2021-10-28																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int SW_PLOT_BOOLEAN_06 = 5;
	
	if (!GetLocalBoolean(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_06))
		{
			return FALSE;
		}
	
	if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_06))
		{
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_06, TRUE);
			return TRUE;
		}
		else
			{
				return FALSE;
			}
}
