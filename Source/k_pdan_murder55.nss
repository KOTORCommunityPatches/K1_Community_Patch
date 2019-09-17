////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_bolook.dlg on Entry 262.
	
	This script is fired during the intro of the Murder Mystery quest, spawning
	in Handon, Rickard, the protocol droid, and the placeable corpse. This has
	been altered in order additionally spawn in the new creature-based corpse,
	with the original placeable having been swapped to an invisible one. This
	was done to replace the low quality placeable corpse model with something
	of higher quality.
	
	Updated 2019-04-28 to add a custom spawn position for the creature-based
	corpse, thanks to JC, to fix an issue with it floating off the ground.
	
	Updated 2019-09-17 to switch to vanilla include functions.
	
	Issue #37: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/37
	
	Issue #51: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/51
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void main() {
	
	location lCorpse = GetLocation(GetObjectByTag("POST_dan14_corpse", 0));
	location lSpawn = Location(Vector(326.6, 423.9, 61.3), 230.0);

	PlaceNPC("dan14_handon", "");
	PlaceNPC("dan14_rickard", "");
	PlaceNPC("dan14_idroid", "");
	
	CreateObject(OBJECT_TYPE_PLACEABLE, "dan14_corpse", lCorpse, FALSE);
	CreateObject(OBJECT_TYPE_CREATURE, "cp_dan14ac_cpse", lSpawn, FALSE);
}
