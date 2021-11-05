//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for unk44_evilbast.utc in unk_m44ac (Lehon Temple Summit).
	
	This is the UserDefine script for DS Bastila on the temple roof. It handles
	the end of the first fight with an OnDamage event that triggers when she
	hits around 60% health. The original script only resurrected the player, not
	Jolee or Juhani, so those have been added. The fake Force Wave animation
	that she played also proved a little flaky, so that has been switched to a
	Force Push animation instead. The script removes Jolee and Juhani from the
	party, presumably to ensure they retain a set party index in later scripts.
	This could be streamlined simply by switching later calls to grabbing them
	by their tags, but that would require editing additional scripts so it has
	been left as-is.
	
	See also cp_unk44_jjfcbas, cp_unk44_pcfcbas, exitheart, k_punk_bastatt03,
	k_punk_bastatt05, k_punk_bastesc, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

void FakeForcePush(object oNPC1, object oNPC2, object oNPC3) {
	PlaySound("v_useforce");
	ActionCastFakeSpellAtObject(FORCE_POWER_FORCE_PUSH, oNPC1);
	DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_WAVE), oNPC1, 0.0));
	DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_WAVE), oNPC2, 0.0));
	DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FORCE_WAVE), oNPC3, 0.0));
	DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectForcePushTargeted(GetLocation(OBJECT_SELF), 0), oNPC1, 0.1));
	DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectForcePushTargeted(GetLocation(OBJECT_SELF), 0), oNPC2, 0.1));
	DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectForcePushTargeted(GetLocation(OBJECT_SELF), 0), oNPC3, 0.1));
	DelayCommand(1.0, ActionStartConversation(oNPC1, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
}

void ClearParty(object oNPC1, object oNPC2, object oNPC3) {
	SetPartyLeader(NPC_PLAYER);
	ClearAllEffects();
	AssignCommand(oNPC1, ClearAllEffects());
	AssignCommand(oNPC2, ClearAllEffects());
	AssignCommand(oNPC3, ClearAllEffects());
	RemovePartyMember(NPC_JOLEE);
	RemovePartyMember(NPC_JUHANI);
}

void main() {
	
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{
			if (GetMaxHitPoints(OBJECT_SELF) - GetCurrentHitPoints(OBJECT_SELF) > 150)
				{
					object oPC = GetFirstPC();
					object oJolee = GetObjectByTag("Jolee", 0);
					object oJuhani = GetObjectByTag("Juhani", 0);
					
					NoClicksFor(5.0);
					
					AssignCommand(oPC, ClearAllActions());
					AssignCommand(oJolee, ClearAllActions());
					AssignCommand(oJuhani, ClearAllActions());
					CancelCombat(oPC);
					CancelCombat(oJolee);
					CancelCombat(oJuhani);
					
					ClearAllActions();
					CancelCombat(OBJECT_SELF);
					ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
					
					// Make sure nobody is eating dirt.
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPC);
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oJolee);
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oJuhani);
					
					DelayCommand(0.3, ClearParty(oPC, oJolee, oJuhani));
					DelayCommand(0.6, FakeForcePush(oPC, oJolee, oJuhani));
				}
		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
