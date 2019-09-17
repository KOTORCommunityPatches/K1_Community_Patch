////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar04_mission.dlg on Entry 8 in module tar_m04aa (Taris Undercity).
	
	This script is part of the constant, unceasing war against dialogue facing
	issues. In today's episode, Carth fails to look Mission squarely in the
	eye while asking her a question. Tune in next week to see if he manages
	to sort himself out.
	
	Issue #67: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/67
	
	DP 2019-04-27                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oCarth = GetObjectByTag("Carth", 0);
	object oMiss = GetObjectByTag("Mission", 0);
	
	AssignCommand(oCarth, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oCarth, ActionDoCommand(SetCommandable(TRUE, oCarth))));
	DelayCommand(0.2, AssignCommand(oCarth, SetFacingPoint(GetPosition(oMiss))));
}
