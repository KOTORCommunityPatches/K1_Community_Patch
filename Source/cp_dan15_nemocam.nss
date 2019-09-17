////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan15_ancientdrd.dlg in danm15 (Dantooine Ruins).
	
	This is a simple script to switch the static camera halfway through a line.
	In the vanilla DLG, the camera angle on Nemo's corpse is used for the entire
	length of a line around 16 or so seconds long that starts off talking about
	Revan and Malak. It made more sense to start focused on the droid and only
	cut to the Nemo camera around halfway through when it mentions the one that
	was found to be unworthy.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	DP 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

void main()
{
	
	DelayCommand(6.0, SetDialogPlaceableCamera(5));
}
