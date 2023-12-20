//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This is the final script that fires at the end of the second conversation if
	the player chooses the Dark Side and joins with Bastila. It's a replacement
	for the rather poorly named vanilla script "test3". It turns Jolee and Juhani
	hostile and disables everyone's plot flags. It now also ensures that both
	Jolee and Juhani have their AI enabled, since it seems possible in certain
	instances for one or both them to wind up passive during the fight.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oJolee = GetObjectByTag("jolee", 0);
	object oJuhani = GetObjectByTag("juhani", 0);
	object oBastila = GetObjectByTag("bastila", 0);
	
	// Failsafe to make sure their AI is active.
	AssignCommand(oJolee, CP_DisableAI(FALSE));
	AssignCommand(oJuhani, CP_DisableAI(FALSE));
	
	SetPlotFlag(oBastila, FALSE);
	SetPlotFlag(oJolee, FALSE);
	SetPlotFlag(oJuhani, FALSE);
	
	ChangeToStandardFaction(oJolee, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oJuhani, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.1, ExecuteScript("k_ai_master", oJolee, 3001));
	DelayCommand(0.1, ExecuteScript("k_ai_master", oJuhani, 3001));
	DelayCommand(0.1, ExecuteScript("k_ai_master", oBastila, 3001));
	
	DelayCommand(0.2, DestroyObject(OBJECT_SELF));
}
