////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_repac.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on the first node of the cutscene of the Republic vs
	Sith trial. It switches the camera angle halfway through the Republic diplomat's
	line to focus on him.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-17																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	DelayCommand(3.0, SetDialogPlaceableCamera(1));
}
