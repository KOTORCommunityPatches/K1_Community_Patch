void main() {
	if ((GetIsPC(GetEnteringObject()) == 1))
	{
		int iIndex = 0;
		while(iIndex <= 8)
		{
			RemovePartyMember(iIndex);
			(iIndex++);
		}
		
		location DPWorld0 = Location(Vector(0.0, 0.0, 0.0), 0.0);

		if ((IsAvailableCreature(2) == 0)) {
			AurPostString("Adding Carth to Party", 5, 14, 1.0);
			AddAvailableNPCByTemplate(2, "p_carth");
		}
		if ((IsNPCPartyMember(2) == 0)) {
			AurPostString("Spawning Carth", 5, 15, 1.0);
			SpawnAvailableNPC(2, GetLocation(GetObjectByTag("WP01", 0)));
		}
		if ((IsAvailableCreature(0) == 0)) {
			AddAvailableNPCByTemplate(0, "p_bastilla");
		}
		if ((IsNPCPartyMember(0) == 0)) {
			SpawnAvailableNPC(0, GetLocation(GetObjectByTag("WP01", 0)));
		}
		if ((IsNPCPartyMember(1) == 0)) {
			SpawnAvailableNPC(1, DPWorld0);
		}
		if ((IsNPCPartyMember(6) == 0)) {
			SpawnAvailableNPC(6, DPWorld0);
		}
		if ((IsNPCPartyMember(7) == 0)) {
			SpawnAvailableNPC(7, DPWorld0);
		}
		if ((IsNPCPartyMember(8) == 0)) {
			SpawnAvailableNPC(8, DPWorld0);
		}
		SetPartyLeader(0xFFFFFFFF);
		AssignCommand(GetFirstPC(), ClearAllEffects());
		AssignCommand(GetObjectByTag("Bastila", 0), ClearAllEffects());
		AssignCommand(GetObjectByTag("Carth", 0), ClearAllEffects());
		AssignCommand(GetObjectByTag("Mission", 0), ClearAllEffects());
		AssignCommand(GetObjectByTag("Cand", 0), ClearAllEffects());
		AssignCommand(GetObjectByTag("Zaalbar", 0), ClearAllEffects());
		AssignCommand(GetObjectByTag("T3M4", 0), ClearAllEffects());
		PlayRoomAnimation("m12aa_01q", 9);
		AssignCommand(GetObjectByTag("CutStart", 0), ActionStartConversation(GetFirstPC(), "scene_start", 0, 0, 1, "", "", "", "", "", ""));
	}
}