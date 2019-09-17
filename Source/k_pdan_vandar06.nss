////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).

	This script is fired when the party returns after Vandar tells them to
	return the Hawk while the Council discuss the Star Map. The vanilla script
	only moves the player, but now the entire party is moved. There's also a
	couple of camera switches, similar to what happens on the intro nodes.
	
	See also k_pdan_vandar03, k_pdan_vandar05, and k_pdan_vandar08.

	Issue #104: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/104

	DP 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	location lPC = Location(Vector(103.204,34.028,4.08), -47.0);
	location lPM1 = Location(Vector(101.164,34.08,4.04), -47.0);
	location lPM2 = Location(Vector(103.142,36.058,4.04), -47.0);
	
	SetGlobalFadeIn(0.1, 0.75);
	
	//Run the party to the Council
	CP_DLGHerder(lPC, lPM1, lPM2, FALSE, TRUE);
	
	DelayCommand(2.5, SetDialogPlaceableCamera(37));
	DelayCommand(4.5, SetDialogPlaceableCamera(8));
}
