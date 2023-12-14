//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for k_kor_star_map.utt in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This is the trigger OnEnter that starts the scene of the star map opening
	when entering the final chamber of the Tomb of Naga Sadow. It has been
	streamlined with changes made to the scene to show the full map animation.
	The actual opening of the map, updating the quest and rewarding XP has
	been pushed to a later script.
	
	See also cp_k39_strmap_ps.
	
	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756

	DP 2023-12-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	int nTalked = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);
	
	if (GetEnteringObject() == oPC && !nTalked)
		{
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
			
			ActionStartConversation(GetObjectByTag("kor_startalk", 0));

		}
}
