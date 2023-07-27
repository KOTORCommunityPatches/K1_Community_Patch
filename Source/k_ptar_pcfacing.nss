//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_duelann022.dlg in tar_m02ae (Taris Upper City Cantina).
	
	This script is fired as the camera zooms in on the computer panel during
	the cutscene of the first duel between Duncan and Gerlon in the Upper City
	Cantina. The original script faced the PC to the waypoint they are standing
	on. This has been changed to face them towards the computer panel they are
	in front of.
	
	See also k_ptar_pjump.
	
	Originally part of DP's "Taris Dueling Arena Adjustment" mod.
	
	Issue #493: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/493
	
	DP 2023-07-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetPartyMemberByIndex(0);
	object oFace = GetNearestObjectByTag("ComputerPanel", oPC, 1);
	
	CP_FaceNPC(oPC, oFace);
}
