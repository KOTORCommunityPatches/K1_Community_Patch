////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn script for non-party Mission in tat_m17ab (Docking Bay).
	
	A fix by AFP for Mission appearing in her underwear. Destroys the original,
	module-specific non-party creature and spawns the regular party version
	instead.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
    location lMission = GetLocation(OBJECT_SELF);
    DestroyObject(OBJECT_SELF, 0.0, 1);
    SpawnAvailableNPC(NPC_MISSION, lMission);
}