//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_comp_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This script fires when the player talks to the Rakatan computer hologram
	guarding the Star Map for the first time. In some cases it seems that the
	hologram can get stuck mid-way through one of its ambient animations. The
	player may also freeze on the subsequent line due to the party jump. Now
	the hologram gets cleared of its ambient animations first before being
	faced, and everyone plays an animation to hopefully cure any problems.
	
	See also k_pkas_facepc.
	
	Issue #346: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/346
	
	DP 2021-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRak = GetObjectByTag("kas24_computer");
	location lPC = GetLocation(GetWaypointByTag("kas25_wp_compu1"));
	location lPM1 = GetLocation(GetWaypointByTag("kas25_wp_compu2"));
	location lPM2 = GetLocation(GetWaypointByTag("kas25_wp_compu3"));
	
	// Replaces SetComputerTalkGlobal from k_inc_kas to reduce include guff.
	SetGlobalBoolean("kas_ComputerTalk", TRUE);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.6, 1.0);
	
	NoClicksFor(1.5);
	
	SetPartyLeader(NPC_PLAYER);
	
	ClearAllActions();
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.5, CP_FaceNPC(oPC, oRak));
	DelayCommand(0.5, CP_FaceNPC(oPM1, oRak));
	DelayCommand(0.5, CP_FaceNPC(oPM2, oRak));
	DelayCommand(0.5, CP_FaceNPC(oRak, oPC));
}
