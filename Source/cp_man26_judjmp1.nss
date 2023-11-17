////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_seljud1.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on most of the first nodes of each branch of the DLG
	for Judge Shelkar in the courtroom, jumping the party into position to help
	alleviate facing and camera angle issues.
	
	See also cp_man26_judjmp2, cp_man26_judjmp3, cp_man26_judjmp4, cp_man26_judjmp5.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJudge = GetObjectByTag("man26_seljud1");
	location lPC = Location(Vector(61.61,-4.96,59.16), 30.00);
	location lJolee = Location(Vector(61.61,-3.46,59.16), -30.00);
	location lPM2 = Location(Vector(60.75,-4.21,59.16), 0.00);
	
	SetGlobalFadeOut();
	DelayCommand(0.5, SetGlobalFadeIn(0.5, 0.5));
	
	// Reface the Judge towards the party.
	DelayCommand(0.1, AssignCommand(oJudge, ActionDoCommand(SetFacing(DIRECTION_WEST))));
	DelayCommand(0.15, AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
	
	if (IsNPCPartyMember(NPC_JOLEE))
		{
			DelayCommand(0.1, CP_PartyJump(oPC, lPC));
			DelayCommand(0.2, CP_FaceNPC(oPC, oJudge));
			
			if (GetTag(oPM1) == "Jolee")
				{
					DelayCommand(0.1, CP_PartyJump(oPM1, lJolee));
					DelayCommand(0.1, CP_PartyJump(oPM2, lPM2));
				}
				else
					{
						DelayCommand(0.1, CP_PartyJump(oPM2, lJolee));
						DelayCommand(0.1, CP_PartyJump(oPM1, lPM2));
					}
		}
		else
			{
				DelayCommand(0.1, CP_PartyHerder(lPC, lJolee, lPM2));
				DelayCommand(0.2, CP_FaceNPC(oPC, oJudge));
			}
}
