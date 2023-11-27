//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This is a replacement for the various scripts that fire on the exit node of
	every branch of the Sandral-Matale Feud scene with a peaceful resolution. It
	ensures that the NPCs are all destroyed under a fade-out. The originals relied
	on an in-DLG fade to cover them, which didn't last long enough.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeOut();
	
	DestroyObject(GetObjectByTag("dan14_nurik", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14_shen", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14_ahlan", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14_rahasia", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14ad_drd01", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14ad_drd02", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14ad_drd03", 0), 0.0, TRUE);
	DestroyObject(GetObjectByTag("dan14ad_drd04", 0), 0.0, TRUE);
	
	DelayCommand(1.5, SetGlobalFadeIn(0.0, 1.5));
}
