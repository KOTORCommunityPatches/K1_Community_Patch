//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefine for g_bandon001.utc in end_m01aa (Endar Spire Command Module).
	
	This is the OUD for Darth Bandon in the Bandon confrontation/Trask's sacrifice
	cutscene. Slightly modified from the original, altering case 10 to merge his
	walk to waypoint commands into a single command. Previously he walked about
	a meter forwards, then signalled the OUD of the invisible placeable to resume
	the conversation, then walked forwards again. This looked pretty odd, so now
	the delay is handled in the script that signals Bandon's event, allowing him
	to be given a single move command to the final destination.
	
	See also k_pend_cut02, k_pend_cut14, k_pend_cut32, k_pend_traskdie1.
	
	Issue #230: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/230
	
	DP 2019-10-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oTrask = GetObjectByTag("end_trask");
	object oHelper = GetObjectByTag("end01_sceneobj03");
	object oSaber = GetItemPossessedBy(OBJECT_SELF, "g_w_drkjdisbr002");
	object oWP = GetObjectByTag("wp_room8_02", 0);
	int nUser = GetUserDefinedEventNumber();
	
	switch (nUser)
		{
			case 5:
				ActionEquipItem(oSaber, INVENTORY_SLOT_RIGHTWEAPON, FALSE);
				DelayCommand(0.5, SetLightsaberPowered(OBJECT_SELF, TRUE, TRUE, FALSE));
				ActionDoCommand(SignalEvent(oHelper, EventUserDefined(0)));
				break;
			case 10:
				ActionMoveToObject(oWP);
				ActionPlayAnimation(ANIMATION_LOOPING_READY, 1.0, 10.0);
				break;
			case 25:
				// This appears to be unused. Potential mod fodder for someone.
				ClearAllActions();
				ActionCastFakeSpellAtObject(FORCE_POWER_CHOKE, oTrask);
				DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectChoke(), oTrask));
				break;
		}
}
