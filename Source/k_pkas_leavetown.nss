//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_chuunda_01.dlg in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This is the exit script that fires on closing the party selection GUI once
	Zaalbar is returned. It adds a fade-in before transiting to the Great Walkway
	module.
	
	See also k_pkas_chuunrew.
	
	Issue #460: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/460
	
	DP 2021-01-12																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeIn();
	StartNewModule("kas_m22ab", "kas23ab_kas22ab");
}
