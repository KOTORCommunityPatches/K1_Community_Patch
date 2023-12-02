//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_debug

	Include script for K1 Community Patch debugging/testing
																				*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

// Simple wrapper for the SendMessageToPC function that assigns PM0 as the target.
void CP_DebugMsg(string sMsg);

// Outputs a list of all effects found on the target to the the feedback window.
void CP_ListEffects(object oTarget);

// Gets the string of a party member's first name based on their ID number.
string CP_PtyToName(int nNPC);

// Returns a string of the selected target's name for use in debug messages.
string CP_NPCName(object oTarget);

// Returns the type of the input effect as a string for debug messages.
string CP_EffectType(effect eEffect);

// Returns the subtype of the input effect as a string for debug messages.
string CP_EffectSubType(effect eEffect);

// Returns the duration type of the input effect as a string for debug messages.
string CP_EffectDuration(effect eEffect);

// Returns the spell type of the input effect as a string for debug messages.
string CP_SpellType(effect eEffect);

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DebugMsg()
	
	Simple wrapper for the SendMessageToPC function that assigns PM0 as the target.
	It seems that using GetFirstPC() as the target does not work when controlling
	another party member.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DebugMsg(string sMsg) {
	SendMessageToPC(GetPartyMemberByIndex(0), sMsg);
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_ListEffects()
	
	Outputs a list of all effects found on the target to the the feedback window.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_ListEffects(object oTarget) {
	effect eEffect  = GetFirstEffect(oTarget);
	
	while (GetIsEffectValid(eEffect))
		{
			CP_DebugMsg(CP_NPCName(oTarget) + ": " + "FOUND " + CP_EffectType(eEffect) + ", SUBTYPE " + CP_EffectSubType(eEffect)
			+ ", SPELL ID " + CP_SpellType(eEffect) + ", DURATION " + CP_EffectDuration(eEffect));
			eEffect = GetNextEffect(oTarget);
		}
}


//////////////////////////////////////////////////////////////////////////////////
/*	CP_PtyToName()
	
	Gets the string of a party member's first name based on their ID number. A
	slightly altered version of JC's CP_NPCToTag() in cp_inc_k1.
	
	- nNPC: NPC ID from nwscript.nss party table (NPC_*)
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_PtyToName(int nNPC) {
	switch (nNPC)
		{
			case NPC_BASTILA: return "BASTILA";
			case NPC_CANDEROUS: return "CANDEROUS";
			case NPC_CARTH: return "CARTH";
			case NPC_HK_47: return "HK-47";
			case NPC_JOLEE: return "JOLEE";
			case NPC_JUHANI: return "JUHANI";
			case NPC_MISSION: return "MISSION";
			case NPC_T3_M4: return "T3-M4";
			case NPC_ZAALBAR: return "ZAALBAR";
		}
	
	return "INVALID";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_NPCName()
	
	Returns a string of the selected target's name for use in debug messages. If
	the object is a party member, it uses their party table ID to determine their
	name, derived from elements of JC's CP_PartyHerder()/CP_GetPartyMember() in
	cp_inc_k1. For non-party members it uses the object's name and tag.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_NPCName(object oTarget) {
	object oPty = OBJECT_INVALID;
	int i = 0;
	
	if (oTarget == GetFirstPC())
		{
			return "PLAYER";
		}
	
	while (!GetIsObjectValid(oPty) && i <= 8)
		{
			oPty = GetObjectByTag(CP_NPCToTag(i), 0);
			if (oPty == oTarget)
				{
					return CP_PtyToName(i);
				}
				else
					{
						oPty = OBJECT_INVALID;
					}
			i++;
		}
	
	return GetStringUpperCase(GetName(oTarget)) + " (" + GetStringUpperCase(GetTag(oTarget)) +")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_EffectType()
	
	Returns the type of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_EffectType(effect eEffect) {
	int nType = GetEffectType(eEffect);
	string sType;
	
	switch (nType)
		{
			case EFFECT_TYPE_INVALIDEFFECT:
				sType = "INVALID EFFECT";
			break;
			case EFFECT_TYPE_DAMAGE_RESISTANCE:
				sType = "DAMAGE RESISTANCE";
			break;
			case EFFECT_TYPE_REGENERATE:
				sType = "REGENERATE";
			break;
			case EFFECT_TYPE_DAMAGE_REDUCTION:
				sType = "DAMAGE REDUCTION";
			break;
			case EFFECT_TYPE_TEMPORARY_HITPOINTS:
				sType = "TEMPORARY HITPOINTS";
			break;
			case EFFECT_TYPE_ENTANGLE:
				sType = "ENTANGLE";
			break;
			case EFFECT_TYPE_INVULNERABLE:
				sType = "INVULNERABLE";
			break;
			case EFFECT_TYPE_DEAF:
				sType = "DEAF";
			break;
			case EFFECT_TYPE_RESURRECTION:
				sType = "RESURRECTION";
			break;
			case EFFECT_TYPE_IMMUNITY:
				sType = "IMMUNITY";
			break;
			case EFFECT_TYPE_ENEMY_ATTACK_BONUS:
				sType = "ENEMY ATTACK BONUS";
			break;
			case EFFECT_TYPE_ARCANE_SPELL_FAILURE:
				sType = "ARCANE SPELL FAILURE";
			break;
			case EFFECT_TYPE_AREA_OF_EFFECT:
				sType = "AREA OF EFFECT";
			break;
			case EFFECT_TYPE_BEAM:
				sType = "BEAM";
			break;
			case EFFECT_TYPE_CHARMED:
				sType = "CHARMED";
			break;
			case EFFECT_TYPE_CONFUSED:
				sType = "CONFUSED";
			break;
			case EFFECT_TYPE_FRIGHTENED:
				sType = "FRIGHTENED";
			break;
			case EFFECT_TYPE_DOMINATED:
				sType = "DOMINATED";
			break;
			case EFFECT_TYPE_PARALYZE:
				sType = "PARALYZE";
			break;
			case EFFECT_TYPE_DAZED:
				sType = "DAZED";
			break;
			case EFFECT_TYPE_STUNNED:
				sType = "STUNNED";
			break;
			case EFFECT_TYPE_SLEEP:
				sType = "SLEEP";
			break;
			case EFFECT_TYPE_POISON:
				sType = "POISON";
			break;
			case EFFECT_TYPE_DISEASE:
				sType = "DISEASE";
			break;
			case EFFECT_TYPE_CURSE:
				sType = "CURSE";
			break;
			case EFFECT_TYPE_SILENCE:
				sType = "SILENCE";
			break;
			case EFFECT_TYPE_TURNED:
				sType = "TURNED";
			break;
			case EFFECT_TYPE_HASTE:
				sType = "HASTE";
			break;
			case EFFECT_TYPE_SLOW:
				sType = "SLOW";
			break;
			case EFFECT_TYPE_ABILITY_INCREASE:
				sType = "ABILITY INCREASE";
			break;
			case EFFECT_TYPE_ABILITY_DECREASE:
				sType = "ABILITY DECREASE";
			break;
			case EFFECT_TYPE_ATTACK_INCREASE:
				sType = "ATTACK INCREASE";
			break;
			case EFFECT_TYPE_ATTACK_DECREASE:
				sType = "ATTACK DECREASE";
			break;
			case EFFECT_TYPE_DAMAGE_INCREASE:
				sType = "DAMAGE INCREASE";
			break;
			case EFFECT_TYPE_DAMAGE_DECREASE:
				sType = "DAMAGE DECREASE";
			break;
			case EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE:
				sType = "DAMAGE IMMUNITY INCREASE";
			break;
			case EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE:
				sType = "DAMAGE IMMUNITY DECREASE";
			break;
			case EFFECT_TYPE_AC_INCREASE:
				sType = "AC INCREASE";
			break;
			case EFFECT_TYPE_AC_DECREASE:
				sType = "AC DECREASE";
			break;
			case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE:
				sType = "MOVEMENT SPEED INCREASE";
			break;
			case EFFECT_TYPE_MOVEMENT_SPEED_DECREASE:
				sType = "MOVEMENT SPEED DECREASE";
			break;
			case EFFECT_TYPE_SAVING_THROW_INCREASE:
				sType = "SAVING THROW INCREASE";
			break;
			case EFFECT_TYPE_SAVING_THROW_DECREASE:
				sType = "SAVING THROW DECREASE";
			break;
			case EFFECT_TYPE_FORCE_RESISTANCE_INCREASE:
				sType = "FORCE RESISTANCE INCREASE";
			break;
			case EFFECT_TYPE_FORCE_RESISTANCE_DECREASE:
				sType = "FORCE RESISTANCE DECREASE";
			break;
			case EFFECT_TYPE_SKILL_INCREASE:
				sType = "SKILL INCREASE";
			break;
			case EFFECT_TYPE_SKILL_DECREASE:
				sType = "SKILL DECREASE";
			break;
			case EFFECT_TYPE_INVISIBILITY:
				sType = "INVISIBILITY";
			break;
			case EFFECT_TYPE_IMPROVEDINVISIBILITY:
				sType = "IMPROVED INVISIBILITY";
			break;
			case EFFECT_TYPE_DARKNESS:
				sType = "DARKNESS";
			break;
			case EFFECT_TYPE_DISPELMAGICALL:
				sType = "DISPEL MAGICALL";
			break;
			case EFFECT_TYPE_ELEMENTALSHIELD:
				sType = "ELEMENTAL SHIELD";
			break;
			case EFFECT_TYPE_NEGATIVELEVEL:
				sType = "NEGATIVE LEVEL";
			break;
			case EFFECT_TYPE_DISGUISE:
				sType = "DISGUISE";
			break;
			case EFFECT_TYPE_SANCTUARY:
				sType = "SANCTUARY";
			break;
			case EFFECT_TYPE_TRUESEEING:
				sType = "TRUE SEEING";
			break;
			case EFFECT_TYPE_SEEINVISIBLE:
				sType = "SEE INVISIBLE";
			break;
			case EFFECT_TYPE_TIMESTOP:
				sType = "TIMESTOP";
			break;
			case EFFECT_TYPE_BLINDNESS:
				sType = "BLINDNESS";
			break;
			case EFFECT_TYPE_SPELLLEVELABSORPTION:
				sType = "SPELL LEVEL ABSORPTION";
			break;
			case EFFECT_TYPE_DISPELMAGICBEST:
				sType = "DISPEL MAGIC BEST";
			break;
			case EFFECT_TYPE_ULTRAVISION:
				sType = "ULTRAVISION";
			break;
			case EFFECT_TYPE_MISS_CHANCE:
				sType = "MISS CHANCE";
			break;
			case EFFECT_TYPE_CONCEALMENT:
				sType = "CONCEALMENT";
			break;
			case EFFECT_TYPE_SPELL_IMMUNITY:
				sType = "SPELL IMMUNITY";
			break;
			case EFFECT_TYPE_ASSUREDHIT:
				sType = "ASSURED HIT";
			break;
			case EFFECT_TYPE_VISUAL:
				sType = "VISUAL";
			break;
			case EFFECT_TYPE_LIGHTSABERTHROW:
				sType = "LIGHTSABER THROW";
			break;
			case EFFECT_TYPE_FORCEJUMP:
				sType = "FORCE JUMP";
			break;
			case EFFECT_TYPE_ASSUREDDEFLECTION:
				sType = "ASSURED DEFLECTION";
			break;
		}
	
	return sType;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_EffectSubType()
	
	Returns the subtype of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_EffectSubType(effect eEffect) {
	int nSubType = GetEffectSubType(eEffect);
	string sSub;
	
	switch (nSubType)
		{
			case SUBTYPE_MAGICAL:
				sSub = "MAGICAL";
			break;
			case SUBTYPE_SUPERNATURAL:
				sSub = "SUPERNATURAL";
			break;
			case SUBTYPE_EXTRAORDINARY:
				sSub = "EXTRAORDINARY";
			break;
		}
	
	return sSub;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_EffectDuration()
	
	Returns the duration type of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_EffectDuration(effect eEffect) {
	int nDur = GetEffectDurationType(eEffect);
	string sDur;
	
	switch (nDur)
		{
			case DURATION_TYPE_INSTANT:
				sDur = "INSTANT";
			break;
			case DURATION_TYPE_TEMPORARY:
				sDur = "TEMPORARY";
			break;
			case DURATION_TYPE_PERMANENT:
				sDur = "PERMANENT";
			break;
		}
	
	return sDur;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpellType()
	
	Returns the spell type of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_SpellType(effect eEffect) {
	int nType = GetEffectSpellId(eEffect);
	string sType;
	
	switch (nType)
		{
			case FORCE_POWER_ALL_FORCE_POWERS:
				sType = "INVALID / IMMUNITY";
			break;
			case FORCE_POWER_MASTER_ALTER:
				sType = "MASTER ALTER";
			break;
			case FORCE_POWER_MASTER_CONTROL:
				sType = "MASTER CONTROL";
			break;
			case FORCE_POWER_MASTER_SENSE:
				sType = "MASTER SENSE";
			break;
			case FORCE_POWER_FORCE_JUMP_ADVANCED:
				sType = "FORCE JUMP ADVANCED";
			break;
			case FORCE_POWER_LIGHT_SABER_THROW_ADVANCED:
				sType = "LIGHTSABER THROW ADVANCED";
			break;
			case FORCE_POWER_REGNERATION_ADVANCED:
				sType = "REGNERATION ADVANCED";
			break;
			case FORCE_POWER_AFFECT_MIND:
				sType = "AFFECT MIND";
			break;
			case FORCE_POWER_AFFLICTION:
				sType = "AFFLICTION";
			break;
			case FORCE_POWER_SPEED_BURST:
				sType = "BURST OF SPEED";
			break;
			case FORCE_POWER_CHOKE:
				sType = "CHOKE";
			break;
			case FORCE_POWER_CURE:
				sType = "CURE";
			break;
			case FORCE_POWER_DEATH_FIELD:
				sType = "DEATH FIELD";
			break;
			case FORCE_POWER_DROID_DISABLE:
				sType = "DISABLE DROID";
			break;
			case FORCE_POWER_DROID_DESTROY:
				sType = "DESTROY DROID";
			break;
			case FORCE_POWER_DOMINATE:
				sType = "DOMINATE";
			break;
			case FORCE_POWER_DRAIN_LIFE:
				sType = "DRAIN LIFE";
			break;
			case FORCE_POWER_FEAR:
				sType = "FEAR";
			break;
			case FORCE_POWER_FORCE_ARMOR:
				sType = "FORCE ARMOR";
			break;
			case FORCE_POWER_FORCE_AURA:
				sType = "FORCE AURA";
			break;
			case FORCE_POWER_FORCE_BREACH:
				sType = "FORCE BREACH";
			break;
			case FORCE_POWER_FORCE_IMMUNITY:
				sType = "FORCE IMMUNITY";
			break;
			case FORCE_POWER_FORCE_JUMP:
				sType = "FORCE JUMP";
			break;
			case FORCE_POWER_FORCE_MIND:
				sType = "FORCE MIND";
			break;
			case FORCE_POWER_FORCE_PUSH:
				sType = "FORCE PUSH";
			break;
			case FORCE_POWER_FORCE_SHIELD:
				sType = "FORCE SHIELD";
			break;
			case FORCE_POWER_FORCE_STORM:
				sType = "FORCE STORM";
			break;
			case FORCE_POWER_FORCE_WAVE:
				sType = "FORCE WAVE";
			break;
			case FORCE_POWER_FORCE_WHIRLWIND:
				sType = "FORCE WHIRLWIND";
			break;
			case FORCE_POWER_HEAL:
				sType = "HEAL";
			break;
			case FORCE_POWER_HOLD:
				sType = "HOLD";
			break;
			case FORCE_POWER_HORROR:
				sType = "HORROR";
			break;
			case FORCE_POWER_INSANITY:
				sType = "INSANITY";
			break;
			case FORCE_POWER_KILL:
				sType = "KILL";
			break;
			case FORCE_POWER_KNIGHT_MIND:
				sType = "KNIGHT MIND";
			break;
			case FORCE_POWER_KNIGHT_SPEED:
				sType = "KNIGHT SPEED";
			break;
			case FORCE_POWER_LIGHTNING:
				sType = "LIGHTNING";
			break;
			case FORCE_POWER_MIND_MASTERY:
				sType = "MIND MASTERY";
			break;
			case FORCE_POWER_SPEED_MASTERY:
				sType = "SPEED MASTERY";
			break;
			case FORCE_POWER_PLAGUE:
				sType = "PLAGUE";
			break;
			case FORCE_POWER_REGENERATION:
				sType = "REGENERATION";
			break;
			case FORCE_POWER_RESIST_COLD_HEAT_ENERGY:
				sType = "RESIST COLD / HEAT / ENERGY";
			break;
			case FORCE_POWER_RESIST_FORCE:
				sType = "RESIST FORCE";
			break;
			case FORCE_POWER_RESIST_POISON_DISEASE_SONIC:
				sType = "RESIST POISON / DISEASE / SONIC";
			break;
			case FORCE_POWER_SHOCK:
				sType = "SHOCK";
			break;
			case FORCE_POWER_SLEEP:
				sType = "SLEEP";
			break;
			case FORCE_POWER_SLOW:
				sType = "SLOW";
			break;
			case FORCE_POWER_STUN:
				sType = "STUN";
			break;
			case FORCE_POWER_DROID_STUN:
				sType = "STUN DROID";
			break;
			case FORCE_POWER_SUPRESS_FORCE:
				sType = "SUPRESS FORCE";
			break;
			case FORCE_POWER_LIGHT_SABER_THROW:
				sType = "LIGHTSABER THROW";
			break;
			case FORCE_POWER_WOUND:
				sType = "WOUND";
			break;
			case SPECIAL_ABILITY_BATTLE_MEDITATION:
				sType = "SPECIAL ABILITY BATTLE MEDITATION";
			break;
			case SPECIAL_ABILITY_BODY_FUEL:
				sType = "SPECIAL ABILITY BODY FUEL";
			break;
			case SPECIAL_ABILITY_COMBAT_REGENERATION:
				sType = "SPECIAL ABILITY COMBAT REGENERATION";
			break;
			case SPECIAL_ABILITY_WARRIOR_STANCE:
				sType = "SPECIAL ABILITY WARRIOR STANCE";
			break;
			case SPECIAL_ABILITY_SENTINEL_STANCE:
				sType = "SPECIAL ABILITY SENTINEL STANCE";
			break;
			case SPECIAL_ABILITY_DOMINATE_MIND:
				sType = "SPECIAL ABILITY DOMINATE MIND";
			break;
			case SPECIAL_ABILITY_PSYCHIC_STANCE:
				sType = "SPECIAL ABILITY PSYCHIC STANCE";
			break;
			case SPECIAL_ABILITY_CATHAR_REFLEXES:
				sType = "SPECIAL ABILITY CATHAR REFLEXES";
			break;
			case SPECIAL_ABILITY_ENHANCED_SENSES:
				sType = "SPECIAL ABILITY ENHANCED SENSES";
			break;
			case SPECIAL_ABILITY_CAMOFLAGE:
				sType = "SPECIAL ABILITY CAMOFLAGE";
			break;
			case SPECIAL_ABILITY_TAUNT:
				sType = "SPECIAL ABILITY TAUNT";
			break;
			case SPECIAL_ABILITY_WHIRLING_DERVISH:
				sType = "SPECIAL ABILITY WHIRLING DERVISH";
			break;
			case SPECIAL_ABILITY_RAGE:
				sType = "SPECIAL ABILITY RAGE";
			break;
		}
	
	return sType;
}
