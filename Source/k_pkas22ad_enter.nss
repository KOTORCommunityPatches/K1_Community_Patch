//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This is the OnEnter for the Chieftain's Hall. A jump has been added to herd
	the party into a nicer starting formation, since most of the time a cutscene
	will automatically start showing the party walking forwards. During this the
	camera will typically clip through the head of the nearest party member as
	they follow the player. Now the party members start further back behind the
	spawn-in point, in conjunction with their destination waypoints being pushed
	further back to give the camera some breathing room.
	
	Issue #121: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/121
	
	DP 2021-01-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_kas"

void SpawnFreyyr() {
	
	object oWP = GetWaypointByTag("kas23_freyyrspwn");
	location lWP = GetLocation(oWP);
	
	CreateObject(OBJECT_TYPE_CREATURE, "kas23_freyyr_01", lWP);
	return;
}

void main() {
	
	object oChuundar = GetObjectByTag("kas23_chuunda_01", 0);
	
	// Since the party walk forwards during conversation intros, jump them into a better starting
	// position to eliminate the camera clipping through one of the companion's heads as they move.
	if (!GetLoadFromSaveGame())
		{
			location lPC = Location(Vector(19.86,15.20,3.75), 236.25);
			location lPM1 = Location(Vector(22.21,16.18,3.75), 236.25);
			location lPM2 = Location(Vector(19.96,17.68,3.75), 236.25);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
		}
	
	if (GetHelpedFreyyrGlobal() == TRUE && GetFreyyrSpawnGlobal() == FALSE)
		{
			DelayCommand(0.1, SpawnFreyyr());
			SetFreyyrSpawnGlobal(TRUE);
		}
	
	if (GetFadeOffLocal() == FALSE && UT_GetTalkedToBooleanFlag(oChuundar) == FALSE || GetHelpedFreyyrGlobal() == TRUE || GetFreyyrDeadGlobal() == TRUE)
		{
			SetGlobalFadeOut();
		}
}
