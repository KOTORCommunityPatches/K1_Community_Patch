////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This is an amended version of the script that fires at the end of every
	branch of the Sandral-Matale Feud DLG. By default, this will destroy
	Casus' diary, which we no longer want to do as we have restored the
	Sandral protocol droid to enable the Casus quest to be completed post-Feud
	(for non-DS conclusions).
	
	Issue #27: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/27
	
	DP 2019-02-04                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	//DestroyObject(GetItemPossessedBy(GetPCSpeaker(), "dan14_diary"), 0.0, 0, 0.0);  // COMMENTING THIS OUT TO RETAIN DIARY
	DestroyObject(GetItemPossessedBy(GetPCSpeaker(), "dan16_key"), 0.0, 0, 0.0);
}
