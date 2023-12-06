//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_calo082.dlg in tar_m08aa (Taris Davik's Estate).
	
	This script fires at the end of Calo Nord's last stand after the showdown with
	him and Davik in the hangar. It triggers an explosion VFX. The original also
	applied a horrified effect to Calo, but that has now been removed since he
	has been given a stunt animation instead.
	
	See also k_ptar_calo_ud, k_ptar_runaway.
	
	Issue #368: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/368
	
	DP 2023-12-06																*/
//////////////////////////////////////////////////////////////////////////////////


void FireExplosion(object oObject) {
	object oArea = GetArea(OBJECT_SELF);
	SignalEvent(oObject, EventUserDefined(2000));
}

void main() {
	
	object oCalo = OBJECT_SELF;
	object oExplode = GetNearestObjectByTag("tar08_wpexplosion", oCalo, 1);
	
	DelayCommand(0.5, FireExplosion(oExplode));
	
	ActionPauseConversation();
	ActionWait(1.5);
	ActionResumeConversation();
}
