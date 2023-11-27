//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This fires during the initial section of the Sandral-Matale Feud scene. It
	spawns Nurik and his droids and then walks them into shot. They now get a
	facing command at the end.
	
	See also k_pdan_raha_03.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oNurik = CreateObject(OBJECT_TYPE_CREATURE, "dan14_nurik", GetLocation(GetObjectByTag("dan14ad_wp_nurik_01", 0)), 0);
	object oDrd1 = CreateObject(OBJECT_TYPE_CREATURE, "dan14ad_drd03", GetLocation(GetObjectByTag("dan14ad_wp_droidc_01", 0)), 0);
	object oDrd2 = CreateObject(OBJECT_TYPE_CREATURE, "dan14ad_drd04", GetLocation(GetObjectByTag("dan14ad_wp_droidd_01", 0)), 0);
	object oFace = GetObjectByTag("dan14ad_wp_alhan_02", 0);
	
	DelayCommand(0.5, AssignCommand(oNurik, ActionMoveToObject(GetObjectByTag("dan14ad_wp_nurik_02", 0))));
	DelayCommand(0.5, AssignCommand(oDrd1, ActionMoveToObject(GetObjectByTag("dan14ad_wp_droidc_02", 0))));
	DelayCommand(0.5, AssignCommand(oDrd2, ActionMoveToObject(GetObjectByTag("dan14ad_wp_droidd_02", 0))));
	
	DelayCommand(1.0, CP_FaceNPC(oNurik, oFace));
	DelayCommand(1.0, CP_FaceNPC(oDrd1, oFace));
	DelayCommand(1.0, CP_FaceNPC(oDrd2, oFace));
	
	ActionPauseConversation();
	ActionWait(6.0);
	ActionResumeConversation();
}
