////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	This is a replacement generic OnSpawn script to have various unarmed NPCs
	with weapons in their inventory equip a weapon (ranged, falling back to a
	melee weapon if no ranged weapon is found) as soon as they are spawned.
	This is an attempt to prevent the attacking with fists issue. Afterwards
	it just runs the contents of the vanilla k_def_spawn01 script.
	
	DP 2019-05-17                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main()
{
	//Have the NPC equip a ranged weapon from their inventory
	ActionEquipMostDamagingRanged();
	
	//Vanilla generic OnSpawn functions
	GN_SetDayNightPresence(AMBIENT_PRESENCE_ALWAYS_PRESENT);

	GN_SetListeningPatterns();

	GN_WalkWayPoints();
}
