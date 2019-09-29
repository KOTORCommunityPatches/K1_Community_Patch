////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_zelka021.dlg in tar_m02ac (Taris Upper City South).

	This script is used on Bastila's interjections in the Zelka Forn conversation
	to correct her facing. In this case, for those directed toward Zelka.
	
	See also cp_tar02_bastpc, cp_tar02_carthpc, cp_tar02_crthzel.
	
	Issue #78: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/78

	DP 2019-09-29                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {
	
	object oBast = GetObjectByTag("bastila");
	object oZelka = GetObjectByTag("Zelka021", 0);
	
	AssignCommand(oBast, ActionDoCommand(SetCommandable(TRUE, oBast)));
	AssignCommand(oBast, ClearAllActions());
	AssignCommand(oBast, ActionDoCommand(SetFacingPoint(GetPosition(oZelka))));
}
