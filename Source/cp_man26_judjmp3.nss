////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_seljud3.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on most of the first nodes of each branch of the DLG
	for Judge Naleshekan in the courtroom, jumping the party into position to help
	alleviate facing and camera angle issues.
	
	See also cp_man26_judjmp1, cp_man26_judjmp2, cp_man26_judjmp4, cp_man26_judjmp5.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJudge = GetObjectByTag("man26_seljud3");
	location lPC = Location(Vector(60.85,-8.40,59.16), 30.00);
	location lPM1 = Location(Vector(60.85,-6.89,59.16), -30.00);
	location lPM2 = Location(Vector(59.99,-7.65,59.16), 0.00);
	
	SetGlobalFadeOut();
	DelayCommand(0.5, SetGlobalFadeIn(0.5, 0.5));
	
	// Reface the Judge towards the party.
	DelayCommand(0.1, AssignCommand(oJudge, ActionDoCommand(SetFacing(DIRECTION_WEST))));
	DelayCommand(0.15, AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
	
	DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
	DelayCommand(0.2, CP_FaceNPC(oPC, oJudge));
}
