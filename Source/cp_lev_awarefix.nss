//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_carth.dlg in ebo_m40ad (Ebon Hawk Post-Leviathan).
	
	This is an added script that fires at the start of the post-Leviathan escape
	conversation on the Ebon Hawk. We have not been able to discover/replicate
	the conditions for this to occur, but it appears that in a limited number of
	cases that the rescuer in the jail break sequence is not being de-stealthed
	when interacting with the computer to release the rest of the party, as should
	normally be the case. They remain in stealth in the post-escape sequence and
	the conversation can become stuck because Carth and/or the PC can't detect
	the NPC in question when they have to speak a line. Mission typically seems
	to be the one it happens with. This script provides a temporary buff that
	should allow the NPC to be detected and the conversation to proceed, although
	the NPC will remain stealthed throughout the conversation. Since Odyssey is
	just a reworked version of Aurora, it has many leftovers from Neverwinter
	Nights. One of them is the function that grants the effect of the 6th level
	Divination spell True Seeing, which in D&D allows the user to see through all
	types of magical invisibility. Apparently that includes stealth generators.
	The stealthed NPC appears to disappear from the ship post-conversation, but will
	be available again normally in the party selection upon the next disembarkation. 
	
	Updated 2021-12-10 to now additionally clear the party under the initial fade-out
	to play animations on the following node in order to force the hide weapons and
	masks flags to take effect on the entire party (only applies to active participants).
	
	See also cp_ebo40ad_endcs, cp_ebo40ad_false, cp_ebo40ad_pause, k_pebo_carthtlk.
	
	Issue #9: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/9
	
	Issue #527: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/527
	
	DP 2021-11-19 / DP 2021-12-10												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("carth", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oJol = GetObjectByTag("jolee", 0);
	object oJuh = GetObjectByTag("juhani", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oHK = GetObjectByTag("hk47", 0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	
	NoClicksFor(0.5);
	
	AssignCommand(oCarth, ClearAllActions());
	AssignCommand(oCand, ClearAllActions());
	AssignCommand(oJol, ClearAllActions());
	AssignCommand(oJuh, ClearAllActions());
	AssignCommand(oMiss, ClearAllActions());
	AssignCommand(oZaal, ClearAllActions());
	AssignCommand(oHK, ClearAllActions());
	
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTrueSeeing(), oPC, 240.0);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTrueSeeing(), oCarth, 240.0);
	
	DelayCommand(0.5, ActionResumeConversation());
}
