//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_bast400.dlg in lev_m40aa (Leviathan Prison Block).
	
	This script forces Canderous to move to a waypoint in front of the torture
	chamber for his interjection at the end of the post-break out scene. Tweaked
	to give him a facing command to prevent the non-jail breaker version from
	facing off to one side.
	
	Updated 2023-10-13 to return any plot items to the player under the cover of
	the conversation to prevent quests potentially being softlocked if they don't
	happen to loot the locker where their pre-capture inventory is stored before
	escaping the Leviathan.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	Issue #698: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/698
	
	DP 2023-08-17 / DP 2023-10-13												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oLckr = GetObjectByTag("lev40_ptylocker", 0);
	
	NoClicksFor(1.0);
	
	// Make sure that the player can't leave behind any quest/plot items by giving them back now.
	CP_GivePCPlotItems(oLckr);
	
	AssignCommand(oCand, ActionMoveToObject(GetObjectByTag("lev40_wpcandrun", 0), 1, 1.0));
	DelayCommand(0.5, CP_FaceNPC(oCand, oBast));
}
