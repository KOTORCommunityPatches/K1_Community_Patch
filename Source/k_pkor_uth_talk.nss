////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_utharwynn.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script is fired on most of Uthar's initial DLG nodes. The vanilla
	script just set the KOR_UTHAR_TALK boolean which stops any wandering NPCs
	from moving for the duration of the conversation. While his prevents them
	from blundering into the middle of the conversation, they can still end up
	in the way if they happened to be stopped while close to Uthar. Now they
	are jumped back to the edges of the room any time Uthar talks to keep them
	well and truly out of the way.
	
	See also k_pkor_sithjoin.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oGuard2 = GetObjectByTag("kor35_sithguard2", 0);
	object oGuard3 = GetObjectByTag("kor35_sithguard3", 0);
	object oGuard4 = GetObjectByTag("kor35_sithguard4", 0);
	object oStudentF = GetObjectByTag("k35_stdnt_wndrf", 0);
	object oStudentM = GetObjectByTag("k35_stdnt_wndrm", 0);
	object oUthar = GetObjectByTag("kor35_utharwynn", 0);
	location lGuard2 = Location(Vector(121.5,91.0,3.15), -90.0);
	location lGuard3 = Location(Vector(140.517,71.954,3.15), 180.0);
	location lGuard4 = Location(Vector(104.116,72.498,3.15), 0.0);
	location lStudentF = Location(Vector(153.146,72.632,5.061), 180.0);
	location lStudentM = Location(Vector(138.65,73.743,3.15), 225.0);
	vector vUthar = GetPosition(oUthar);
	
	SetGlobalBoolean("KOR_UTHAR_TALK", TRUE);
	
	CP_PartyJump(oGuard2, lGuard2);
	CP_PartyJump(oGuard3, lGuard3);
	CP_PartyJump(oGuard4, lGuard4);
	CP_PartyJump(oStudentF, lStudentF);
	CP_PartyJump(oStudentM, lStudentM);
	
	DelayCommand(0.5, AssignCommand(oGuard2, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oGuard3, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oGuard4, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oStudentF, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oStudentM, SetFacingPoint(vUthar)));
}
