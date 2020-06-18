//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_brejik031.dlg in tar_m03af (Taris Swoop Platform).
	
	Starts the fight after the swoop race. Since DeNCS fails to decompile the
	original script, it performs a few functions and then executes the original
	code. Makes Redros equip a weapon to prevent him attacking with his fists.
	The fans that cheer the player at the start of the scene are not destroyed
	mid-scene, so they now get an OUD signal to run away along with the other
	civilians when combat starts.
	
	See also cp_tar03_brejeqp, cp_tar03_brejfce, k_ptar_brejik_sp, k_ptar_dieswoopy,
	k_ptar_playermec, k_ptar_swoop0, k_ptar_swoopnew, k_ptar_swpie_ud.
	
	Issue #59: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/59
	
	Issue #301: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/301
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	JC 2019-05-07 / DP 2019-11-14 / DP 2020-06-18								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oRedros = GetObjectByTag("Redros", 0);
	int nCount;
	object oFan;
	
	AssignCommand(oRedros, CP_EquipFirstWeapon(oRedros));
	
	nCount = 2;
	
	while (nCount >= 0)
		{
			oFan = GetObjectByTag("tar03_swoopie", nCount);
	
			SignalEvent(oFan, EventUserDefined(100));
	
			(nCount--);
		}
	
	DelayCommand(0.5, ExecuteScript("cp_tar_brejikatk", OBJECT_SELF, -1));
}
