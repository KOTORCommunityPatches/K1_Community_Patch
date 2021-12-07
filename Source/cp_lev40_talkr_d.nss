//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for invisible001.utp in lev_m40ad (Leviathan Bridge).
	
	This is an added OUD for the invisible placeable that is the DLG owner for
	the second Saul cutscene on the Leviathan's bridge. It handles spawning the
	three Sith Troopers at the end of the scene.
	
	See also cp_lev40_saulend.
	
	Issue #131: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/131
	
	DP 2021-12-07																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	location lSpawn01 = Location(Vector(219.35,54.99,6.01), 0.00);
	location lSpawn02 = Location(Vector(217.48,53.38,6.01), 0.00);
	location lSpawn03 = Location(Vector(217.48,56.72,6.01), 0.00);
	location lRun01 = Location(Vector(257.00,55.00,9.02), 0.00);
	location lRun02 = Location(Vector(254.50,52.89,9.01), 0.00);
	location lRun03 = Location(Vector(254.50,57.14,9.02), 0.00);
	
	if (nUser == 100) // CUSTOM EVENT
		{
			object oTrooper01 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithtroop04", lSpawn01);
			object oTrooper02 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithtroop04", lSpawn02);
			object oTrooper03 = CreateObject(OBJECT_TYPE_CREATURE, "g_sithtroop04", lSpawn03);
			
			AssignCommand(oTrooper01, ActionMoveToLocation(lRun01, TRUE));
			DelayCommand(0.75, AssignCommand(oTrooper02, ActionMoveToLocation(lRun02, TRUE)));
			DelayCommand(0.75, AssignCommand(oTrooper03, ActionMoveToLocation(lRun03, TRUE)));
		}
	else if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
