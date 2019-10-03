//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10ac (Taris Black Vulkar Base Garage).
	
	This replaces the vanilla k_act_talktrue used in this DLG, since we are now
	initiating the DLG with Kandon for party herding reasons, not the palceable.
	It also turns the AI back on for Kandon's girlfriend after the opening line
	of the scene is complete.
	
	See also k_ptar_kandtalk.
	
	Issue #241: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/241
	
	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oDLGHelper = GetObjectByTag("tar10_kandtalker", 0);
	object oKandGF = GetObjectByTag("KandonArk102", 0);
	
	NoClicksFor(0.5);
	
	SetLocalBoolean(oDLGHelper, SW_PLOT_HAS_TALKED_TO, TRUE);
	
	// Turn the AI of Kandon's girlfriend back on
	AssignCommand(oKandGF, CP_DisableAI(FALSE));
}
