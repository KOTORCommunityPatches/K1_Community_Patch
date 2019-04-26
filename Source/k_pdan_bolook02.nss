////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Clean up script fired by dan14_bolook.dlg in module danm14ac (Grove).
	
	A minor edit of the script that fires when ending the Murder Mystery
	quest to add in an appropriate reference to the new creature-based
	corpse added by K1CP.
	
	DP 2019-04-27                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	SetGlobalFadeIn(1.0, 4.0, 0.0, 0.0, 0.0);
	DestroyObject(GetObjectByTag("dan14_handon", 0), 0.0, 0, 0.0);
	DestroyObject(GetObjectByTag("dan14_rickard", 0), 0.0, 0, 0.0);
	DestroyObject(GetObjectByTag("dan14_idroid", 0), 0.0, 0, 0.0);
	DestroyObject(GetObjectByTag("dan14_bolook", 0), 0.0, 0, 0.0);
	DestroyObject(GetObjectByTag("dan14_corpse", 0), 0.0, 0, 0.0);
	DestroyObject(GetObjectByTag("cp_dan14ac_cpse", 0), 0.0, 0, 0.0);
}