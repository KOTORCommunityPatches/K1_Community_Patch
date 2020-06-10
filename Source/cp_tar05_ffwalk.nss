//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_ff_dlg2.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script handles moving the player out of the way so that Mission can access
	the terminal.
	
	See also cp_tar05_ffend, cp_tar05_ffopen, cp_tar05_ffstart, k_ptar_startconv.
	
	Issue #66: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/66
	
	DP 2020-06-09																*/
////////////////////////////////////////////////////////////////////////////////// 

void main() {
	
	object oPC = GetFirstPC();
	object oMission = GetObjectByTag("mission", 0);
	location lPCEnd = Location(Vector(278.539,135.722,27.893), 170.0);
	location lMissEnd = Location(Vector(276.699,135.862,27.893), 135.0);
	
	AssignCommand(oPC, SetFacing(-5.0));
	AssignCommand(oPC, ActionMoveToLocation(lPCEnd, FALSE));
	AssignCommand(oPC, DelayCommand(1.0, ActionDoCommand(SetFacing(170.0))));
	// Fire an animation to force the facing to take effect.
	AssignCommand(oPC, DelayCommand(1.2, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0)));
	
	AssignCommand(oMission, DelayCommand(3.0, ActionMoveToLocation(lMissEnd, FALSE)));
	AssignCommand(oMission, DelayCommand(4.0, ActionDoCommand(SetFacing(135.0))));
	// Fire an animation to force the facing to take effect.
	AssignCommand(oMission, DelayCommand(4.2, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 1.0)));
}
