////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor37_firescene.dlg in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This script activates the first droid during the scene where the Therangen
	Obelisk blocking the bridge in the Tomb of Ajunta Pall is blown up. For
	some reason, the vanilla script duplicated the command from the previous
	script to start the combat music, causing it to skip/restart, so that has
	been removed. Additionally, the third droid somehow ends up out of position,
	so it is misframed during its closeup shot. To correct that, it is jumped
	back into place while it is offscreen during the node this script fires on.
	
	See also k_pkor_therangen, k_pkor_ther_blow, and k_pkor_droidhost.
	
	Issue #164: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/164
	
	DP 2019-07-12                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDroid1 = GetObjectByTag("kor37_bridge1", 0);
	object oDroid3 = GetObjectByTag("kor37_bridge3", 0);
	object oSFX = GetObjectByTag("k37_snd_activate", 0);
	effect eVFX = EffectVisualEffect(VFX_DUR_SHIELD_BLUE_MARK_I);
	location lDrdJmp = Location(Vector(86.313,13.613,3.75), 0.0);
	
	ActionPauseConversation();
	
	AssignCommand(oDroid3, ClearAllActions());
	AssignCommand(oDroid3, ActionJumpToLocation(lDrdJmp));
	DelayCommand(0.5, AssignCommand(oDroid3, SetFacing(DIRECTION_NORTH)));
	
	DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oDroid1));
	
	AssignCommand(oDroid1, ClearAllActions());
	AssignCommand(oDroid1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 6.0));
	
	ChangeToStandardFaction(oDroid1, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(1.0, SoundObjectPlay(oSFX));
	
	DelayCommand(2.0, ActionResumeConversation());
}
