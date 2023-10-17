//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_droid17b.dlg in lev_m40ab (Leviathan Command Deck).
	
	This script is the starting conditional which determines whether or not the
	command is available to program the decomissioned droid to ram the locked door
	to the bridge storage room. The vanilla script only checked a global. It has
	been altered to now also check for whether the door is already unlocked/open.
	
	Issue #414: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/414
	
	DP 2023-10-17																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	object oDoor = GetObjectByTag("lev40_storage", 0);
	
	if (!GetGlobalBoolean("Lev_storage"))
		{
			if (!GetLocked(oDoor) || GetIsOpen(oDoor))
				{
					return FALSE;
				}
			
			return TRUE;
		}
	
	return FALSE;
}
