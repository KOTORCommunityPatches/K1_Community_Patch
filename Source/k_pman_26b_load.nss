//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnLoad for manm26ab (Manaan Ahto East).
	
	This is the module OnLoad for Ahto East. The vanilla version spawns the
	Selkath officer and his droids when the PC is arrested after leaving the
	Sith base. Since the party ends up scattered in this scene, usually with
	one party member standing right in front of the player, the party is now
	herded into a neater arrangement. One of the Selkath droids that partially
	blocked one shot has also been moved out of the way. Additionally, a new
	Sith war droid was originally spawned outside the base at the same time
	as the Selkath group. This was somewhat incongruous, since before entering
	the base there were only four droids outside, and these all get called
	inside when the party triggers the scene in the foyer. This has now been
	changed to only spawn this droid on a subsequent load of the module, after
	the trial has occurred.
	
	Issue #139: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/139
	
	DP 2021-01-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"

void main() {
	
	object oDroid = GetObjectByTag("man26_sdroid", 0);
	
	if (GetGlobalBoolean("MAN_SITHBASE_SEALED") && HasNeverTriggered())
		{
			location lDrd = Location(Vector(42.37,2.15,57.50), 80.21);
			
			HoldWorldFadeInForDialog();
			
			PlaceNPC("man26_selcut03");
			PlaceNPC("man26_drdcut01");
			PlaceNPC("man26_drdcut02");
			PlaceNPC("man26_drdcut03");
			PlaceNPC("man26_drdcut04");
			
			// Spawn the camera-hogging droid out of the way.
			CreateObject(OBJECT_TYPE_CREATURE, "man26_drdcut05", lDrd);
		}
	
	if (GetGlobalBoolean("MAN_SITHBASE_SEALED") && GetGlobalBoolean("MAN_TEMP2") && !GetIsObjectValid(oDroid))
		{
			// Only spawn the new Sith war droid after the
			// arrest scene has been previously triggered.
			PlaceNPC("man26_sdroid");
		}
}
