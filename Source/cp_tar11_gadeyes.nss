////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar11_gadon112.dlg in tar_m11aa (Taris Hidden Bek Base).

	This script reorients Gadon towards the PC halfway through a line, since
	it starts out as a response to Zaerdra's interjection before responding
	to the PC.
	
	See also cp_tar11_pcfce1.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oGadon = GetObjectByTag("GadonThek112", 0);
	
	DelayCommand(3.5, AssignCommand(oGadon, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
}
