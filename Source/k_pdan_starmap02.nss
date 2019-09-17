////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script fires in the early nodes of the new DLG for the merged Star Map
	opening scene. It originally fired on the opening node of dan15_bastila.dlg,
	setting some globals and making the Star Map play its animations. It now also
	positions the party in front of the map for the following conversation.
	
	See also k_pdan_cut50, k_pdan_cut51, k_pdan_starmap05, and cp_dan15_facemap.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM1 = CP_GetPartyMember(1);
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
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionMoveToLocation(lPC, FALSE));
	
	AssignCommand(oBast, ClearAllActions());
	AssignCommand(oBast, ActionMoveToLocation(lBast, FALSE));
	
	if (GetTag(oPM1) != "bastila")
		{
			AssignCommand(oPM1, ClearAllActions());
			AssignCommand(oPM1, ActionMoveToLocation(lPM2, FALSE));
		}
	
	if (GetTag(oPM2) != "bastila")
		{
			AssignCommand(oPM2, ClearAllActions());
			AssignCommand(oPM2, ActionMoveToLocation(lPM2, FALSE));
		}
	
	DelayCommand(6.0, ActionResumeConversation());
}
