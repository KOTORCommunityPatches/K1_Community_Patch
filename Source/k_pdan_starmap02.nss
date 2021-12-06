//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script fires in the early nodes of the new DLG for the merged Star Map
	opening scene. It originally fired on the opening node of dan15_bastila.dlg,
	setting some globals and making the Star Map play its animations. It now also
	positions the party in front of the map for the following conversation.
	
	Updated 2020-12-06 to jump the party to the Star Map under the cover of the
	static camera focused on the map animation rather than waiting for them to
	walk to it.
	
	See also cp_dan15_facemap, cp_dan15_mapstrt, k_pdan_cut50, k_pdan_cut51,
	k_pdan_starmap05.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01 / DP 2021-12-06												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM2 = CP_GetPartyMember(2);
	object oStarmap = GetObjectByTag("dan15_starmap", 0);
	location lPC = Location(Vector(146.129,187.5,4.417), 55.0);
	location lBast = Location(Vector(150.129,187.5,4.417), 125.0);
	location lPM2 = Location(Vector(148.129,185.247,4.417), 90.0);
	
	ActionPauseConversation();
	
	NoClicksFor(4.0);
	
	CreateItemOnObject("dan_starpad", GetFirstPC(), 1);
	
	AddJournalQuestEntry("dan_ruins", 20);
	
	SetGlobalNumber("DAN_BASTILA_ZONE", 4);
	SetGlobalNumber("K_STAR_MAP", 10);
	SetGlobalBoolean("DAN_STARMAP_DONE", TRUE);
	
	AssignCommand(oStarmap, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
	AssignCommand(oStarmap, ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP01));
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oBast, lBast);
	
	// Since Bastila will always be returned as PM1 by the CP_GetPartyMember Include function due
	// to the alphabetical order of the NPC IDs, we can simply call PM2 with no further checks.
	CP_PartyJump(oPM2, lPM2);
	
	DelayCommand(6.0, ActionResumeConversation());
}
