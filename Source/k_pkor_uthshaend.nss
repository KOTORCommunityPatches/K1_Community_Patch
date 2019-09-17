////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_utharwynn.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script is fired when Uthar kills Shaardan after he tries hand in a
	fake sword of Ajunta Pall the player gave him. His corpse is now set as
	non-destroyable so it can be removed in a later script.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"
#include "k_inc_utility"

void Patrol() {
	
	object oKor35_sithguard2 = GetObjectByTag("kor35_sithguard2", 0);
	object oKor35_sithguard3 = GetObjectByTag("kor35_sithguard3", 0);
	object oKor35_sithguard4 = GetObjectByTag("kor35_sithguard4", 0);
	object oK35_stdnt_wndrf = GetObjectByTag("k35_stdnt_wndrf", 0);
	object oK35_stdnt_wndrm = GetObjectByTag("k35_stdnt_wndrm", 0);
	
	SetGlobalBoolean("KOR_UTHAR_TALK", FALSE);
	
	AssignCommand(oKor35_sithguard2, GN_WalkWayPoints());
	AssignCommand(oKor35_sithguard3, GN_WalkWayPoints());
	AssignCommand(oKor35_sithguard4, GN_WalkWayPoints());
	AssignCommand(oK35_stdnt_wndrf, GN_WalkWayPoints());
	AssignCommand(oK35_stdnt_wndrm, GN_WalkWayPoints());
}

void main() {
	
	object oShaardan = GetObjectByTag("kor35_shaardan", 0);
	object oArea = GetArea(OBJECT_SELF);
	
	Patrol();
	
	UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, FALSE);
	
	AssignCommand(oShaardan, SetIsDestroyable(FALSE, FALSE, FALSE));
	
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oShaardan);
	
	MusicBattleStop(oArea);
	
	DelayCommand(0.1, MusicBackgroundPlay(oArea));
}
