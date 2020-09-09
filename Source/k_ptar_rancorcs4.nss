//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_pile_dlg.dlg in tar_m05abc (Taris Upper Sewers).
	
	This is the script that fires at the end of the Rancor scene if the corpse
	pile contains both the odour lure and appropriate grenades. It now destroys
	the original placeable so that it no longer remains interactive after the
	Rancor is dead.
	
	Issue #430: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/430
	
	DP 2020-09-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oStampy = GetObjectByTag("tar05_stampy", 0);
	object oPile = GetObjectByTag("tar05_corpsepile", 0);
	
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, TRUE), oStampy);
	DestroyObject(oPile, 0.0, TRUE);
	
	ActionPauseConversation();
	
	ActionWait(3.0);
	ActionResumeConversation();
	
	GivePlotXP("tar_misc", 20);
}
