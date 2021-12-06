//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script fires on the first node of the new Star Map DLG. Since Bastila is
	now the DLG owner, the party turns to face her when the conversation begins,
	so everyone is refaced towards the door under the fade-out.
	
	See also cp_dan15_facemap, k_pdan_cut50, k_pdan_cut51, k_pdan_starmap02,
	k_pdan_starmap05.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2021-12-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM2 = CP_GetPartyMember(2);
	
	AssignCommand(oPC, SetFacing(DIRECTION_NORTH));
	DelayCommand(0.1, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
	
	AssignCommand(oBast, SetFacing(DIRECTION_NORTH));
	DelayCommand(0.1, AssignCommand(oBast, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
	
	AssignCommand(oPM2, SetFacing(DIRECTION_NORTH));
	DelayCommand(0.1, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
}
