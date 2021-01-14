//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_tat17ac_hkutl.utp in tat_m17ac (Tatooine Droid Shop).
	
	This added script fires after exiting the party selection GUI after having
	purchased HK. If HK was added to the active party then he is jumped into
	the spot that the now destroyed stunt HK was standing in before doing a
	fade-in.
	
	See also cp_tat17ac_hkutl, k_ptat_hk47add.
	
	Issue #310: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/310
	
	DP 2021-01-14																*/
//////////////////////////////////////////////////////////////////////////////////

void HKSwap(object oPM, location lLoc, location lLoc2) {
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionJumpToLocation(lLoc));	
	AssignCommand(oPM, DelayCommand(2.0, AssignCommand(oPM, ActionMoveToLocation(lLoc2, FALSE))));
}

void main() {
	
	// If HK was added to the party, jump him into the spot stunt HK stood in for the
	// sake of visual consistency, then walk him around behind the player.
	if (IsNPCPartyMember(NPC_HK_47))
		{
			object oHK47 = GetObjectByTag("HK47", 0);
			location lHKJmp = Location(Vector(-3.92,6.90,1.39), -33.75);
			location lHKEnd = Location(Vector(0.72,3.74,1.39), 145.00);
			
			NoClicksFor(2.1);
			
			HKSwap(oHK47, lHKJmp, lHKEnd);
		}
	
	SetGlobalFadeIn(0.75, 2.0);
}
