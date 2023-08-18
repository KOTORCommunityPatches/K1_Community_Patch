//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul403.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is the script that fires at the end of the torture scene at the start of
	the Leviathan Prison Block. It swaps the player character to the jail breaker
	chosen on the Ebon Hawk. Primarily this is a simple tweak to extend the time
	before the fade-in slightly to better mask the transition between the end of
	the torture scene and the start of the jail breaker sequence. But since the
	original approach to implementing the character swap was unnecessarily bloated,
	this has also been condensed into a single function.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-08-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_lev"
 
 void SwitchPlayer(int nChar, object oWP) {
 	switch (nChar)
 		{
 			case 1:
 				SwitchPlayerCharacter(NPC_MISSION);
				LEV_StripCharacter(GetFirstPC(), GetObjectByTag("lev40_ptylocker", 0));
 				break;
 			case 2:
 				SwitchPlayerCharacter(NPC_T3_M4);
 				break;
 			case 3:
 				SwitchPlayerCharacter(NPC_JOLEE);
				LEV_StripCharacter(GetFirstPC(), GetObjectByTag("lev40_ptylocker", 0));
 				break;
 			case 4:
 				SwitchPlayerCharacter(NPC_CANDEROUS);
				LEV_StripCharacter(GetFirstPC(), GetObjectByTag("lev40_patgear", 0));
 				break;
 			case 5:
 				SwitchPlayerCharacter(NPC_JUHANI);
 				break;
 			case 6:
 				SwitchPlayerCharacter(NPC_HK_47);
 				break;
 		}
 	
 	AssignCommand(GetFirstPC(), ActionJumpToObject(oWP, FALSE));
 }
 
 void main() {
 	
	int nGlobal = GetGlobalNumber("lev_escape");
	
 	DelayCommand(0.2, SwitchPlayer(nGlobal, GetObjectByTag("lev40_wpescape" + IntToString(nGlobal), 0)));
 	
	DelayCommand(0.75, SetGlobalFadeIn(0.0, 1.0));
	
	DelayCommand(10.0, DestroyObject(OBJECT_SELF, 0.0, TRUE));
 }
