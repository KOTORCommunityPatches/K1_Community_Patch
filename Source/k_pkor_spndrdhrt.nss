//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn for kor37_bridge1.utc / kor37_bridge2.utc / kor37_bridge3.utc /
	kor37_bridge4.utc in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This is the OnSpawn script for the four droids guarding the bridge inside the
	Tomb of Ajunta Pall. An issue was discovered where the player using Critical
	Strike attacks against the Tuk'ata would "wake" them up prematurely. In order
	to counteract that, their AI is now disabled when the module spawns them in,
	and is re-enabled just before the cutscene of the pillar blowing up starts.
	
	Issue #431: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/431
	
	See also k_pkor_therangen.
	
	DP 2020-09-10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	int SW_FLAG_AI_OFF = 62;
	
	GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, TRUE);
	GN_SetSpawnInCondition(SW_FLAG_BOSS_AI, TRUE);
	DelayCommand(0.5, ActionPlayAnimation(ANIMATION_LOOPING_DEACTIVATE, 1.0, -1.0));
	GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
	GN_SetListeningPatterns();
	GN_WalkWayPoints();
	
	// Turn off their AI to make sure nap time doesn't get interrupted.
	SetLocalBoolean(OBJECT_SELF, SW_FLAG_AI_OFF, TRUE);
}
