//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn for tat18_14sandg_01.utc in tat_m18ab (Tatooine Sand People Territory).
	
	This is the OnSpawn script for the gate guard that is spawned after having
	spoken to the Chieftain for the first time and told to bring him vaporators.
	The guard is seen visibly spawning right in front of the player after they
	are ejected from the Enclave at the end of the Chieftain's conversation.
	Because the module's OnEnter cannot be decompiled and the limitations with
	using hijacked scripts, the spawn waypoint of the guard was simply pushed
	further back behind where the party starts when entering the module, and is
	then told to walk to his original position. Otherwise, it's just the regular
	vanilla k_def_spawn01.
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	location lWalk = Location(Vector(152.345,25.111,92.506), 0.0);
	
	GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
	
	GN_SetListeningPatterns();
	
	ActionMoveToLocation(lWalk);
	
    GN_WalkWayPoints();
}
