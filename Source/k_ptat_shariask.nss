////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tat17_sharintrig.utt in tat_m17aa (Anchorhead).
	
	This script is fired by a trigger directly in front of the Hunting Lodge
	in Anchorhead. For some reason, the vanilla script does not initiate the
	conversation with Sharina when the player passes through, as was intended.
	The vanilla script is not able to be decompiled, but a new script was
	constructed by examining the byte code and using similar dialogue trigger
	scripts as a reference.
	
	Issue #45: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/45
	
	DP 2019-03-24
	
////////////////////////////////////////////////////////////////////////////////
	
	Updated to refactor using vanilla and CP utility Include functions, and tweak
	the positioning a bit.
	
	DP 2019-05-13
	
////////////////////////////////////////////////////////////////////////////////
	
	Further updated to adjust the positions and change to a pair of jumps rather
	than walking the party in, since there were pathfinding issues due to the
	Ronto in the way (the walking itself being the prior attempt to get around it).
	Also corrected a significant rookie mistake and changed the boolean to the
	trigger itself, not the NPC.
	
	Issue #260: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/260
	
	DP 2019-09-30                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(122.75,126.67,3.75), 0.0);
	location lPM1 = Location(Vector(120.344,125.17,3.75), 0.0);
	location lPM2 = Location(Vector(120.344,128.17,3.75), 0.0);
	location lPCStart = Location(Vector(111.846,122.809,3.75), 0.0);
	location lPM1Start = Location(Vector(109.44,121.309,3.75), 0.0);
	location lPM2Start = Location(Vector(109.44,124.309,3.75), 0.0);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			
			NoClicksFor(2.5);
			
			// Since there is a giant goddamn lump of a Ronto getting in the way of the jumping and messing
			// up my formation, first jump the party to a new starting point with a clear line of sight.
			CP_PartyHerder(lPCStart, lPM1Start, lPM2Start);
			
			DelayCommand(0.2, CP_DLGSetup("tat17_03shari_01"));
			DelayCommand(0.2, CP_DLGHerder(lPC, lPM1, lPM2));
			DelayCommand(0.2, CP_DLGInit("tat17_03shari_01", "", FALSE, 0.75, 2.0));
		}
}
