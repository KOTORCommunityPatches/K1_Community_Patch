////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	EndConversation/EndConverAbort for man26_pcexile.dlg in manm26aa (Manaan Ahto West).
	
	This script fires on the exit of the player's post-Hrakert Rift trial. The
	vanilla script had some deficiencies, so it has been adjusted to bring it in
	line with the other post-trial scripts.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRepDip = GetObjectByTag("man26_repac", 0);
	object oSithDip = GetObjectByTag("man26_sithac", 0);
	object oJudge;
	int nCnt = 1;
	location lPC = Location(Vector(37.13,-4.58,59.16), 180.00);
	location lPM1 = Location(Vector(38.34,-5.58,59.16), 180.00);
	location lPM2 = Location(Vector(38.34,-3.58,59.16), 180.00);
	location lSith = GetLocation(GetObjectByTag("wp_man26_sithlaw", 0));
 	location lRep = GetLocation(GetObjectByTag("wp_man26_replaw", 0));
	
	SetLockOrientationInDialog(oPC, FALSE);
	AssignCommand(oPM1, CP_DisableAI(FALSE));
	AssignCommand(oPM2, CP_DisableAI(FALSE));
 	
	if (GetGlobalBoolean("MAN_EXILED"))
		{
			StartNewModule("ebo_m12aa");
		}
		else
			{
				SetGlobalFadeOut();
				SetGlobalFadeIn(1.5, 2.0);
				
				NoClicksFor(1.5);
				
				SetLockOrientationInDialog(oSithDip, FALSE);
				AssignCommand(oRepDip, JumpToLocation(lSith));
				AssignCommand(oSithDip, JumpToLocation(lRep));
				
				oJudge = GetObjectByTag("man26_seljud" + IntToString(nCnt));
				
				while (nCnt <6)
					{
						AssignCommand(oJudge, ActionDoCommand(SetFacing(DIRECTION_WEST)));
						AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
						
						nCnt++;
						
						oJudge = GetObjectByTag("man26_seljud" + IntToString(nCnt));
					}
				
				DelayCommand(0.25, CP_PartyJump(oPC, lPC));
				DelayCommand(0.5, CP_PartyJump(oPM1, lPM1));
				DelayCommand(0.5, CP_PartyJump(oPM2, lPM2));
			}
}
