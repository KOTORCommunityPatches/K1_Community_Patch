////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tat17_sharintrig.utt in tat_m17aa (Anchorhead).
	
	This script is fired by a trigger directly in front of the Hunting Lodge
	in Anchorhead. For some reason, the vanilla script does not initiate the
	conversation with Sharina when the player passes through, as was intended.
	The vanilla script is not able to be decompiled, but a new script was
	constructed by examining the byte code and using similar dialogue trigger
	scripts as a reference.
	
	Updated 2019-05-13 to refactor using vanilla and CP utility Include
	functions, and tweak the positioning a bit.
	
	DP 2019-03-24                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oEntering = GetEnteringObject();
	object oSharina = GetObjectByTag("tat17_03shari_01", 0);
	location lPC = Location(Vector(122.75,126.67,3.75), 0.0);
	location lPM1 = Location(Vector(121.2,125.67,3.75), 0.0);
	location lPM2 = Location(Vector(121.2,127.67,3.75), 0.0);
	
	if ((GetIsPC(oEntering) && (!UT_GetTalkedToBooleanFlag(oSharina))))
		{
			CP_DLGSetup("tat17_03shari_01");
			CP_DLGHerder(lPC, lPM1, lPM2, FALSE, FALSE);
			CP_DLGInit("tat17_03shari_01", "", FALSE, 1.25, 0.85);
		}
}