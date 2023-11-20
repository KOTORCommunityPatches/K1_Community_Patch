////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarb.dlg in manm26aa (Manaan Ahto West).
	
	This script is fired at the end of the post-Sith Base trial of the player if
	they are found innocent. It restores any stored party members and then jumps
	everyone out into the hallway. However the original script fired the jump too
	early, meaning the companions would be left behind. It also faded in too soon,
	leaving the Arbiter visibly being destroyed in the background. The timings for
	those have been adjusted, and the judges are now also refaced forwards.
	
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-19																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oJudge;
	int nCnt = 1;
	location lPC = Location(Vector(37.13,-4.58,59.16), 180.00);
	location lPM1 = Location(Vector(38.34,-5.58,59.16), 180.00);
	location lPM2 = Location(Vector(38.34,-3.58,59.16), 180.00);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
 	SetGlobalFadeIn(1.5, 2.0);
	
	NoClicksFor(1.5);
	
	UT_RestoreParty();
	
	oJudge = GetObjectByTag("man26_seljud" + IntToString(nCnt));
	
	while (nCnt <6)
		{
			AssignCommand(oJudge, ActionDoCommand(SetFacing(DIRECTION_WEST)));
			AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
			
			nCnt++;
			
			oJudge = GetObjectByTag("man26_seljud" + IntToString(nCnt));
		}
 	
	SetLockOrientationInDialog(oPC, FALSE);
	
	DelayCommand(0.25, CP_PartyJump(oPC, lPC));
	DelayCommand(0.5, CP_PartyJump(CP_GetPartyMember(1), lPM1));
	DelayCommand(0.5, CP_PartyJump(CP_GetPartyMember(2), lPM2));
	
	DelayCommand(1.1, ActionResumeConversation());
}
