////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for manm26ac (Manaan West Central).
	
	This is the OnEnter for West Central, now combined with the contents of the
	vanilla script thanks to clues from AmanoJyaku on getting DeNCS to decompile
	the original. Fixes an issue with Xor refusing to appear unless the rapid
	transit system was used. This fix is attached to every module adjacent to a
	spaceport, so when the player exits any spaceport the encounter will be set
	to begin when they return, via rapid transit or otherwise.
	
	Issue #29: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/29
	
	JC 2019-04-13 / DP 2020-06-15                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"

void main() {
	
	if (GetEnteringObject() == GetFirstPC())
		{
			if (HasNeverTriggered())
				{
					SetGlobalBoolean("MAN_PORT_ZONE", TRUE);
				}
			
			if (GetGlobalBoolean("MAN_PORT_ZONE"))
				{
					object oDoor = GetObjectByTag("man26ac_door02", 0);
					
					SetLocked(oDoor, TRUE);
					AssignCommand(oDoor, ActionCloseDoor(oDoor));
				}
			
			// If the first Xor encounter is done, make him appear for the second one.
			if (GetGlobalBoolean("K_MESS_JUHANI") == TRUE)
				{
					if (GetGlobalNumber("K_XOR_AMBUSH") < 1)
						{
							SetGlobalNumber("K_XOR_AMBUSH", 1);
						}
				}
		}
}
