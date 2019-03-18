////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired during the Revalation scene on the Leviathan.
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch.
	
	Prevents sabers from being powered down during the cutscene.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void sub1(object objectParam1, location locationParam2) {
	if ((!GetIsObjectValid(objectParam1))) {
		return;
	}
	if ((GetCurrentHitPoints(objectParam1) < 1)) {
		ApplyEffectToObject(0, EffectResurrection(), objectParam1, 0.0);
		ApplyEffectToObject(0, EffectHeal(1), objectParam1, 0.0);
	}
	SetCommandable(1, objectParam1);
	AssignCommand(objectParam1, ClearAllActions());
	AssignCommand(objectParam1, ActionJumpToLocation(locationParam2));
}

void main() {
	object oBastila = GetObjectByTag("bastila", 0);
	object oCarth = GetObjectByTag("carth", 0);
	AddPartyMember(0, oBastila);
	AddPartyMember(2, oCarth);
	object oLev40_wpconfb = GetObjectByTag("lev40_wpconfb", 0);
	object oLev40_wpconfc = GetObjectByTag("lev40_wpconfc", 0);
	sub1(GetObjectByTag("Carth", 0), GetLocation(oLev40_wpconfc));
	sub1(GetObjectByTag("Bastila", 0), GetLocation(oLev40_wpconfb));
	SetLightsaberPowered(GetObjectByTag("Bastila", 0), 1, 1, 0);
	SetLockOrientationInDialog(oBastila, 0);
	object oDarthMalak400 = GetObjectByTag("DarthMalak400", 0);
	SetLightsaberPowered(GetObjectByTag("DarthMalak400", 0), 1, 1, 0);
}