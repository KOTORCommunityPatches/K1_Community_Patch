//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_darthmala2.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	An extension of other forced powered lightsaber changes originally made by
	danil-ch to the Malak showdown scene on the Leviathan. The PC and Malak have
	their saber overrides turned off for the manual combat sequence, and in
	preparation for Malak's to be reignited in the following cutscene.
	
	See also k_plev_pause, k_plev_postvis.
	
	DP 2021/11/26																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("Bastila", 0);
	object oCarth = GetObjectByTag("Carth", 0);
	object oMalak = GetObjectByTag("DarthMalak400", 0);
	
	ActionPauseConversation();
	
	RemovePartyMember(NPC_CARTH);
	RemovePartyMember(NPC_BASTILA);
	
	ChangeToStandardFaction(oCarth, STANDARD_FACTION_NEUTRAL);
	ChangeToStandardFaction(oBastila, STANDARD_FACTION_NEUTRAL);
	
	PlaySound("v_imp_stun");
	
	AssignCommand(oMalak, ActionCastFakeSpellAtObject(FORCE_POWER_DEATH_FIELD, oPC));
	DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutSceneParalyze(), oBastila));
	DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_HOLD), oBastila));
	DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutSceneParalyze(), oCarth));
	DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_HOLD), oCarth));
	
	DelayCommand(1.0, SetDialogPlaceableCamera(15));
	DelayCommand(2.5, SetDialogPlaceableCamera(16));
	
	// Remove the powered saber override for the PC and Malak now that combat is about to commence.
	DelayCommand(3.9, SetLightsaberPowered(oPC, FALSE, TRUE, FALSE));
	DelayCommand(3.9, SetLightsaberPowered(oMalak, FALSE, TRUE, FALSE));
	
	DelayCommand(4.0, ActionResumeConversation());
}
