//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithmas.dlg in manm27aa (Manaan Sith Base).
	
	This script fires on the exit node of the scene with the Sith Master and his
	two Selkath apprentices. It turns them hostile and has them attack. Now the
	party members also get an attack command, and they also have their orientation
	and head tracking unlocked, since it was initially locked in the door OnOpen
	that started the scene. Additionally, the Sith Master is refaced towards the
	PC, since they end the scene facing one of the apprentices.
	
	See also k_pman_sithmas05, k_pman_sithmas06.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-12-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMaster = GetObjectByTag("man27_sithmas", 0);
	object oSelk1 = GetObjectByTag("man27_seljed4", 0);
 	object oSelk2 = GetObjectByTag("man27_seljed8", 0);
 	
	CP_FaceNPC(oMaster, GetFirstPC());
	
	CP_DLGLock(oPM1, FALSE);
	CP_DLGLock(oPM2, FALSE);
	
	DelayCommand(0.2, ExecuteScript("k_pman_hostile", oSelk1, -1));
 	DelayCommand(0.2, ExecuteScript("k_pman_hostile", oSelk2, -1));
 	DelayCommand(0.2, ExecuteScript("k_pman_hostile", oMaster, -1));
	
	DelayCommand(0.6, ExecuteScript("k_ai_master", oPM1, 3001));
	DelayCommand(0.6, ExecuteScript("k_ai_master", oPM2, 3001));
}
