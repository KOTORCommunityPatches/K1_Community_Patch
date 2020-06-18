//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnSpawn for tar03_brejik031.utc in tar_m03af (Taris Swoop Platform).
	
	This is Brejik's OnSpawn script. Altered to have him unequip his blaster,
	since he starts off in a cutscene where he is supposed to be celebrating
	a race win (at least if the player sides with the Vulkars anyway).
	
	See also cp_tar03_brejeqp, cp_tar03_brejfce, k_ptar_brejikatk, k_ptar_dieswoopy,
	k_ptar_swpie_ud
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	DP 2020-06-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oRWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
	
	GN_SetSpawnInCondition(SW_FLAG_BOSS_AI, TRUE);
	GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_DEATH, TRUE);
	GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);
	
	ActionUnequipItem(oRWeapon, TRUE);
	
	GN_SetListeningPatterns();
	GN_WalkWayPoints();
}
