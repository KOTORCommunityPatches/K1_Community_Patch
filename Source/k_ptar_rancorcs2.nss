//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_pile_dlg.dlg in tar_m05abc (Taris Upper Sewers).
	
	This script fires during the cutscene that plays when tricking the Rancor in
	the Taris sewers into eating a grenade. In the vanilla version of the scene,
	the sound effects for the grenade and Rancor roar play before the explosion
	VFX is shown. This has been changed to delay the SFX to better sync them with
	the VFX.
	
	Issue #362: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/362
	
	DP 2020-06-01																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oStampy = GetObjectByTag("tar05_stampy", 0);
	
	ActionPauseConversation();
	
	DelayCommand(0.55, PlaySound("cb_gr_fragment"));
	DelayCommand(0.8, PlaySound("c_rancor_bat2"));
	
	DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectChoke(), oStampy, 2.4));
	
	// 1045 = VFX_PLOT_TAR_RANCOR_DEATH in visualeffects.2da
	DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(1045), oStampy));

	DelayCommand(3.0, ActionResumeConversation());
}
