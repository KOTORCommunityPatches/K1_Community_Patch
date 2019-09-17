////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_kor_dakleave

	Makes Dak Vesser leave the cantina on Korriban.
	
	Issue #7: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/7
	
	JC 2019-09-08                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oExit = GetObjectByTag("k33_way_yuthuraexit", 0);

	SetGlobalBoolean("KOR_DAK_LEAVE", FALSE); // to prevent him from respawning
	ActionForceMoveToObject(oExit, FALSE);
	ActionDoCommand(SetCommandable(TRUE));
	ActionDoCommand(DestroyObject(OBJECT_SELF));
	SetCommandable(FALSE);
}
