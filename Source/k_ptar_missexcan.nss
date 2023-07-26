//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_mission031.dlg in tar_m03ae (Taris Lower City Javyar's Cantina).
	
	Fired on the exit node of the party initiating a conversation with Mission
	after the cutscene where she is confronted by a pair of Rodians (AKA the
	"greenies"). It commands Mission and Zaalbar to exit the cantina. A minor
	edit to add a delay to Zaalbar's command to give Mission enough head-start
	that he doesn't bump into her.
	
	See also cp_tar03_misjump, k_ptar_miscs0.
	
	Issue #495: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/495
	
	DP 2023-07-26																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"

void main() {
	
	object oExit = GetObjectByTag("p_exit", 0);
	
	AssignCommand(GetObjectByTag("mission031", 0), TAR_PlotMoveObject(oExit, FALSE));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("zaalbar031", 0), TAR_PlotMoveObject(oExit, FALSE)));
}
