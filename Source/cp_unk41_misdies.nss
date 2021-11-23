//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires on the added starting node that forces everyone to perform
	and animation under the fadeout. This ensures the UnequipHItem/UnequipItems
	flags take effect from the start, since they only apply to active participants.
	It also moves the player and Bastila back into their previous positions after
	having chased after Carth at the end of the previous scene.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_pause1s, k_def_gizka02, k_punk_carrun,
	k_punk_finale01, k_punk_finale02, k_punk_finale05, k_punk_finale06, k_punk_finale07,
	k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17, k_punk_finale18,
	k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en, k_punk_misrem,
	k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	vector vMiss = GetPosition(GetObjectByTag("mission", 0));
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	SetGlobalFadeIn(0.0, 1.0);
	
	DestroyObject(GetObjectByTag("carth", 0), 0.0, TRUE);
	
	CP_PartyMove(oPC, GetLocation(GetObjectByTag("playerend", 0)));
	CP_PartyMove(oBast, GetLocation(GetObjectByTag("carthend", 0)));
	
	DelayCommand(0.5, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(vMiss))));
	DelayCommand(0.7, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.5)));
	
	DelayCommand(0.5, AssignCommand(oBast, ActionDoCommand(SetFacingPoint(vMiss))));
	DelayCommand(0.7, AssignCommand(oBast, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.5)));
	
	AssignCommand(oCand, ActionDoCommand(SetFacingPoint(vMiss)));
	DelayCommand(0.2, AssignCommand(oCand, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.5)));
	
	DelayCommand(3.0, ActionResumeConversation());
}
