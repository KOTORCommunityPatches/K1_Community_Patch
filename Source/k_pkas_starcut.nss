//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_comp_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This is the script that fires on the exit node of the conversation with the
	Rakatan computer in the Lower Shadowlands. It starts a second conversation
	with available party members and destroys the computer hologram. The vanilla
	sequence had a quest update notification pop-up between these two dialogues,
	which was jarring. That has now been forced to occur after this second DLG
	finishes by moving relevant elements from the script that has the map play
	its animation and the computer DLG itself.
	
	See also k_pkas_openmap.
	
	Issue #517: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/517
	
	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_AddQuest(object oTarget) {
	SetGlobalBoolean("kas_StarMap", TRUE);
	AddJournalQuestEntry("kas22_starmap", 70, FALSE);
	CreateItemOnObject("kas_starpad", oTarget, 1);
}

void main() {
	object oPC = GetFirstPC();
	object oInvis = GetObjectByTag("kas25_starspeak", 0);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.25, 0.25);
	
	NoClicksFor(1.0);
	
	AssignCommand(oInvis, DelayCommand(0.1, ActionStartConversation(oPC, "kas25_starspeak", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	AssignCommand(oInvis, DelayCommand(0.5, ActionDoCommand(CP_AddQuest(oPC))));
	
	DelayCommand(1.0, DestroyObject(OBJECT_SELF));
}
