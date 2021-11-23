//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires during the start of the beach scene, walking the player and
	Bastila or Jolee/Juhani down the trail. The destinations have been altered
	slightly, and everyone has been given a speed boost to get things working
	with the vanilla timings now that player walk speeds have been capped via
	creaturespeed.2da.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale02, k_punk_finale05, k_punk_finale06,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	effect eSpeed = EffectMovementSpeedIncrease(250);
	location lPM1 = Location(Vector(122.67,149.79,25.73), 213.75);
	
	ActionPauseConversation();
	
	NoClicksFor(4.0);
	
	// Strip off Force Speed if it's already applied.
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oPM1, ClearAllEffects());
	AssignCommand(oPM2, ClearAllEffects());
	
	// Add a fake Force Speed to get the party up to a brisk walk.
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed, oPC, 30.0);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed, oPM1, 30.0);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeed, oPM2, 30.0);
	
	CP_PartyMove(GetFirstPC(), GetLocation(GetObjectByTag("black1wp", 0)));
	DelayCommand(1.0, CP_PartyMove(oPM1, lPM1));
	DelayCommand(1.0, CP_PartyMove(oPM2, GetLocation(GetObjectByTag("rancorwp", 0))));
	
	DelayCommand(4.0, ActionResumeConversation());
}
