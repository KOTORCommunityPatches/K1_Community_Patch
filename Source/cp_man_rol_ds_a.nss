////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired on Reply 131 of man26_repdip.dlg in manm26ae (Manaan East Central).

	Gives a small Dark Side shift for trying to blackmail Roland over the
	events of Hrakert Station. Replaces the vanilla k_act_darksml script fired
	on this line in order to set a boolean to prevent a repeatable DS gain
	exploit.
	
	Issue #106: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/106
	
	DP 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main()
{
    object oRoland = GetObjectByTag("man26_repdip", 0);
	object oSpeaker = GetPCSpeaker();
	
	SetLocalBoolean(oRoland, 49, TRUE);
	UT_DarkSml(oSpeaker);
}
