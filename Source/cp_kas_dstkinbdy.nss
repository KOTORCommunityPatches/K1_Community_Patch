////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnDeath script for kas25_kinrath.utc in kas_m25aa (Kashyyyk Lower
	Shadowlands).
	
	This replaces the generic vanilla OnDeath script for the Viper Kinrath
	in the Lower Shadowlands that drop the ritual corpse quest item, used
	to summon the Terentatek. Because the item is a fixed inclusion in the
	Kinrath's inventory, it will continue to drop regardless of whether the
	player already has one, and even after the Terentatek has been killed.
	Now the OnDeath script will check whether the PC already has a corpse
	item in their inventory, or whether the empty ritual vine placeable has
	been destroyed (stringing up a ritual corpse destroys the original vine
	and replaces it with a new placeable that has the corpse attached). In
	either event, it will destroy the corpse item in its inventory before
	carrying out the usual death routine. This seemed like an easier approach
	than trying to track the quest state, which is a bit all over the place
	due to the different LS/DS routes.

	Issue #124: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/124

	DP 2019-05-12                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_switch"

void main() {
	
	object oPC = GetFirstPC();
	object oVine = GetObjectByTag("kas25_ritualvine", 0);
	object oBody = GetItemPossessedBy(OBJECT_SELF, "kas25_kinrathbod");
	object oPCBdy = GetItemPossessedBy(oPC, "kas25_kinrathbod");
	
	if (((!GetIsObjectValid(oVine)) || GetIsObjectValid(oPCBdy)))
		{
			DestroyObject(oBody);
		}
	
	ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DEATH);
}
