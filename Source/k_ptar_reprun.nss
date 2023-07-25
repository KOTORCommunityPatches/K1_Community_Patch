//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar04_republicso.dlg in tar_m04aa (Taris Undercity).
	
	This script is fired when after the player has given the infected Republic
	soldier the Rakghoul serum and he runs off. The party now gets a facing
	command so they are actually looking the direction the soldier runs off in.
	For some reason the player refused to cooperate, so had to be given a move
	command to achieve the same result. Additionally, the soldier now has their
	plot flag set to ensure they don't die too quickly at the end of the scene,
	and their AI is disabled earlier than in the vanilla scene. This ensures
	that they don't ignore their commands and charge off into combat with the
	Rakghouls.
	
	See also k_ptar_repserum, k_ptar_repsoldie, tar_pc_jump.
	
	Issue #666: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/666
	
	DP 2023-07-25																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void NPCFlee() {
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("tar04_wprepflee1", 0), TRUE, 1.0);
	ActionJumpToObject(GetObjectByTag("tar04_wprepflee2", 0), TRUE);
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRepSld = GetObjectByTag("REPUBLICSO", 0);
	object oFace = GetObjectByTag("tar04_wprepflee2", 0);
	object oRak;
	object oWP;
	location lPC = Location(Vector(321.5,240.5,3.375), 225.0);
	int nCnt;
	
	NoClicksFor(4.0);
	
	SetPlotFlag(oRepSld, TRUE);
	AssignCommand(oRepSld, CP_DisableAI(TRUE));
	
	CP_FaceNPC(oPM1, oFace);
	CP_FaceNPC(oPM2, oFace);
	
	// The PC refuses to obey a facing command, so walk them briefly to force a change.
	DelayCommand(0.75, AssignCommand(oPC, ActionForceMoveToObject(oFace)));
	DelayCommand(1.5, AssignCommand(oPC, ClearAllActions()));
	
	nCnt = 0;
	
	while (GetIsObjectValid(oWP = GetObjectByTag("tar04_wpreprg", nCnt)))
		{
			oRak = CreateObject(OBJECT_TYPE_CREATURE, "tar04_repsolrg", GetLocation(oWP), FALSE);
			
			SetPlotFlag(oRak, TRUE);
			
			nCnt++;
		}
	
	SetGlobalFadeOut(3.5, 0.5);
	
	AssignCommand(oRepSld, NPCFlee());
	
	ActionPauseConversation();
	ActionWait(4.0);
	ActionResumeConversation();
	
	ExecuteScript("k_act_cmusic_on", OBJECT_SELF);
}
