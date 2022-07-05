//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar11_gadon112.dlg in tar_m11aa (Taris Hidden Bek Base Main Level).
	
	This is the OnConvExit and OnConvAbort script for Gadon's DLG. It re-enables
	Zaedra's AI after it was disabled for the duration of the conversation.
	
	See also cp_tar11_gadtlk, cp_tar11_zaaioff, k_ptar_gadmis01, k_ptar_zaerracex.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70
	
	DP 2022-07-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	AssignCommand(GetObjectByTag("Zaerdra111", 0), CP_DisableAI(FALSE));
}
