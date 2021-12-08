//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_xstory_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This script fires on (or just before) the exit nodes of the Storyteller's DLG.
	It unlocks HK's facing, which is locked at the commencement of the conversation.
	
	See also cp_tat20_styjmp.
	
	Issue #221: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/221
	
	DP 2021/12/08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oHK = GetObjectByTag("hk47");
	
	SetLockOrientationInDialog(oHK, FALSE);
}
