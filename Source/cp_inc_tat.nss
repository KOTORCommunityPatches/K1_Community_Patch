////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_inc_tat
	
	Include script for Tatooine.
	                                                                          */
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
/*	CP_AdjustSandRep()
	
	This automatically sets the Sand People reputation so their faction will
	never have a value other than 0 (hostile) or 50 (neutral).
	
	- oTarget:	Object of faction to change. An invisible placeable is used for
				controlling the Sand People faction.
	- nHostile:	hostile = TRUE, neutral = FALSE.
	
	JC 2019-09-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_AdjustSandRep(object oTarget, int nHostile) {

object oPC = GetFirstPC();

if( nHostile == TRUE )
	AdjustReputation(oPC, oTarget, -GetReputation(oTarget, oPC));
else
	AdjustReputation(oPC, oTarget, 50 - GetReputation(oTarget, oPC));

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_SandRepFix()
	
	Triggers the Sand People to be hostile or neutral depending on various
	circumstances. Fixes several issues with their faction being wrong.
	
	Used in area enter and heartbeat scripts.
	
	JC 2019-09-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_SandRepFix() {

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
if( !GetIsObjectValid(oPM0) ||
	GetTag(oPM0) == "HK47" || GetTag(oPM0) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM0)) == sDisguise )
	nCheck0 = TRUE;
// Check the first party member to see if they're disguised
// (or a droid or not there)
if( !GetIsObjectValid(oPM1) ||
	GetTag(oPM1) == "HK47" || GetTag(oPM1) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM1)) == sDisguise )
	nCheck1 = TRUE;
// Check the second party member to see if they're disguised
// (or a droid or not there)
if( !GetIsObjectValid(oPM2) ||
	GetTag(oPM2) == "HK47" || GetTag(oPM2) == "T3M4" ||
	GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise )
	nCheck2 = TRUE;
// If the player is working for the Chieftain, make the Sand People friendly
if( GetGlobalBoolean("tat_TuskenJob") == TRUE &
	GetGlobalBoolean("tat_TuskenMad") == FALSE ) {
	CP_AdjustSandRep(oSandFaction, FALSE);
	}
// If the player hasn't angered the Sand People, but the disguise global isn't
// set, correct the Sand People attitude
if( GetGlobalBoolean("tat_TuskenSuit") == FALSE &&
	GetGlobalBoolean("tat_TuskenMad") == FALSE ) {
	// If the whole party is disguised, set the disguise global and make Sand
	// People friendly
	if( nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE ) {
		CP_AdjustSandRep(oSandFaction, FALSE);
		SetGlobalBoolean("tat_TuskenSuit", FALSE);
		}
	// If somebody isn't disguised and the player isn't working for the
	// Chieftain, make Sand People hostile but don't change the disguise global
	else if( GetGlobalBoolean("tat_TuskenJob") == FALSE ) {
		CP_AdjustSandRep(oSandFaction, TRUE);
		}
	}
// Disguise global is already set or player has angered Sand People
else {
	// If anybody isn't disguised or if the Sand People have been angered, and
	// the player isn't working for the Chieftain, make Sand People hostile
	// and set the disguise global
	if( (nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE ||
	      GetGlobalBoolean("tat_TuskenMad") == TRUE) &&
		GetGlobalBoolean("tat_TuskenJob") == FALSE ) {
		CP_AdjustSandRep(oSandFaction, TRUE);
		SetGlobalBoolean("tat_TuskenSuit", FALSE);
		}
	}
}
