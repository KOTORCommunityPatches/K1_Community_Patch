////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik081.dlg in tar_m08aa (Taris Davik's Estate).

	Simple script to ensure Canderous is facing the right person at various
	points during the opening conversation with Davik.

	Issue #57: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/57

	DP 2019-05-07                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oCand = GetObjectByTag("Cand");
	object oDavik = GetObjectByTag("Davik081", 0);
	
	AssignCommand(oCand, ClearAllActions());
	AssignCommand(oCand, ActionDoCommand(SetCommandable(TRUE, oCand)));
	DelayCommand(0.2, AssignCommand(oCand, SetFacingPoint(GetPosition(oDavik))));
}
