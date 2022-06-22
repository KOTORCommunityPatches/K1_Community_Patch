//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_carth.dlg in ebo_m40aa (Ebon Hawk Pre-Leviathan stunt module).
	
	This script fires on the first node of the scene after the Hawk is interdicted
	by the Leviathan, where the player chooses who is going to break them out of
	jail. Everyone is given a ClearAllActions before getting an animation on the
	following node to force the hide masks/weapons flags to take effect.
	
	See also k_pebo_carthtlk.
	
	Issue #559: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/559
	
	DP 2022-06-22																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oJol = GetObjectByTag("jolee", 0);
	object oJuh = GetObjectByTag("juhani", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oHK = GetObjectByTag("hk47", 0);
	
	NoClicksFor(2.5);
	
	SetGlobalFadeIn(1.5, 1.0);
	
	AssignCommand(oCarth, ClearAllActions());
	AssignCommand(oBast, ClearAllActions());
	AssignCommand(oCand, ClearAllActions());
	AssignCommand(oJol, ClearAllActions());
	AssignCommand(oJuh, ClearAllActions());
	AssignCommand(oMiss, ClearAllActions());
	AssignCommand(oZaal, ClearAllActions());
	AssignCommand(oHK, ClearAllActions());
	
	ActionPauseConversation();
	ActionWait(1.0);
	ActionResumeConversation();
}
