//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_bast400.dlg in lev_m40aa (Leviathan Prison Block).
	
	This script forces Canderous to move to a waypoint in front of the torture
	chamber for his interjection at the end of the post-break out scene. Tweaked
	to give him a facing command to prevent the non-jail breaker version from
	facing off to one side.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-08-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	
	AssignCommand(oCand, ActionMoveToObject(GetObjectByTag("lev40_wpcandrun", 0), 1, 1.0));
	DelayCommand(0.5, CP_FaceNPC(oCand, oBast));
}
