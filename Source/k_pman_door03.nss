////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man28aa_door04.utd in manm28aa (Manaan Hrakert Station).

	This script fires when the player opens the first door in Hrakert Station
	after getting off the sub and initiates the conversation with the Twi'lek
	mercenary. Party herding has been implemented in order to use a static
	camera during the conversation to resolve some out-of-frame issues.
	
	Curiously, this script is global, despite being completely module-specific
	in functionality.
	
	Updated 2019-09-29 to address a bit of minor clipping in certain wide shots
	by pushing the party members back about a metre.
	
	Issue #142: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/142

	DP 2019-05-18                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main()
{
    object oOpen = GetLastOpenedBy();
	location lPC = Location(Vector(133.6,183.5,5.25), 180.0);
	location lPM1 = Location(Vector(131.6,186.5,5.25), 180.0);
	location lPM2 = Location(Vector(135.6,186.5,5.25), 180.0);
	
    if(GetIsPC(oOpen))
		{
			CP_DLGSetup("man28_merc");
			CP_DLGHerder(lPC, lPM1, lPM2, TRUE, FALSE);
			CP_DLGInit("man28_merc", "", FALSE, 0.5, 1.0);
		}
}
