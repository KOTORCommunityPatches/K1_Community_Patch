////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan15_starmap.dlg in danm15 (Dantooine Ruins).
	
	This script was originally just a delay for one of the nodes where the
	opening animation plays. It now also orients the party towards the Star
	Map off-screen in preparation for the following conversation.
	
	See also k_pdan_cut50, k_pdan_cut51, k_pdan_starmap02, and cp_dan15_facemap.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-08-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oStarmap = GetObjectByTag("dan15_starmap", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oStarmap)));
	
	AssignCommand(oBast, SetFacingPoint(GetPosition(oStarmap)));
	
	if (GetTag(oPM1) != "bastila")
		{
			AssignCommand(oPM1, SetFacing(DIRECTION_NORTH));
		}
	
	if (GetTag(oPM2) != "bastila")
		{
			AssignCommand(oPM2, SetFacing(DIRECTION_NORTH));
		}
	
	DelayCommand(3.75, ActionResumeConversation());
}
