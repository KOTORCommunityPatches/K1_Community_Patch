//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by 22aa_zaalb01_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	This script fires on the first node of the scene with party members if Zaalbar
	is not present hinting you should bring him. For some reason it jumps the
	speaking party member a second time, so this has been removed in order not
	to clash with the initial jump from the trigger OnEnter script.
	
	See also k_pkas_parttalk1.
	
	Issue #513: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/513
	
	DP 2022-12-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void main() {
	
	SetPartyTalk1Local(TRUE, OBJECT_SELF);
}
