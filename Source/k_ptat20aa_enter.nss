////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat20aa_enter
	
	Enter script for tat_m20aa.
	
	Giff spawn fix by A Future Pilot. Fixes an issue with Griff not spawning.
	I bloody hate Griff.
	
	Sand People hostility fix by JC. Fixes an issue with the Sand People
	hostility state not being set correctly	after the player uses the rapid
	transit system or loads from a save while disguised.
	
	JC 2019-01-31                                                             */
////////////////////////////////////////////////////////////////////////////////

void CP_SpawnGriff() {
object oPC = GetFirstPC();
object oEntering = GetEnteringObject();
object oGriff = GetObjectByTag("tat20_griff");
 
// If we've talked to the Czerka officer about Griff and Griff hasn't already spawned
if( GetIsPC(oEntering) && GetGlobalNumber("Mis_MissionTalk") == 9 &&
	GetIsObjectValid(oGriff) == FALSE ) { 

	location lGriffSpawn = GetLocation(GetWaypointByTag("tat20_wp_griff"));
	location lGriffGuard1 = GetLocation(GetObjectByTag("tat20_griffguard", 0));
	location lGriffGuard2 = GetLocation(GetObjectByTag("tat20_griffguard", 1));
	location lGriffGuard3 = GetLocation(GetObjectByTag("tat20_griffguard", 2));
	location lGriffGuard4 = GetLocation(GetObjectByTag("tat20_griffguard", 3));

	CreateObject(OBJECT_TYPE_CREATURE, "tat20_griff", lGriffSpawn);
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard1);
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard2);
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard3);
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard4);
  }
}


void main() {

object oPM0 = GetPartyMemberByIndex(0);
object oPM1 = GetPartyMemberByIndex(1);
object oPM2 = GetPartyMemberByIndex(2);
int nCheck0 = FALSE;
int nCheck1 = FALSE;
int nCheck2 = FALSE;
string sDisguise = "tat17_sandperdis";
// An invisible placeable controls the attitude of the Sand People faction
object oSandFaction = GetObjectByTag("tat18_tuskanfac", 0);

// Check the party leader to see if they're disguised
// (or a droid or not there)
if ( GetTag(oPM0) == "HK47" || GetTag(oPM0) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM0)) == sDisguise ) {
	nCheck0 = TRUE;
	}
// Check the first party member to see if they're disguised
// (or a droid or not there)
if ( GetTag(oPM1) == "HK47" || GetTag(oPM1) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM1)) == sDisguise ||
	GetIsObjectValid(oPM1) == FALSE ) {
	nCheck1 = TRUE;
	}
// Check the second party member to see if they're disguised
// (or a droid or not there)
if ( GetTag(oPM2) == "HK47" || GetTag(oPM2) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise || 
	GetIsObjectValid(oPM2) == FALSE ) {
	nCheck2 = TRUE;
	}
// If everybody is disguised but the disguise global isn't set, set it
if( GetGlobalBoolean("tat_TuskenSuit") == FALSE &&
	nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE ){
		SetGlobalBoolean("tat_TuskenSuit", TRUE);
		}
// If the player hasn't angered the Sand People and everybody is disguised,
// set all the Sand People to friendly
if( GetGlobalBoolean("tat_TuskenMad") == FALSE &&
	nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE ){
	AdjustReputation(oPM0, oSandFaction, 50);
	}
// Execute original script
ExecuteScript("cp_m20aa_en", OBJECT_SELF, -1);
// Griff fix
DelayCommand(2.0, CP_SpawnGriff());

}