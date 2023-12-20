//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by 22aa_zaalb01_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	This script fires on the first node of the scene with Zaalbar when entering
	the landing pad for the first time. For some reason it jumps him a second time,
	so this has been removed in order not to clash with the initial jump from the
	trigger OnEnter script.
	
	See also k_pkas_zaaltalk1.
	
	Issue #513: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/513
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int SW_PLOT_BOOLEAN_01 = 0;
	
	SetLocalBoolean(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_01, TRUE);
}
