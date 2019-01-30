void main() {
    location lMission = GetLocation(OBJECT_SELF);
    DestroyObject(OBJECT_SELF, 0.0, 1);
    SpawnAvailableNPC(NPC_MISSION, lMission);
}