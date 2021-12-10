//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_carth022.dlg in tar_m02af (Taris Upper City Hideout).
	
	This script fires near the start of the scene where the player wakes up in
	the Taris apartment and talks to Carth. The player ends up at an angle facing
	away from Carth after the stunt animation getting them out of bed, so this
	script has been hijacked to give them a refacing.
	
	Issue #491: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/491
	
	DP 2021/12/10																*/
//////////////////////////////////////////////////////////////////////////////////


void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("carth", 0);
	
	NoClicksFor(1.5);
	
	SetGlobalNumber("tar_Carth", 2);
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oCarth)));
	DelayCommand(0.2, AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}
