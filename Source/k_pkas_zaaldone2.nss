//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by 22aa_zaalb02_01.dlg in kas_m22ab (Kashyyyk The Great Walkway).

	This script fired during the opening of the conversation with Zaalbar talking
	about his family if he is present in the party. The original jumps Zaalbar to
	a waypoint for some reason, which was messing with the new party jump done via
	the trigger. That has been removed.
	
	see also k_pkas_zaaltalk2.
	
	Issue #719: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/719

	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void main() {
	
	SetZaalbarTalk2Local(TRUE);
}
