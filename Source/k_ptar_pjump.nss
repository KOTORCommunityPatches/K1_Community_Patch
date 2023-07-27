//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_duelann022.dlg in tar_m02ae (Taris Upper City Cantina).
	
	This script is fired on the starting node of the cutscene of the first duel
	between Duncan and Gerlon in the Upper City Cantina. It jumps the party into
	the room as well as disabling Duncan and Gerlon's AI. The original jumped
	the party to waypoints that were scattered widely apart, meaning Carth isn't
	visible in the establishing shot. This has been changed to jump them in
	closer together, with the PC still in their original waypoint position.
	
	See also k_ptar_pcfacing.
	
	Originally part of DP's "Taris Dueling Arena Adjustment" mod.
	
	Issue #493: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/493
	
	DP 2023-07-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oDuncan = GetObjectByTag("DeadeyeDun021", 0);
	object oGerlon = GetObjectByTag("GerlonTwof021", 0);
	location lPC = Location(Vector(109.78,93.31,0.06), -33.75);
	location lPM1 = Location(Vector(109.17,94.62,0.00), -33.75);
	location lPM2 = Location(Vector(108.33,93.37,0.00), -33.75);
	
	CP_PartyHerder(lPC, lPM1, lPM2, TRUE);
	
	AssignCommand(oDuncan, CP_DisableAI(TRUE));
	AssignCommand(oGerlon, CP_DisableAI(TRUE));
}
