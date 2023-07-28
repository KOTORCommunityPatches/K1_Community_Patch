//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_zelka021.dlg in tar_m02ac (Taris Upper City South).
	
	This script fires during the conversation with Zelka Forn in the Taris Upper
	City South medical clinic when discussing the Rakghoul plague cure. It has
	Gurney walk towards the entrance, ready to accost the player as they leave
	to tell them about Davik also wanting the cure. Gurney now gets an additional
	facing command once he is in position, since by default he ends up staring out
	the doorway.
	
	See also cp_tar02_fcegurn, k_ptar_zelkatk3x.
	
	Issue #494: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/494
	
	DP 2023/07/28																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oGurney = GetObjectByTag("gurney021", 0);
	object oWP = GetObjectByTag("tar02_gurneywait", 0);
	
	SetGlobalNumber("Tar_ZelkaTk", 2);
	
	AssignCommand(oGurney, ActionMoveToObject(oWP));
	AssignCommand(oGurney, ActionDoCommand(SetFacing(DIRECTION_WEST)));
	AssignCommand(oGurney, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
}
