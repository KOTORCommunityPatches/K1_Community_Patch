//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_brejik031.dlg in tar_m03af (Taris Swoop Platform).
	
	Starts the fight after the swoop race. Makes Redros equip a weapon to prevent
	him attacking with his fists. The fans that cheer the player at the start of
	the scene are not destroyed mid-scene, so they now get an OUD signal to run
	away along with the other civilians when combat starts. Bastila is also given
	a command to initiate combat so she doesn't stand around. Revised to include
	original source directly now that it has been reconstructed.
	
	See also cp_tar03_brejeqp, cp_tar03_brejfce, k_ptar_brejik_sp, k_ptar_dieswoopy,
	k_ptar_playermec, k_ptar_swoop0, k_ptar_swoopnew, k_ptar_swpie_ud.
	
	Issue #59: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/59
	
	Issue #301: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/301
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	JC 2019-05-07 / DP 2019-11-14 / DP 2020-06-18 / DP 2023-07-23				*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"
#include "k_inc_generic"
#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("bastilla03", 0);
	object oBrejik = GetObjectByTag("Brejik031", 0);
	object oRedros = GetObjectByTag("redros", 0);
	object oGuard = GetObjectByTag("tar03_bastguard", 0);
	object oWPFlee = GetObjectByTag("tar03_wpflee", 0);
	object oVulkar;
	object oFan;
	int nCnt;
	int nCount;
	
	AssignCommand(GetObjectByTag("anglu", 0), TAR_PlotMoveObject(oWPFlee, TRUE));
	AssignCommand(GetObjectByTag("tar03_doba", 0), TAR_PlotMoveObject(oWPFlee, TRUE));
	AssignCommand(GetObjectByTag("tar03_mechanic", 0), TAR_PlotMoveObject(oWPFlee, TRUE));
	AssignCommand(GetObjectByTag("tar03_phirk", 0), TAR_PlotMoveObject(oWPFlee, TRUE));
	AssignCommand(GetObjectByTag("raceannoun031", 0), TAR_PlotMoveObject(oWPFlee, TRUE));
	
	nCount = 2;
	
	while (nCount >= 0)
		{
			oFan = GetObjectByTag("tar03_swoopie", nCount);
	
			SignalEvent(oFan, EventUserDefined(100));
	
			nCount--;
		}
	
	AssignCommand(oRedros, CP_EquipFirstWeapon(oRedros));
	DelayCommand(0.1, ChangeToStandardFaction(oRedros, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.2, AssignCommand(oRedros, GN_DetermineCombatRound()));
	
	ChangeToStandardFaction(oBrejik, STANDARD_FACTION_HOSTILE_1);
	DelayCommand(0.1, AssignCommand(oBrejik, ActionAttack(oPC, FALSE)));
	
	ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE_1);
	DelayCommand(0.1, AssignCommand(oGuard, GN_DetermineCombatRound()));
	
	nCnt = 0;
	
	while (GetIsObjectValid(oVulkar = GetObjectByTag("tar03_vulkguard", nCnt)))
		{
			ChangeToStandardFaction(oVulkar, STANDARD_FACTION_HOSTILE_1);
			AssignCommand(oVulkar, GN_DetermineCombatRound());
			
			nCnt++;
		}
	
	AssignCommand(oBastila, ClearAllActions());
	DelayCommand(0.2, AssignCommand(oBastila, GN_DetermineCombatRound()));
}
