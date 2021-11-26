//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_hangardlg.dlg in lev_m40ac (Leviathan Hangar).
	
	A minor tweak to the brief cutscene of the player and Carth running to the
	Ebon Hawk after the Malak showdown in the Leviathan Hangar. A player that
	has used Force Speed during the Malak fight will get to the Hawk too quickly
	and be left standing around. Now everyone gets a ClearAllEffects and the
	fade-out happens quicker. Since the player is now slower, Carth gets an
	increased delay to keep a suitable distance behind.
	
	Issue #130: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/130
	
	DP 2020-11-26																*/
//////////////////////////////////////////////////////////////////////////////////

void Herd_PM(string sWP, float fWait) {
	ClearAllActions();
	ClearAllEffects();
	ActionJumpToObject(GetObjectByTag(sWP, 0));
	ActionWait(fWait);
	ActionMoveToObject(GetObjectByTag("lev40_wpflee2", 0), TRUE);
}

void main() {
	
	int nCount = 0;
	object oNPC;
	
	NoClicksFor(8.0);
	
	SetGlobalFadeIn(0.5, 0.5);
	SetGlobalFadeOut(4.5, 2.0);
	
	while (nCount < GetPartyMemberCount())
		{
			oNPC = GetPartyMemberByIndex(nCount);
			
			SetCommandable(TRUE, oNPC);
			AssignCommand(oNPC, Herd_PM("lev40_wpflee" + IntToString(nCount), nCount * 2.0));
			
			nCount++;
		}
}
