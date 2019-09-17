////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired during the Revelation scene on the Leviathan.
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Prevents sabers from being powered down during the cutscene.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oBastila = GetObjectByTag("bastila", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oLev40_wpconfb = GetObjectByTag("lev40_wpconfb", 0);
	object oLev40_wpconfc = GetObjectByTag("lev40_wpconfc", 0);
	object oDarthMalak400 = GetObjectByTag("DarthMalak400", 0);
	
	AddPartyMember(0, oBastila);
	AddPartyMember(2, oCarth);
	
	UT_TeleportPartyMember(GetObjectByTag("Carth", 0), GetLocation(oLev40_wpconfc));
	UT_TeleportPartyMember(GetObjectByTag("Bastila", 0), GetLocation(oLev40_wpconfb));
	
	SetLightsaberPowered(GetObjectByTag("Bastila", 0), 1, 1, 0);
	SetLockOrientationInDialog(oBastila, 0);
	
	SetLightsaberPowered(GetObjectByTag("DarthMalak400", 0), 1, 1, 0);
}
