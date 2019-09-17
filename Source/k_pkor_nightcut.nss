////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_utharwynn.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script is fired when Uthar sends the player to rest for the night
	before undertaking the trial in the Tomb of Naga Sadow. A check has
	been added to clean up Shaardan's corpse if he was killed by Uthar
	after the player gave him a fake sword of Ajunta Pall.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"
#include "k_inc_utility"

void Patrol() {
	
	object oGuard2 = GetObjectByTag("kor35_sithguard2", 0);
	object oGuard3 = GetObjectByTag("kor35_sithguard3", 0);
	object oGuard4 = GetObjectByTag("kor35_sithguard4", 0);
	object oStudentF = GetObjectByTag("k35_stdnt_wndrf", 0);
	object oStudentM = GetObjectByTag("k35_stdnt_wndrm", 0);
	
	SetGlobalBoolean("KOR_UTHAR_TALK", FALSE);
	
	AssignCommand(oGuard2, GN_WalkWayPoints());
	AssignCommand(oGuard3, GN_WalkWayPoints());
	AssignCommand(oGuard4, GN_WalkWayPoints());
	AssignCommand(oStudentF, GN_WalkWayPoints());
	AssignCommand(oStudentM, GN_WalkWayPoints());
}

void main() {
	
	object oPC = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oWP_PC = GetObjectByTag("k35_way_pcroom", 0);
	location lWP_PM1 = Location(Vector(41.8,113.402,0.15), 0.0);
	location lWP_PM2 = Location(Vector(41.8,109.843,0.15), 0.0);
	
	SetGlobalFadeOut(0.0, 2.0);
	
	Patrol();
	
	SetGlobalBoolean("KOR_PRESTIGE_END", TRUE);
	
	UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, FALSE);

	if ((GetGlobalNumber("KOR_SHAARDAN_SWORD") == 3) && (GetGlobalNumber("KOR33_SHAARDAN") == 6))
		{
			object oShaardan = GetObjectByTag("kor35_shaardan", 0);
			
			AssignCommand(oShaardan, SetIsDestroyable(TRUE, FALSE, FALSE));
			
			DestroyObject(oShaardan, 0.0, TRUE, 0.0);
		}

	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ClearAllActions());
			DelayCommand(0.5, UT_TeleportPartyMember(oPM1, lWP_PM1));
		}
	
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ClearAllActions());
			DelayCommand(0.5, UT_TeleportPartyMember(oPM2, lWP_PM2));
		}
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, JumpToObject(oWP_PC));

	SetLocalBoolean(oPM1, SW_FLAG_AI_OFF, FALSE);
	SetLocalBoolean(oPM2, SW_FLAG_AI_OFF, FALSE);
	
	SetGlobalFadeIn(2.0, 1.5);
}
