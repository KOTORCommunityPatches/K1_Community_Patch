//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script fires on the opening node of the initial cutscene of the final
	showdown with Saul Karath on the bridge. Since this scene is now initiated
	by Saul himself and not the invisible placeable, an extra command to set
	the Talked To boolean on that needs to be added so that the post-fight scene
	triggers correctly. Additionally, Carth and Bastila have their AI disabled
	and Carth has his head orientation locked for the scene to resolve the nagging
	habit of companions staring at the player rather the the speaker (even after
	being removed from the party, apparently). Now Carth will finally look his
	arch-nemesis Saul directly in the eyes during their fateful confrontation,
	rather than spending the duration of it staring at the player's ass.
	
	See also cp_lev40_hdunlck, k_plev_brdgcs_en.
	
	Issue #417: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/417
	
	DP 2020-09-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("Bastila", 0);
	object oCarth = GetObjectByTag("Carth", 0);
	object oInvis = GetObjectByTag("lev40_talker", 0);
	location lPC = GetLocation(GetObjectByTag("lev_jump_wp_pc", 0));
	location lCarth = GetLocation(GetObjectByTag("lev_jump_wp_carth", 0));
	location lBast = GetLocation(GetObjectByTag("lev_jump_wp_bastila", 0));
	int SW_PLOT_HAS_TALKED_TO = 10;
	
	SetPartyLeader(NPC_PLAYER);
	
	ActionPauseConversation();
	
	RemovePartyMember(NPC_CARTH);
	RemovePartyMember(NPC_BASTILA);
	
	AssignCommand(oCarth, CP_DisableAI(TRUE));
	AssignCommand(oBast, CP_DisableAI(TRUE));
	
	AssignCommand(oCarth, SetFacing(DIRECTION_EAST));
	AssignCommand(oBast, SetFacing(DIRECTION_EAST));
	
	AssignCommand(oPC, JumpToLocation(lPC));
	AssignCommand(oCarth, JumpToLocation(lCarth));
	AssignCommand(oBast, JumpToLocation(lBast));
	
	SetLockHeadFollowInDialog(oCarth, TRUE);
	
	DelayCommand(2.0, SetLocalBoolean(oInvis, SW_PLOT_HAS_TALKED_TO, TRUE));
	
	DelayCommand(3.0, ActionResumeConversation());
}
