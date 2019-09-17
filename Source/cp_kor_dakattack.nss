////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fires if the player chooses to kill Dak Vesser in the cantina on Korriban.
	Fixes an issue with him respawning after being killed.
	
	Issue #7: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/7
	
	JC 2019-01-26                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_debug"
#include "k_inc_generic"

void main() {

	SetGlobalBoolean("KOR_DAK_LEAVE", FALSE);
	DelayCommand(0.2,ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.3,GN_DetermineCombatRound());
}
