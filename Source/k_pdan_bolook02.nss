////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Clean up script fired by dan14_bolook.dlg in module danm14ac (Grove).
	
	A minor edit of the script that fires when ending the Murder Mystery
	quest to add in an appropriate reference to the new creature-based
	corpse added by K1CP.
	
	Issue #37: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/37
	
	Updated 2019-05-11 to set the corpse UTC to destroyable first to
	enable it being removed.
	
	Issue #50: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/50
	
	DP 2019-04-27                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oRickard = GetObjectByTag("dan14_rickard", 0);
	object oHandon = GetObjectByTag("dan14_handon", 0);
	object oBolook = GetObjectByTag("dan14_bolook", 0);
	object oDroid = GetObjectByTag("dan14_idroid", 0);
	object oCorpse = GetObjectByTag("cp_dan14ac_cpse", 0);
	object oPlaceable = GetObjectByTag("dan14_corpse", 0);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.0, 4.0);
	
	DestroyObject(oRickard, 0.0, FALSE, 0.0);
	DestroyObject(oHandon, 0.0, FALSE, 0.0);
	DestroyObject(oBolook, 0.0, FALSE, 0.0);
	DestroyObject(oDroid, 0.0, FALSE, 0.0);
	DestroyObject(oPlaceable, 0.0, FALSE, 0.0);
	AssignCommand(oCorpse,SetIsDestroyable(TRUE));
	DestroyObject(oCorpse, 0.0, FALSE, 0.0);
}
