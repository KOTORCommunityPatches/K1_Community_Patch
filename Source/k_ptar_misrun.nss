//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_mission.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the first node of scene where Mission meets the party
	in the Undercity. Originally she was instructed to run to the player, which
	resulted in her getting right up the player's grill. Now she runs to a spot
	a few metres away, respecting social distancing during the Rakghoul pandemic.
	Since there are now two separate triggers and two separate sets of spawn and
	run-to locations, the script has to check which trigger initiated the scene.
	
	See also cp_tar04_miskill, k_ptar_addmissio, k_ptar_desmis, k_ptar_hdfate_ud,
	k_ptar_miscrt_en, k_ptar_rakrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-10-30																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	location lMissRun_Left = Location(Vector(254.00,220.50,3.00), 220.00);
	location lMissRun_Right = Location(Vector(269.50,202.50,3.00), 190.00);
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	
	ActionPauseConversation();
	
	if (!UT_GetPlotBooleanFlag(GetObjectByTag("cp_tar04_missspl"), SW_PLOT_BOOLEAN_05))
		{
			ActionMoveToLocation(lMissRun_Right, TRUE);
		}
		else
			{
				ActionMoveToLocation(lMissRun_Left, TRUE);
			}
	
	ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC())));
	
	DelayCommand(5.0, ActionResumeConversation());
}
