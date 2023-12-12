//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_debug

	Include script for K1 Community Patch debugging/testing
																				*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

// Simple wrapper for the SendMessageToPC function that assigns PM0 as the target.
void CP_DebugMsg(string sMsg);

// Outputs a list of all effects found on the target.
void CP_ListEffects(object oTarget);

// Converts a TRUE/FALSE value into a string.
string CP_BoolToString(int bBool);

// Outputs a summary of the personal quest progression of all recruited companions.
void CP_PtyQuestState();

// Gets the string of a party member's first name based on their ID number.
string CP_PtyToName(int nNPC);

// Returns a string of the selected target's name.
string CP_NPCName(object oTarget);

// Returns the type of the input effect as a string.
string CP_EffectType(effect eEffect);

// Returns the subtype of the input effect as a string.
string CP_EffectSubType(effect eEffect);

// Returns the duration type of the input effect as a string.
string CP_EffectDuration(effect eEffect);

// Returns the spell type of the input effect as a string.
string CP_SpellType(effect eEffect);

// Returns the type of the input item as a string.
string CP_ItemType(object oItem);

// Returns the name of the faction the input creature belongs to as a string.
string CP_GetFaction(object oTarget);

// Returns a string that summarises the current state of the main plot progression.
string CP_MainPlotState();

// Returns a string that reports the state of the supplied global boolean/number.
string CP_GetGlobalState(string sGlobal, int bIsBoolean = TRUE);

// Returns a string that reports the current stage of Star Map progression.
string CP_GetStarMapState();

// Returns the current state of the supplied NPC's AI flag.
string CP_NPCAIState(object oNPC);


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
/*	CP_BoolToString()
	
	Converts a TRUE/FALSE value into a string for debug messages.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_BoolToString(int bBool) {
	switch (bBool)
		{
			case FALSE: return "FALSE";
			case TRUE: return "TRUE";
		}
	
	return "INVALID";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_PtyQuestState()
	
	Outputs a summary of the personal quest progression of all currently recruited
	companions to the feedback window.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_PtyQuestState() {
	int nPCLvl = GetHitDice(GetFirstPC());
	int nBastLev = GetGlobalNumber("K_SWG_BASTILA_LEVEL");
	int nCarthLev = GetGlobalNumber("K_SWG_CARTH_LEVEL");
	int nCandLev = GetGlobalNumber("T_LEVC");
	int nJoleeLev = GetGlobalNumber("K_SWG_JOLEE_LEVEL");
	int nJuhLev1 = GetGlobalNumber("T_LEVP");
	int nJuhLev2 = GetGlobalNumber("T_LEVH");
	
	CP_DebugMsg("GAME STATE: " + CP_MainPlotState());
	CP_DebugMsg("PLAYER LEVEL: " + IntToString(nPCLvl));
	CP_DebugMsg("MESSENGER STATE: " + CP_GetGlobalState("K_MESSENGER_AVAILABLE", TRUE));
	CP_DebugMsg("STAR MAP STATE: " + CP_GetStarMapState());
	
	if (IsAvailableCreature(NPC_BASTILA))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("LAST BASTILA TALK WAS AT LEVEL " + IntToString(nBastLev));
			CP_DebugMsg("BASTILA: " + CP_GetGlobalState("K_SWG_BASTILA", FALSE));
			CP_DebugMsg("BASTILA: " + CP_GetGlobalState("K_MESS_BASTILA", TRUE));
			CP_DebugMsg("BASTILA: " + CP_GetGlobalState("K_SWG_HELENA", FALSE));
			CP_DebugMsg("BASTILA: " + CP_GetGlobalState("K_SWG_HELENA_TALK", TRUE));
			CP_DebugMsg("BASTILA: " + CP_GetGlobalState("K_SWG_BASTILA_HOLO", TRUE));
			CP_DebugMsg("BASTILA: " + CP_GetGlobalState("Ebn_Bast_ForceTalk", FALSE));
		}
	
	if (IsAvailableCreature(NPC_CANDEROUS))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("LAST CANDEROUS TALK WAS AT LEVEL " + IntToString(nCandLev));
			CP_DebugMsg("CANDEROUS: " + CP_GetGlobalState("G_CAND_STATE", FALSE));
			CP_DebugMsg("CANDEROUS: " + CP_GetGlobalState("K_MESS_CANDEROUS", TRUE));
			CP_DebugMsg("CANDEROUS: " + CP_GetGlobalState("G_CAND_PLOT", FALSE));
			CP_DebugMsg("CANDEROUS: " + CP_GetGlobalState("G_CAND_THING", TRUE));
		}
	
	if (IsAvailableCreature(NPC_CARTH))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("LAST CARTH TALK WAS AT LEVEL " + IntToString(nCarthLev));
			CP_DebugMsg("CARTH: " + CP_GetGlobalState("K_SWG_CARTH", FALSE));
			CP_DebugMsg("CARTH: " + CP_GetGlobalState("K_MESS_CARTH", TRUE));
			CP_DebugMsg("CARTH: " + CP_GetGlobalState("KOR_DANEL", FALSE));
			CP_DebugMsg("CARTH: " + CP_GetGlobalState("K_SWG_DUSTIL1", TRUE));
			CP_DebugMsg("CARTH: " + CP_GetGlobalState("K_SWG_DUSTIL2", TRUE));
			CP_DebugMsg("CARTH: " + CP_GetGlobalState("G_Carth_RevTalk", TRUE));
		}
	
	if (IsAvailableCreature(NPC_HK_47))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("HK-47: " + CP_GetGlobalState("K_SWG_HK47_FIX", FALSE));
			CP_DebugMsg("HK-47: " + CP_GetGlobalState("K_SWG_HK47_DC", FALSE));
			CP_DebugMsg("HK-47: " + CP_GetGlobalState("K_SWG_HK47_KNOW", TRUE));
			CP_DebugMsg("HK-47: " + CP_GetGlobalState("G_HK47_RevanTalk", TRUE));
		}
	
	if (IsAvailableCreature(NPC_JOLEE))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("LAST JOLEE TALK WAS AT LEVEL " + IntToString(nJoleeLev));
			CP_DebugMsg("JOLEE: " + CP_GetGlobalState("K_SWG_JOLEE", FALSE));
			CP_DebugMsg("JOLEE: " + CP_GetGlobalState("K_MESS_JOLEE", TRUE));
			CP_DebugMsg("JOLEE: " + CP_GetGlobalState("MAN_MURDER_PLOT", FALSE));
		}
	
	if (IsAvailableCreature(NPC_JUHANI))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("LAST JUHANI P TALK WAS AT LEVEL " + IntToString(nJuhLev1));
			CP_DebugMsg("LAST JUHANI H TALK WAS AT LEVEL " + IntToString(nJuhLev2));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("G_JUHANIP_STATE", FALSE));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("G_JUHANIH_STATE", FALSE));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("G_JUHANI_PLOT", FALSE));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("K_MESS_JUHANI", TRUE));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("K_XOR_AMBUSH", FALSE));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("KOR_WHO_DAK", FALSE));
		}
	
	if (IsAvailableCreature(NPC_MISSION))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("MISSION: " + CP_GetGlobalState("K_MESS_MISSION", TRUE));
			CP_DebugMsg("MISSION: " + CP_GetGlobalState("Mis_MissionTalk", FALSE));
			CP_DebugMsg("MISSION: " + CP_GetGlobalState("Mis_GriffAngry", TRUE));
		}
	
	if (IsAvailableCreature(NPC_ZAALBAR))
		{
			CP_DebugMsg("==============================================");
			CP_DebugMsg("ZAALBAR: " + CP_GetGlobalState("ZaalbarTalk", FALSE));
			CP_DebugMsg("ZAALBAR: " + CP_GetGlobalState("ZaalbarTalkMad", TRUE));
			CP_DebugMsg("ZAALBAR: " + CP_GetGlobalState("kas_FreyyrDead", TRUE));
			CP_DebugMsg("ZAALBAR: " + CP_GetGlobalState("kas_ChuundarDead", TRUE));
			CP_DebugMsg("ZAALBAR: " + CP_GetGlobalState("G_KashyyykSlaver", TRUE));
			CP_DebugMsg("ZAALBAR: " + CP_GetGlobalState("Unk_ZaalbarInsane", TRUE));
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

//////////////////////////////////////////////////////////////////////////////////
/*	CP_ItemType()
	
	Returns the base item type of the input item as a string for debug messages.
	
	DP 2023-12-04																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_ItemType(object oItem) {
	int nItem = GetBaseItemType(oItem);
	string sType;
	
	switch (nItem)
		{
			case BASE_ITEM_INVALID:
				sType = "INVALID";
			break;
			case BASE_ITEM_QUARTER_STAFF:
				sType = "QUARTER STAFF";
			break;
			case BASE_ITEM_STUN_BATON:
				sType = "STUN BATON";
			break;
			case BASE_ITEM_LONG_SWORD:
				sType = "LONG SWORD";
			break;
			case BASE_ITEM_VIBRO_SWORD:
				sType = "VIBROSWORD";
			break;
			case BASE_ITEM_SHORT_SWORD:
				sType = "SHORT SWORD";
			break;
			case BASE_ITEM_VIBRO_BLADE:
				sType = "VIBROBLADE";
			break;
			case BASE_ITEM_DOUBLE_BLADED_SWORD:
				sType = "DOUBLE BLADED SWORD";
			break;
			case BASE_ITEM_VIBRO_DOUBLE_BLADE:
				sType = "VIBRO DOUBLEBLADE";
			break;
			case BASE_ITEM_LIGHTSABER:
				sType = "LIGHTSABER";
			break;
			case BASE_ITEM_DOUBLE_BLADED_LIGHTSABER:
				sType = "DOUBLE BLADED LIGHTSABER";
			break;
			case BASE_ITEM_SHORT_LIGHTSABER:
				sType = "SHORT LIGHTSABER";
			break;
			case BASE_ITEM_LIGHTSABER_CRYSTALS:
				sType = "LIGHTSABER CRYSTAL";
			break;
			case BASE_ITEM_BLASTER_PISTOL:
				sType = "BLASTER PISTOL";
			break;
			case BASE_ITEM_HEAVY_BLASTER:
				sType = "HEAVY BLASTER";
			break;
			case BASE_ITEM_HOLD_OUT_BLASTER:
				sType = "HOLDOUT BLASTER";
			break;
			case BASE_ITEM_ION_BLASTER:
				sType = "ION BLASTER";
			break;
			case BASE_ITEM_DISRUPTER_PISTOL:
				sType = "DISRUPTER PISTOL";
			break;
			case BASE_ITEM_SONIC_PISTOL:
				sType = "SONIC PISTOL";
			break;
			case BASE_ITEM_ION_RIFLE:
				sType = "ION RIFLE";
			break;
			case BASE_ITEM_BOWCASTER:
				sType = "BOWCASTER";
			break;
			case BASE_ITEM_BLASTER_CARBINE:
				sType = "BLASTER CARBINE";
			break;
			case BASE_ITEM_DISRUPTER_RIFLE:
				sType = "DISRUPTER RIFLE";
			break;
			case BASE_ITEM_SONIC_RIFLE:
				sType = "SONIC RIFLE";
			break;
			case BASE_ITEM_REPEATING_BLASTER:
				sType = "REPEATING BLASTER RIFLE";
			break;
			case BASE_ITEM_HEAVY_REPEATING_BLASTER:
				sType = "HEAVY REPEATING BLASTER";
			break;
			case BASE_ITEM_FRAGMENTATION_GRENADES:
				sType = "FRAGMENTATION GRENADE";
			break;
			case BASE_ITEM_STUN_GRENADES:
				sType = "STUN GRENADE";
			break;
			case BASE_ITEM_THERMAL_DETONATOR:
				sType = "THERMAL DETONATOR";
			break;
			case BASE_ITEM_POISON_GRENADE:
				sType = "POISON GRENADE";
			break;
			case BASE_ITEM_FLASH_GRENADE:
				sType = "FLASH GRENADE";
			break;
			case BASE_ITEM_SONIC_GRENADE:
				sType = "SONIC GRENADE";
			break;
			case BASE_ITEM_ADHESIVE_GRENADE:
				sType = "ADHESIVE GRENADE";
			break;
			case BASE_ITEM_CRYOBAN_GRENADE:
				sType = "CRYOBAN GRENADE";
			break;
			case BASE_ITEM_FIRE_GRENADE:
				sType = "FIRE GRENADE";
			break;
			case BASE_ITEM_ION_GRENADE:
				sType = "ION GRENADE";
			break;
			case BASE_ITEM_JEDI_ROBE:
				sType = "JEDI ROBE";
			break;
			case BASE_ITEM_JEDI_KNIGHT_ROBE:
				sType = "JEDI KNIGHT ROBE";
			break;
			case BASE_ITEM_JEDI_MASTER_ROBE:
				sType = "JEDI MASTER ROBE";
			break;
			case BASE_ITEM_ARMOR_CLASS_4:
				sType = "ARMOUR CLASS 4";
			break;
			case BASE_ITEM_ARMOR_CLASS_5:
				sType = "ARMOUR CLASS 5";
			break;
			case BASE_ITEM_ARMOR_CLASS_6:
				sType = "ARMOUR CLASS 6";
			break;
			case BASE_ITEM_ARMOR_CLASS_7:
				sType = "ARMOUR CLASS 7";
			break;
			case BASE_ITEM_ARMOR_CLASS_8:
				sType = "ARMOUR CLASS 8";
			break;
			case BASE_ITEM_ARMOR_CLASS_9:
				sType = "ARMOUR CLASS 9";
			break;
			case BASE_ITEM_MASK:
				sType = "MASK";
			break;
			case BASE_ITEM_GAUNTLETS:
				sType = "GLOVES";
			break;
			case BASE_ITEM_FOREARM_BANDS:
				sType = "FOREARM SHIELD";
			break;
			case BASE_ITEM_BELT:
				sType = "BELT";
			break;
			case BASE_ITEM_IMPLANT_1:
				sType = "IMPLANT LVL 1";
			break;
			case BASE_ITEM_IMPLANT_2:
				sType = "IMPLANT LVL 2";
			break;
			case BASE_ITEM_IMPLANT_3:
				sType = "IMPLANT LVL 3";
			break;
			case BASE_ITEM_DATA_PAD:
				sType = "DATAPAD";
			break;
			case BASE_ITEM_ADRENALINE:
				sType = "ADRENALINE";
			break;
			case BASE_ITEM_COMBAT_SHOTS:
				sType = "COMBAT SHOT";
			break;
			case BASE_ITEM_MEDICAL_EQUIPMENT:
				sType = "MEDICAL EQUIPMENT";
			break;
			case BASE_ITEM_DROID_REPAIR_EQUIPMENT:
				sType = "DROID REPAIR EQUIPMENT";
			break;
			case BASE_ITEM_CREDITS:
				sType = "CREDITS";
			break;
			case BASE_ITEM_TRAP_KIT:
				sType = "MINE";
			break;
			case BASE_ITEM_SECURITY_SPIKES:
				sType = "SECURITY SPIKES";
			break;
			case BASE_ITEM_PROGRAMMING_SPIKES:
				sType = "PROGRAMMING SPIKES";
			break;
			case BASE_ITEM_GLOW_ROD:
				sType = "GLOW ROD";
			break;
			case BASE_ITEM_COLLAR_LIGHT:
				sType = "COLLAR LIGHT";
			break;
			case BASE_ITEM_TORCH:
				sType = "TORCH";
			break;
			case BASE_ITEM_PLOT_USEABLE_ITEMS:
				sType = "PLOT USEABLE";
			break;
			case BASE_ITEM_AESTHETIC_ITEM:
				sType = "AESTHETIC";
			break;
			case BASE_ITEM_DROID_LIGHT_PLATING:
				sType = "DROID LIGHT PLATING";
			break;
			case BASE_ITEM_DROID_MEDIUM_PLATING:
				sType = "DROID MEDIUM PLATING";
			break;
			case BASE_ITEM_DROID_HEAVY_PLATING:
				sType = "DROID HEAVY PLATING";
			break;
			case BASE_ITEM_DROID_SEARCH_SCOPE:
				sType = "DROID SEARCH SCOPE";
			break;
			case BASE_ITEM_DROID_MOTION_SENSORS:
				sType = "DROID MOTION SENSOR";
			break;
			case BASE_ITEM_DROID_SONIC_SENSORS:
				sType = "DROID SONIC SENSOR";
			break;
			case BASE_ITEM_DROID_TARGETING_COMPUTERS:
				sType = "DROID TARGETING COMPUTER";
			break;
			case BASE_ITEM_DROID_COMPUTER_SPIKE_MOUNT:
				sType = "DROID COMPUTER SPIKE";
			break;
			case BASE_ITEM_DROID_SECURITY_SPIKE_MOUNT:
				sType = "DROID SECURITY SPIKE";
			break;
			case BASE_ITEM_DROID_SHIELD:
				sType = "DROID SHIELD";
			break;
			case BASE_ITEM_DROID_UTILITY_DEVICE:
				sType = "DROID UTILITY DEVICE";
			break;
			case BASE_ITEM_BLASTER_RIFLE:
				sType = "BLASTER RIFLE";
			break;
			case BASE_ITEM_GHAFFI_STICK:
				sType = "GAFFI STICK";
			break;
			case BASE_ITEM_WOOKIE_WARBLADE:
				sType = "WOOKIE WARBLADE";
			break;
			case BASE_ITEM_GAMMOREAN_BATTLEAXE:
				sType = "GAMMOREAN BATTLEAXE";
			break;
			case BASE_ITEM_CREATURE_ITEM_SLASH:
				sType = "CREATURE WEAPON SLASH";
			break;
			case BASE_ITEM_CREATURE_ITEM_PIERCE:
				sType = "CREATURE WEAPON PIERCE";
			break;
			case BASE_ITEM_CREATURE_WEAPON_SL_PRC:
				sType = "CREATURE WEAPON SLASH / PIERCE";
			break;
			case BASE_ITEM_CREATURE_HIDE_ITEM:
				sType = "CREATURE HIDE";
			break;
			case BASE_ITEM_BASIC_CLOTHING:
				sType = "BASIC CLOTHING";
			break;
		}
	
	return sType;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetFaction()
	
	Returns the name of the faction the input creature belongs to as a string for
	debug messages.
	
	DP 2023-12-04																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_GetFaction(object oTarget) {
	int nFaction = GetStandardFaction(oTarget);
	string sFac;
	
	switch (nFaction)
		{
			case INVALID_STANDARD_FACTION:
				sFac = "INVALID";
			break;
			case STANDARD_FACTION_HOSTILE_1:
				sFac = "HOSTILE 1";
			break;
			case STANDARD_FACTION_FRIENDLY_1:
				sFac = "FRIENDLY 1";
			break;
			case STANDARD_FACTION_HOSTILE_2:
				sFac = "HOSTILE 2";
			break;
			case STANDARD_FACTION_FRIENDLY_2:
				sFac = "FRIENDLY 2";
			break;
			case STANDARD_FACTION_NEUTRAL:
				sFac = "NEUTRAL";
			break;
			case STANDARD_FACTION_INSANE:
				sFac = "INSANE";
			break;
			case STANDARD_FACTION_PTAT_TUSKAN:
				sFac = "SAND PEOPLE";
			break;
			case STANDARD_FACTION_GLB_XOR:
				sFac = "XOR";
			break;
			case STANDARD_FACTION_SURRENDER_1:
				sFac = "SURRENDER 1";
			break;
			case STANDARD_FACTION_SURRENDER_2:
				sFac = "SURRENDER 2";
			break;
			case STANDARD_FACTION_PREDATOR:
				sFac = "PREDATOR";
			break;
			case STANDARD_FACTION_PREY:
				sFac = "PREY";
			break;
			case STANDARD_FACTION_TRAP:
				sFac = "TRAP";
			break;
			case STANDARD_FACTION_ENDAR_SPIRE:
				sFac = "ENDAR SPIRE";
			break;
			case STANDARD_FACTION_RANCOR:
				sFac = "RANCOR";
			break;
			case STANDARD_FACTION_GIZKA_1:
				sFac = "GIZKA 1";
			break;
			case STANDARD_FACTION_GIZKA_2:
				sFac = "GIZKA 2";
			break;
			case 18: // STANDARD_FACTION_CZERKA
				sFac = "CZERKA";
			break;
			case 19: // STANDARD_FACTION_ZONE_CONTROLLER
				sFac = "ZONE CONTROLLER";
			break;
			case 20: // STANDARD_FACTION_SACRIFICE
				sFac = "SACRIFICE";
			break;
		}
	
	return sFac;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_MainPlotState()
	
	Returns a string that summarises the current state of the main plot progression.
	
	DP 2023-12-06																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_MainPlotState() {
	int nGameState = GetGlobalNumber("K_KOTOR_MASTER");
	
	switch (nGameState)
		{
			case 0: return "ON ENDAR SPIRE";
			case 5: return "ON TARIS";
			case 10: return "ON DANTOOINE";
			case 15: return "MIDGAME";
			case 20: return "POST-LEVIATHAN";
			case 30: return "LEHON AVAILABLE";
			case 40: return "ON LEHON";
			case 50: return "ON STAR FORGE";
		}
	
	return "INVALID VALUE (" + IntToString(nGameState) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetGlobalState()
	
	Returns a string that reports the state of the supplied global boolean/number.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_GetGlobalState(string sGlobal, int bIsBoolean = TRUE) {
	int nGlobal;
	string sState = "INVALID";
	
	if (bIsBoolean == TRUE)
		{
			nGlobal = GetGlobalBoolean(sGlobal);
			
			return GetStringUpperCase(sGlobal) + " = " + CP_BoolToString(nGlobal);
		}
		else
			{
				nGlobal = GetGlobalNumber(sGlobal);
				
				return GetStringUpperCase(sGlobal) + " = " + IntToString(nGlobal);
			}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetGlobalState()
	
	Returns a string that reports the current stage of Star Map progression.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_GetStarMapState() {
	int nMap = GetGlobalNumber("K_STAR_MAP");
	
	switch (nMap)
		{
			case 0: return "NO MAP ACTIVATED";
			case 10: return "1ST MAP ACTIVATED (DANTOOINE)";
			case 20: return "2ND MAP ACTIVATED";
			case 30: return "3RD MAP ACTIVATED";
			case 40: return "4TH MAP ACTIVATED (LEVIATHAN TRIGGERED)";
			case 50: return "5TH MAP ACTIVATED";
		}
	
	return "INVALID VALUE FOR K_STAR_MAP (" + IntToString(nMap) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_NPCAIState()
	
	Returns the current state of the supplied NPC's AI flag.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_NPCAIState(object oNPC) {
	int nState = GetLocalBoolean(oNPC, 62); // SW_FLAG_AI_OFF
	string sState;
	
	if (!nState) // FALSE. AI is active.
		{
			sState = "ACTIVE (DEFAULT)";
		}
		else // TRUE. AI is disabled.
			{
				sState = "DISABLED";
			}
	
	return CP_NPCName(oNPC) + "'S AI STATE IS CURRENTLY SET TO " + sState;
}
