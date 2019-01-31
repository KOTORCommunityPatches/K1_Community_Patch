////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat18aa_heart
	
	Heartbeat script for tat_m18aa.
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	JC 2019-01-31                                                             */
////////////////////////////////////////////////////////////////////////////////

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
// If the disguise global isn't set, the player hasn't angered all the Sand
// People, and not everybody in the party is disguised, make the Sand People
// hostile
if( GetGlobalBoolean("tat_TuskenSuit") == FALSE &&
	GetGlobalBoolean("tat_TuskenMad") == FALSE ) {
	if( nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE ){
		AdjustReputation(oPM0, oSandFaction, -50);
		}
	}
// Execute the original heartbeat
ExecuteScript("cp_m18aa_h", OBJECT_SELF, -1);

}
