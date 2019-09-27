////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in ebo_m41aa (Ebon Hawk - Lehon Crash).

	This script has been added to Zaalbar's line "Maybe if we're lucky the crash
	will take care of our gizka problem" during the scene after crash landing
	on the Unknown World if there are still Gizka on the ship (i.e. you didn't
	poison them or palm them off onto Nubassa on Manaan). The intention was
	obviously to prevent them from appearing on the Hawk subsequently, but it
	seems someone forgot to set the global to do so, causing them to still be
	present right up to landing on the Star Forge. This should put paid to the
	little bastards.
	
	Issue #289: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/289

	DP 2019-09-27                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalNumber("EBO_GIZKA_PLOT", 99);
}
