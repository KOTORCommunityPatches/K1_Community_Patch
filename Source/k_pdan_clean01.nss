//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This is an amended version of the script that fires at the end of every branch
	of the Sandral-Matale Feud scene. By default, this will destroy Casus' diary,
	which we no longer want to do as we have restored the Sandral protocol droid
	to enable the Casus quest to be completed post-Feud (for non-DS conclusions).
	
	Updated 2023-11-27 to also destroy the key to Shen's room inside the estate.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2019-02-04 / DP 2023-11-27												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	DestroyObject(GetItemPossessedBy(GetFirstPC(), "dan16_key"));
	DestroyObject(GetItemPossessedBy(GetFirstPC(), "shenkey"));
}
