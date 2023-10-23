//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_cand043.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the exit node of the second portion of the scene with
	Canderous and his mooks in the Taris Undercity. The original script sent
	and surving mooks and Canderous to a trigger, which would destroy them on
	entering. Since that was potentially in plain view of the player, instead
	they are now walked to one of the exits. Ideally it would have been the
	elevator in the village, but the gate makes that a problem so it's one of
	the sewer entrances instead.
	
	See also k_ptar_candatk, k_ptar_cander03, k_ptar_canstr_en.
	
	Issue #235: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/235
	
	DP 2023-10-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_Exit(object oNPC, location lExit, float fDelay) {
	// Equivalent to k_inc_tar's TAR_MarkForCleanup()
	UT_SetPlotBooleanFlag(oNPC, SW_PLOT_BOOLEAN_10, TRUE);
	AssignCommand(oNPC, ClearAllActions());
	ChangeToStandardFaction(oNPC, STANDARD_FACTION_NEUTRAL);
	AssignCommand(oNPC, DelayCommand(fDelay, CP_ExitArea(lExit, FALSE)));
}

void main() {
	
	object oCand = GetObjectByTag("canderous043", 0);
	object oDavTrp1 = GetObjectByTag("daviktroop041", 0);
	object oDavTrp2 = GetObjectByTag("daviktroop042", 0);
	object oDavTrp3 = GetObjectByTag("daviktroop043", 0);
	location lExit = GetLocation(GetObjectByTag("tar04_sw04aan"));
	
	SetGlobalNumber("Tar_Canderous", 2);
	
	CP_Exit(oCand, lExit, 0.0);
	CP_Exit(oDavTrp1, lExit, 3.0);
	CP_Exit(oDavTrp2, lExit, 4.0);
	CP_Exit(oDavTrp3, lExit, 5.0);
}
