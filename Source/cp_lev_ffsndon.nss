//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnClosed for lev_cell09.utd/lev_cell011.utd in lev_m40aa (Leviathan Prison Block).

	This is an added door OnClosed script for the two forcefield doors for the cells
	used by Jolee and Mission when they are the chosen jailbreaker for the Leviathan
	escape sequence. It restarts the sound object that plays the forcefield sound
	loop to match the existing vanilla OnOpened script that stops it.
	
	See also k_plev_ffsndoff.
	
	Issue #660: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/660

	DP 2022-08-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oSound = GetNearestObjectByTag("forcefield", OBJECT_SELF, 1);
	
	if (GetIsObjectValid(oSound))
		{
			SoundObjectPlay(oSound);
		}
}
