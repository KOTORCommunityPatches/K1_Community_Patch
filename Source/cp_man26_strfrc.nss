////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarb.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on the first node of the player's trial post-Sith Base.
	It strips off any Force Speed effect so they don't power walk during the shot
	of them walking into the courtroom (E1).
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	CP_RemoveForceSpeed(GetFirstPC());
}
