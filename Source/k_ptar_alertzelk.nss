////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_labdoor.utd in tar_m02ac (Taris Upper City South).

	This is the OnOpen script for the locked door in Zelka Forn's clinic,
	leading to the room with the Republic soldiers in kolto tanks. The
	conversation trigger was changed to herd the party into position to
	help deal with the usual facing issues.
	
	Issue #78: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/78

	DP 2019-09-29                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_tar"

void main() {
	
	object oOpener = GetLastOpenedBy();
	location lPC = Location(Vector(172.0,66.372,0.0), 0.0);
	location lPM1 = Location(Vector(174.5,67.872,0.0), 0.0);
	location lPM2 = Location(Vector(174.5,64.872,0.0), 0.0);
	
	if (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			if (!TAR_GetWearingSithArmor(OBJECT_INVALID))
				{
					UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
				}
			
			if (GetGlobalNumber("tar_zelkarm") < 2)
				{
					SetGlobalNumber("Tar_ZelkaRm", 1);
					
					NoClicksFor(1.2);
					SetGlobalFadeOut();
					
					CP_DLGSetup("Zelka021");
					CP_DLGHerder(lPC, lPM1, lPM2);
					CP_DLGInit("Zelka021");
				}
				else
					{
						if (GetGlobalNumber("tar_zelkarm") < 2)
							{
								SetGlobalNumber("tar_zelkarm", 99);
							}
					}
			
			if (GetTag(oOpener) == "Zelka021")
			{
				AssignCommand(oOpener, ActionResumeConversation());
				SetLocked(OBJECT_SELF, TRUE);
			}
		}
}
