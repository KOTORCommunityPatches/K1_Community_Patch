//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn for cp_tar10_vulkd02.utc/cp_tar10_vulkg02.utc/cp_tar10_vulkg03.utc/
	tar10_vulkgan001.utc/tar10_vulkgang.utc in tar_m10ac (Taris Black Vulkar Base
	Lower/Garage).
	
	This is the OnSpawn script for the Vulkar mechanics that start unarmed so that
	they can pantomime working on swoops. This lead them attacking with their fists
	when they started off hostile, so they have been switched to neutral and now
	rely on a perception event to arm themselves and turn hostile. Simply updates
	the vanilla script to include the flags that enable both the OnHeartbeat and
	OnPerception events.
	
	See also k_ptar_mech01_ud.
	
	Issue #240: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/240
	
	DP 2023-11-26																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_PERCEPTION);
	GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT);
	GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
	GN_SetListeningPatterns();
	GN_WalkWayPoints();
	PlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, -1.0);
}
