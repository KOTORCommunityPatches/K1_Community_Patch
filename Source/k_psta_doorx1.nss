////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta_malak1.dlg in sta_m45aa (Star Forge Deck 1).
	
	This script is the first of two that blow the side doors of the room the
	party is in and send in attack droids. The original script was set up for
	the party still facing the door behind them, but since this has been changed,
	the head turning animation needed to be swapped. See also k_psta_doorx2 and
	k_psta_actwait3.
	
	DP 2019-06-27                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oDoor = GetObjectByTag("sta_door_x1", 0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oDroid1 = GetObjectByTag("sta45_droid_cut1", 0);
	object oDroid2 = GetObjectByTag("sta45_droid_cut2", 0);
	object oDroid1_WP = GetObjectByTag("STA_DROID1_WP", 0);
	object oDroid2_WP = GetObjectByTag("STA_DROID2_WP", 0);
	object oSmoke1 = GetObjectByTag("sta_smoke1", 0);
	object oSmoke2 = GetObjectByTag("sta_smoke2", 0);
	location lDoor = GetLocation(oDoor);
	
	UT_ActionPauseConversation(5.3);
	
	DelayCommand(1.3, SetDialogPlaceableCamera(27));
	
	// Since the party is now facing the right way, tell the companions to look right, not left
	DelayCommand(2.35, AssignCommand(oPM1, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.0)));
	DelayCommand(2.35, AssignCommand(oPM2, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.0)));
	
	DelayCommand(2.3, ApplyEffectAtLocation(0, EffectVisualEffect(VFX_FNF_GRENADE_PLASMA, 0), lDoor, 0.0));
	DelayCommand(2.5, ApplyEffectToObject(0, EffectVisualEffect(VFX_IMP_SCREEN_SHAKE, 0), GetFirstPC(), 0.0));
	DelayCommand(2.7, ApplyEffectAtLocation(0, EffectVisualEffect(VFX_FNF_GRENADE_PLASMA, 0), lDoor, 0.0));
	
	DelayCommand(2.8, DestroyObject(oDoor, 0.0, 0, 0.0));
	
	DelayCommand(2.9, AssignCommand(oDroid1, ActionMoveToObject(oDroid1_WP, 1, 1.0)));
	DelayCommand(3.2, AssignCommand(oDroid2, ActionMoveToObject(oDroid2_WP, 1, 1.0)));
}
