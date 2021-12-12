//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_55a.dlg in STUNT_55a (Stunt Lehon Temple - Dark Side Ending).
	
	This added script fires just before the end of the Dark Side end cutscene
	on the Unknown World Temple Summit. It stops the background ambient SFX
	from playing, since they can otherwise still be heard during the final
	pre-rendered movie and credits sequence.
	
	Issue #538: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/538
	
	DP 2021-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oArea = GetArea(OBJECT_SELF);
	
	AmbientSoundStop(oArea);
}
