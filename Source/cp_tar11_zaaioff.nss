//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar11_gadon112.dlg in tar_m11aa (Taris Hidden Bek Base Main Level).
	
	This is fired by Gadon's final conversation branch, if the DLG falls through
	all the other branches. It disables Zaedra's AI for the duration of the
	conversation to prevent her performing ambient animations.
	
	See also cp_tar11_gadtlk, cp_tar11_zaaion, k_ptar_gadmis01, k_ptar_zaerracex.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70
	
	DP 2022-07-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	AssignCommand(GetObjectByTag("Zaerdra111", 0), CP_DisableAI(TRUE));
}
