//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Generic turn hostile script in tat_m20aa (Tatooine Sand People Enclave).
	
	This script fires in multiple DLGs, turning the entire Enclave hostile.
	While the original script cannot be decompiled by DeNCS, enough of its
	byte code can be perused to reverse engineer it. Amongst other things,
	it strips off any Sand People disguises that the party may be wearing.
	This was causing some issues in the scene when entering the Enclave
	for the first time and choosing a hostile response (with or without HK).
	As well as leaving the party in their underwear, it would also cause them
	to T-pose. Now that functionality has been split out to a separate script,
	and this script simply adjusts the faction standing and sets a global. The
	turning hostile portion has been farmed out to a new UserDefine for the
	invisible placeable used to control the faction standing, since this script
	fires on DLG exit nodes.
	
	See also cp_tat20_fac_d, cp_tat20_ptyclr, cp_tat20_strip.
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2021-12-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {
	
	object oFac = GetObjectByTag("tat18_tuskanfac");
	
	SetGlobalBoolean("tat_TuskenMad", TRUE);
	
	// Set the Sand People faction relationship to 0 (hostile).
	CP_AdjustSandRep(oFac, TRUE);
	
	// Turn all Sand People NPCs hostile.
	SignalEvent(oFac, EventUserDefined(100));
}
