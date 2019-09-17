////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_zaeclg.utt in tar_m11aa (Taris Hidden Beks Base)

	This script is fired by a trigger in front of Gadon the first time the
	party enters the Hidden Beks' base, initiating Zaerdra's "Hold it right
	there" dialogue. This has been altered to jump the party into a more
	desirable position, in conjunction with chaining Gadon's conversation
	on directly to the end (see k_ptar_zaerd).

	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70

	DP 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(63.9,74.5,0.0), 90.0);
	location lPM1 = Location(Vector(65.4,72.5,0.0), 90.0);
	location lPM2 = Location(Vector(62.4,72.5,0.0), 90.0);

	if ((GetIsPC(oEntering) && (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			CP_DLGSetup("zaerdra111");
			CP_DLGHerder(lPC, lPM1, lPM2, TRUE, FALSE);
			CP_DLGInit("zaerdra111", "", FALSE, 0.5, 0.75);
		}
}
