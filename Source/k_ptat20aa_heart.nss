////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptat20aa_heart
	
	Heartbeat script for tat_m20aa.
	
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
// Check the second party member to see if they're disguised
// (or a droid or not there)
if ( GetTag(oPM2) == "HK47" || GetTag(oPM2) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise || 
	GetIsObjectValid(oPM2) == FALSE ) {
	nCheck2 = TRUE;
	}
// If the player hasn't angered the Sand People, but the disguise global isn't
// set, correct the Sand People attitude
if ( GetGlobalBoolean("tat_TuskenSuit") == FALSE &&
	GetGlobalBoolean("tat_TuskenMad") == FALSE ) {
	// If the whole party is disguised, set the disguise global and make Sand
	// People friendly
	if ( nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE ) {
		AdjustReputation(oPM0, oSandFaction, 50);
		SetGlobalBoolean("tat_TuskenSuit", TRUE);
		}
	// If somebody isn't disguised, make Sand People hostile but don't change
	// the disguise global
	else {
		AdjustReputation(oPM0, oSandFaction, -50);
		}
	}
// Disguise global is already set or player has angered Sand People
else {
	// If anybody isn't disguised or if the Sand People have been angered, make
	// Sand People hostile and set the disguise global
	if ( nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE ||
		GetGlobalBoolean("tat_TuskenMad") == TRUE ) {
		AdjustReputation(oPM0, oSandFaction, (-50));
		SetGlobalBoolean("tat_TuskenSuit", FALSE);
		}
	}
}