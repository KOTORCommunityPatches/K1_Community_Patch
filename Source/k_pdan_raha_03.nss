//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This fires during the initial section of the Sandral-Matale Feud scene. It
	walks Ahlan and his droids into shot. They now get a facing command at the end.
	
	See also k_pdan_raha_04.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oAhlan = GetObjectByTag("dan14_ahlan", 0);
	object oDrd1 = GetObjectByTag("dan14ad_drd01", 0);
	object oDrd2 = GetObjectByTag("dan14ad_drd02", 0);
	object oFace = GetObjectByTag("dan14ad_wp_nurik_02", 0);
	object oWP1 = GetObjectByTag("dan14ad_wp_alhan_02", 0);
	object oWP2 = GetObjectByTag("dan14ad_wp_droida_02", 0);
	object oWP3 = GetObjectByTag("dan14ad_wp_droidb_02", 0);
	
	ActionPauseConversation();
	
	CP_PartyMoveObject(oAhlan, oWP1);
	CP_PartyMoveObject(oDrd1, oWP2);
	CP_PartyMoveObject(oDrd2, oWP3);
	
	DelayCommand(1.0, CP_FaceNPC(oAhlan, oFace));
	DelayCommand(1.0, CP_FaceNPC(oDrd1, oFace));
	DelayCommand(1.0, CP_FaceNPC(oDrd2, oFace));
	
	ActionWait(3.0);
	ActionResumeConversation();
}
