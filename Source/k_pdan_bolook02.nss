//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Exit node script fired by dan14_bolook.dlg in module danm14ac (Grove).
	
	A minor edit of the clean up script that fires when ending the Murder Mystery
	quest to add in an appropriate reference to the new creature-based corpse.
	
	Updated 2019-05-11 to set the corpse UTC to destroyable first to enable it
	being removed.
	
	Updated 2020-06-16 to change the NoFade flag on the DestroyObject commands to
	TRUE instead of FALSE and extended the pause in the fade-in time a little.
	
	Issue #110: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/110
	
	DP 2019-04-27																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oRickard = GetObjectByTag("dan14_rickard", 0);
	object oHandon = GetObjectByTag("dan14_handon", 0);
	object oBolook = GetObjectByTag("dan14_bolook", 0);
	object oDroid = GetObjectByTag("dan14_idroid", 0);
	object oCorpse = GetObjectByTag("cp_dan14ac_cpse", 0);
	object oPlaceable = GetObjectByTag("dan14_corpse", 0);
	
	NoClicksFor(2.0);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(2.0, 3.0);
	
	DestroyObject(oRickard, 0.0, TRUE);
	DestroyObject(oHandon, 0.0, TRUE);
	DestroyObject(oBolook, 0.0, TRUE);
	DestroyObject(oDroid, 0.0, TRUE);
	DestroyObject(oPlaceable, 0.0, TRUE);
	AssignCommand(oCorpse,SetIsDestroyable(TRUE));
	DestroyObject(oCorpse, 0.0, TRUE);
}
