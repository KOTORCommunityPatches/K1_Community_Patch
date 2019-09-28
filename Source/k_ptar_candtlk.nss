////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_candtlk.utt in tar_m02ae (Taris Upper City Cantina).

	This is the trigger OnEnter script that initiates the conversation
	with Canderous in the Upper City cantina after the swoop race. Since
	there were various facing issues during the conversation, and pathing
	issues for Canderous when the conversation was over, the party is
	now jumped into position. 
	
	See also cp_tar_pcfacecan.
	
	Canderous was being difficult and refused to obey facing commands, so
	his spawn-in script has been altered to adjust his facing in that.
	See k_ptar_spawncand.
	
	Issue #75: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/75

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oCand = GetObjectByTag("Canderous031", 0);
	location lPC = Location(Vector(118.109,108.507,0.0), 254.0);
	location lPM1 = Location(Vector(119.937,109.899,0.0), 254.0);
	location lPM2 = Location(Vector(117.041,110.586,0.0), 254.0);
	
	if (GetIsPC(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF) && GetIsObjectValid(oCand))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			NoClicksFor(1.0);
			
			SetGlobalFadeOut();
			
			CP_DLGSetup("Canderous031");
			CP_DLGHerder(lPC, lPM1, lPM2);
			CP_DLGInit("Canderous031");
		}
}
