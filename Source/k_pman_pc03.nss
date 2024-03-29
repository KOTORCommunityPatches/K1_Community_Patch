////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_pcexile.dlg in manm26aa (Manaan Ahto West).
	
	This script fires on the first node of the player's post-Hrakert Rift trial.
	The vanilla script locked everyone's orientations, but didn't face them first,
	so they were off for the whole scene. It has been replaced with the setup used
	in the first node of the Sunry DLG. Additionally, the party members are now
	jumped out of the way to the waypoints the occupy during the Sunry trial.
	
	Updated 2023-12-19 to revise party member setup, disabling their AI in an
	attempt to get them to behave. Also removed the Sith lawyer stuff, since
	he's jumped to the back of the court in a previous script, if still around.
	
	See also k_pman_post07, k_pman_post10.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-12-12 / DP 2023-12-19												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oFace = GetObjectByTag("man26_seljud1");
	object oJudge;
	int nIdx = 1;
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 1.0);
	
	SetGlobalBoolean("MAN_PCTRIAL", TRUE);
	
	AssignCommand(oPM1, CP_DisableAI(TRUE));
	AssignCommand(oPM2, CP_DisableAI(TRUE));
	CP_PartyJumpObject(oPM1, GetObjectByTag("trial_npc1"));
	CP_PartyJumpObject(oPM2, GetObjectByTag("trial_npc2"));
	DelayCommand(0.1, CP_FaceNPC(oPM1, oFace));
	DelayCommand(0.1, CP_FaceNPC(oPM2, oFace));
	
	oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
	
	while (GetIsObjectValid(oJudge))
		{
			AssignCommand(oJudge, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("arrest_player_01")))));
			AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1));
			AssignCommand(oJudge, ActionDoCommand(SetLockOrientationInDialog(oJudge, TRUE)));
			
			nIdx++;
			
			oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
		}
	
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oFace))));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	AssignCommand(oPC, ActionDoCommand(SetLockOrientationInDialog(oPC, TRUE)));
}
