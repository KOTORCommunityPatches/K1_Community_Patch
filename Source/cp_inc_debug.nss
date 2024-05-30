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

// Returns a string that reports the state of the supplied local boolean on the target object.
string CP_GetLocalBoolState(object oNPC, int nIndex);

// Returns a string for the name of the supplied local boolean flag.
string CP_GetLocalBoolName(int nIndex);

// Returns a string that reports the current stage of Star Map progression.
string CP_GetStarMapState();

// Returns the current state of the supplied NPC's AI flag.
string CP_NPCAIState(object oNPC);

// Returns the input float as a trimmed string without the carriage return.
string CP_FloatToString(float fFloat);

// Returns the input location as a string.
string CP_LocationToString(location lLoc);


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
	
	Converts a TRUE/FALSE value into a string for debug messages. Note that local
	booleans can return spurious values.
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_BoolToString(int bBool) {
	switch (bBool)
		{
			case FALSE: return "FALSE";
			case TRUE: return "TRUE";
		}
	
	return "INVALID VALUE (" + IntToString(bBool) + ")";
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
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("K_XOR_AMBUSH_FIX", TRUE));
			CP_DebugMsg("JUHANI: " + CP_GetGlobalState("K1CP_XOR_SPAWNED", TRUE));
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
	
	return "INVALID VALUE (" + IntToString(nNPC) + ")";
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
	
	if (!GetIsObjectValid(oTarget))
		{
			return "ERROR, OBJECT INVALID";
		}
	
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
	
	switch (nType)
		{
			case EFFECT_TYPE_INVALIDEFFECT: return "INVALID EFFECT";
			case EFFECT_TYPE_DAMAGE_RESISTANCE: return "DAMAGE RESISTANCE";
			case EFFECT_TYPE_REGENERATE: return "REGENERATE";
			case EFFECT_TYPE_DAMAGE_REDUCTION: return "DAMAGE REDUCTION";
			case EFFECT_TYPE_TEMPORARY_HITPOINTS: return "TEMPORARY HITPOINTS";
			case EFFECT_TYPE_ENTANGLE: return "ENTANGLE";
			case EFFECT_TYPE_INVULNERABLE: return "INVULNERABLE";
			case EFFECT_TYPE_DEAF: return "DEAF";
			case EFFECT_TYPE_RESURRECTION: return "RESURRECTION";
			case EFFECT_TYPE_IMMUNITY: return "IMMUNITY";
			case EFFECT_TYPE_ENEMY_ATTACK_BONUS: return "ENEMY ATTACK BONUS";
			case EFFECT_TYPE_ARCANE_SPELL_FAILURE: return "ARCANE SPELL FAILURE";
			case EFFECT_TYPE_AREA_OF_EFFECT: return "AREA OF EFFECT";
			case EFFECT_TYPE_BEAM: return "BEAM";
			case EFFECT_TYPE_CHARMED: return "CHARMED";
			case EFFECT_TYPE_CONFUSED: return "CONFUSED";
			case EFFECT_TYPE_FRIGHTENED: return "FRIGHTENED";
			case EFFECT_TYPE_DOMINATED: return "DOMINATED";
			case EFFECT_TYPE_PARALYZE: return "PARALYZE";
			case EFFECT_TYPE_DAZED: return "DAZED";
			case EFFECT_TYPE_STUNNED: return "STUNNED";
			case EFFECT_TYPE_SLEEP: return "SLEEP";
			case EFFECT_TYPE_POISON: return "POISON";
			case EFFECT_TYPE_DISEASE: return "DISEASE";
			case EFFECT_TYPE_CURSE: return "CURSE";
			case EFFECT_TYPE_SILENCE: return "SILENCE";
			case EFFECT_TYPE_TURNED: return "TURNED";
			case EFFECT_TYPE_HASTE: return "HASTE";
			case EFFECT_TYPE_SLOW: return "SLOW";
			case EFFECT_TYPE_ABILITY_INCREASE: return "ABILITY INCREASE";
			case EFFECT_TYPE_ABILITY_DECREASE: return "ABILITY DECREASE";
			case EFFECT_TYPE_ATTACK_INCREASE: return "ATTACK INCREASE";
			case EFFECT_TYPE_ATTACK_DECREASE: return "ATTACK DECREASE";
			case EFFECT_TYPE_DAMAGE_INCREASE: return "DAMAGE INCREASE";
			case EFFECT_TYPE_DAMAGE_DECREASE: return "DAMAGE DECREASE";
			case EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE: return "DAMAGE IMMUNITY INCREASE";
			case EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE: return "DAMAGE IMMUNITY DECREASE";
			case EFFECT_TYPE_AC_INCREASE: return "AC INCREASE";
			case EFFECT_TYPE_AC_DECREASE: return "AC DECREASE";
			case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE: return "MOVEMENT SPEED INCREASE";
			case EFFECT_TYPE_MOVEMENT_SPEED_DECREASE: return "MOVEMENT SPEED DECREASE";
			case EFFECT_TYPE_SAVING_THROW_INCREASE: return "SAVING THROW INCREASE";
			case EFFECT_TYPE_SAVING_THROW_DECREASE: return "SAVING THROW DECREASE";
			case EFFECT_TYPE_FORCE_RESISTANCE_INCREASE: return "FORCE RESISTANCE INCREASE";
			case EFFECT_TYPE_FORCE_RESISTANCE_DECREASE: return "FORCE RESISTANCE DECREASE";
			case EFFECT_TYPE_SKILL_INCREASE: return "SKILL INCREASE";
			case EFFECT_TYPE_SKILL_DECREASE: return "SKILL DECREASE";
			case EFFECT_TYPE_INVISIBILITY: return "INVISIBILITY";
			case EFFECT_TYPE_IMPROVEDINVISIBILITY: return "IMPROVED INVISIBILITY";
			case EFFECT_TYPE_DARKNESS: return "DARKNESS";
			case EFFECT_TYPE_DISPELMAGICALL: return "DISPEL MAGICALL";
			case EFFECT_TYPE_ELEMENTALSHIELD: return "ELEMENTAL SHIELD";
			case EFFECT_TYPE_NEGATIVELEVEL: return "NEGATIVE LEVEL";
			case EFFECT_TYPE_DISGUISE: return "DISGUISE";
			case EFFECT_TYPE_SANCTUARY: return "SANCTUARY";
			case EFFECT_TYPE_TRUESEEING: return "TRUE SEEING";
			case EFFECT_TYPE_SEEINVISIBLE: return "SEE INVISIBLE";
			case EFFECT_TYPE_TIMESTOP: return "TIMESTOP";
			case EFFECT_TYPE_BLINDNESS: return "BLINDNESS";
			case EFFECT_TYPE_SPELLLEVELABSORPTION: return "SPELL LEVEL ABSORPTION";
			case EFFECT_TYPE_DISPELMAGICBEST: return "DISPEL MAGIC BEST";
			case EFFECT_TYPE_ULTRAVISION: return "ULTRAVISION";
			case EFFECT_TYPE_MISS_CHANCE: return "MISS CHANCE";
			case EFFECT_TYPE_CONCEALMENT: return "CONCEALMENT";
			case EFFECT_TYPE_SPELL_IMMUNITY: return "SPELL IMMUNITY";
			case EFFECT_TYPE_ASSUREDHIT: return "ASSURED HIT";
			case EFFECT_TYPE_VISUAL: return "VISUAL";
			case EFFECT_TYPE_LIGHTSABERTHROW: return "LIGHTSABER THROW";
			case EFFECT_TYPE_FORCEJUMP: return "FORCE JUMP";
			case EFFECT_TYPE_ASSUREDDEFLECTION: return "ASSURED DEFLECTION";
		}
	
	return "INVALID VALUE (" + IntToString(nType) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_EffectSubType()
	
	Returns the subtype of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_EffectSubType(effect eEffect) {
	int nSubType = GetEffectSubType(eEffect);
	
	switch (nSubType)
		{
			case SUBTYPE_MAGICAL: return "MAGICAL";
			case SUBTYPE_SUPERNATURAL: return "SUPERNATURAL";
			case SUBTYPE_EXTRAORDINARY: return "EXTRAORDINARY";
		}
	
	return "INVALID VALUE (" + IntToString(nSubType) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_EffectDuration()
	
	Returns the duration type of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_EffectDuration(effect eEffect) {
	int nDur = GetEffectDurationType(eEffect);
	
	switch (nDur)
		{
			case DURATION_TYPE_INSTANT: return "INSTANT";
			case DURATION_TYPE_TEMPORARY: return "TEMPORARY";
			case DURATION_TYPE_PERMANENT: return "PERMANENT";
		}
	
	return "INVALID VALUE (" + IntToString(nDur) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_SpellType()
	
	Returns the spell type of the input effect as a string for debug messages.
	
	DP 2023-12-02																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_SpellType(effect eEffect) {
	int nType = GetEffectSpellId(eEffect);
	
	switch (nType)
		{
			case FORCE_POWER_ALL_FORCE_POWERS: return "INVALID / IMMUNITY";
			case FORCE_POWER_MASTER_ALTER: return "MASTER ALTER";
			case FORCE_POWER_MASTER_CONTROL: return "MASTER CONTROL";
			case FORCE_POWER_MASTER_SENSE: return "MASTER SENSE";
			case FORCE_POWER_FORCE_JUMP_ADVANCED: return "FORCE JUMP ADVANCED";
			case FORCE_POWER_LIGHT_SABER_THROW_ADVANCED: return "LIGHTSABER THROW ADVANCED";
			case FORCE_POWER_REGNERATION_ADVANCED: return "REGNERATION ADVANCED";
			case FORCE_POWER_AFFECT_MIND: return "AFFECT MIND";
			case FORCE_POWER_AFFLICTION: return "AFFLICTION";
			case FORCE_POWER_SPEED_BURST: return "BURST OF SPEED";
			case FORCE_POWER_CHOKE: return "CHOKE";
			case FORCE_POWER_CURE: return "CURE";
			case FORCE_POWER_DEATH_FIELD: return "DEATH FIELD";
			case FORCE_POWER_DROID_DISABLE: return "DISABLE DROID";
			case FORCE_POWER_DROID_DESTROY: return "DESTROY DROID";
			case FORCE_POWER_DOMINATE: return "DOMINATE";
			case FORCE_POWER_DRAIN_LIFE: return "DRAIN LIFE";
			case FORCE_POWER_FEAR: return "FEAR";
			case FORCE_POWER_FORCE_ARMOR: return "FORCE ARMOR";
			case FORCE_POWER_FORCE_AURA: return "FORCE AURA";
			case FORCE_POWER_FORCE_BREACH: return "FORCE BREACH";
			case FORCE_POWER_FORCE_IMMUNITY: return "FORCE IMMUNITY";
			case FORCE_POWER_FORCE_JUMP: return "FORCE JUMP";
			case FORCE_POWER_FORCE_MIND: return "FORCE MIND";
			case FORCE_POWER_FORCE_PUSH: return "FORCE PUSH";
			case FORCE_POWER_FORCE_SHIELD: return "FORCE SHIELD";
			case FORCE_POWER_FORCE_STORM: return "FORCE STORM";
			case FORCE_POWER_FORCE_WAVE: return "FORCE WAVE";
			case FORCE_POWER_FORCE_WHIRLWIND: return "FORCE WHIRLWIND";
			case FORCE_POWER_HEAL: return "HEAL";
			case FORCE_POWER_HOLD: return "HOLD";
			case FORCE_POWER_HORROR: return "HORROR";
			case FORCE_POWER_INSANITY: return "INSANITY";
			case FORCE_POWER_KILL: return "KILL";
			case FORCE_POWER_KNIGHT_MIND: return "KNIGHT MIND";
			case FORCE_POWER_KNIGHT_SPEED: return "KNIGHT SPEED";
			case FORCE_POWER_LIGHTNING: return "LIGHTNING";
			case FORCE_POWER_MIND_MASTERY: return "MIND MASTERY";
			case FORCE_POWER_SPEED_MASTERY: return "SPEED MASTERY";
			case FORCE_POWER_PLAGUE: return "PLAGUE";
			case FORCE_POWER_REGENERATION: return "REGENERATION";
			case FORCE_POWER_RESIST_COLD_HEAT_ENERGY: return "RESIST COLD / HEAT / ENERGY";
			case FORCE_POWER_RESIST_FORCE: return "RESIST FORCE";
			case FORCE_POWER_RESIST_POISON_DISEASE_SONIC: return "RESIST POISON / DISEASE / SONIC";
			case FORCE_POWER_SHOCK: return "SHOCK";
			case FORCE_POWER_SLEEP: return "SLEEP";
			case FORCE_POWER_SLOW: return "SLOW";
			case FORCE_POWER_STUN: return "STUN";
			case FORCE_POWER_DROID_STUN: return "STUN DROID";
			case FORCE_POWER_SUPRESS_FORCE: return "SUPRESS FORCE";
			case FORCE_POWER_LIGHT_SABER_THROW: return "LIGHTSABER THROW";
			case FORCE_POWER_WOUND: return "WOUND";
			case SPECIAL_ABILITY_BATTLE_MEDITATION: return "SPECIAL ABILITY BATTLE MEDITATION";
			case SPECIAL_ABILITY_BODY_FUEL: return "SPECIAL ABILITY BODY FUEL";
			case SPECIAL_ABILITY_COMBAT_REGENERATION: return "SPECIAL ABILITY COMBAT REGENERATION";
			case SPECIAL_ABILITY_WARRIOR_STANCE: return "SPECIAL ABILITY WARRIOR STANCE";
			case SPECIAL_ABILITY_SENTINEL_STANCE: return "SPECIAL ABILITY SENTINEL STANCE";
			case SPECIAL_ABILITY_DOMINATE_MIND: return "SPECIAL ABILITY DOMINATE MIND";
			case SPECIAL_ABILITY_PSYCHIC_STANCE: return "SPECIAL ABILITY PSYCHIC STANCE";
			case SPECIAL_ABILITY_CATHAR_REFLEXES: return "SPECIAL ABILITY CATHAR REFLEXES";
			case SPECIAL_ABILITY_ENHANCED_SENSES: return "SPECIAL ABILITY ENHANCED SENSES";
			case SPECIAL_ABILITY_CAMOFLAGE: return "SPECIAL ABILITY CAMOFLAGE";
			case SPECIAL_ABILITY_TAUNT: return "SPECIAL ABILITY TAUNT";
			case SPECIAL_ABILITY_WHIRLING_DERVISH: return "SPECIAL ABILITY WHIRLING DERVISH";
			case SPECIAL_ABILITY_RAGE: return "SPECIAL ABILITY RAGE";
		}
	
	return "INVALID VALUE (" + IntToString(nType) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_ItemType()
	
	Returns the base item type of the input item as a string for debug messages.
	
	DP 2023-12-04																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_ItemType(object oItem) {
	int nItem = GetBaseItemType(oItem);
	
	switch (nItem)
		{
			case BASE_ITEM_INVALID: return "INVALID";
			case BASE_ITEM_QUARTER_STAFF: return "QUARTER STAFF";
			case BASE_ITEM_STUN_BATON: return "STUN BATON";
			case BASE_ITEM_LONG_SWORD: return "LONG SWORD";
			case BASE_ITEM_VIBRO_SWORD: return "VIBROSWORD";
			case BASE_ITEM_SHORT_SWORD: return "SHORT SWORD";
			case BASE_ITEM_VIBRO_BLADE: return "VIBROBLADE";
			case BASE_ITEM_DOUBLE_BLADED_SWORD: return "DOUBLE BLADED SWORD";
			case BASE_ITEM_VIBRO_DOUBLE_BLADE: return "VIBRO DOUBLEBLADE";
			case BASE_ITEM_LIGHTSABER: return "LIGHTSABER";
			case BASE_ITEM_DOUBLE_BLADED_LIGHTSABER: return "DOUBLE BLADED LIGHTSABER";
			case BASE_ITEM_SHORT_LIGHTSABER: return "SHORT LIGHTSABER";
			case BASE_ITEM_LIGHTSABER_CRYSTALS: return "LIGHTSABER CRYSTAL";
			case BASE_ITEM_BLASTER_PISTOL: return "BLASTER PISTOL";
			case BASE_ITEM_HEAVY_BLASTER: return "HEAVY BLASTER";
			case BASE_ITEM_HOLD_OUT_BLASTER: return "HOLDOUT BLASTER";
			case BASE_ITEM_ION_BLASTER: return "ION BLASTER";
			case BASE_ITEM_DISRUPTER_PISTOL: return "DISRUPTER PISTOL";
			case BASE_ITEM_SONIC_PISTOL: return "SONIC PISTOL";
			case BASE_ITEM_ION_RIFLE: return "ION RIFLE";
			case BASE_ITEM_BOWCASTER: return "BOWCASTER";
			case BASE_ITEM_BLASTER_CARBINE: return "BLASTER CARBINE";
			case BASE_ITEM_DISRUPTER_RIFLE: return "DISRUPTER RIFLE";
			case BASE_ITEM_SONIC_RIFLE: return "SONIC RIFLE";
			case BASE_ITEM_REPEATING_BLASTER: return "REPEATING BLASTER RIFLE";
			case BASE_ITEM_HEAVY_REPEATING_BLASTER: return "HEAVY REPEATING BLASTER";
			case BASE_ITEM_FRAGMENTATION_GRENADES: return "FRAGMENTATION GRENADE";
			case BASE_ITEM_STUN_GRENADES: return "STUN GRENADE";
			case BASE_ITEM_THERMAL_DETONATOR: return "THERMAL DETONATOR";
			case BASE_ITEM_POISON_GRENADE: return "POISON GRENADE";
			case BASE_ITEM_FLASH_GRENADE: return "FLASH GRENADE";
			case BASE_ITEM_SONIC_GRENADE: return "SONIC GRENADE";
			case BASE_ITEM_ADHESIVE_GRENADE: return "ADHESIVE GRENADE";
			case BASE_ITEM_CRYOBAN_GRENADE: return "CRYOBAN GRENADE";
			case BASE_ITEM_FIRE_GRENADE: return "FIRE GRENADE";
			case BASE_ITEM_ION_GRENADE: return "ION GRENADE";
			case BASE_ITEM_JEDI_ROBE: return "JEDI ROBE";
			case BASE_ITEM_JEDI_KNIGHT_ROBE: return "JEDI KNIGHT ROBE";
			case BASE_ITEM_JEDI_MASTER_ROBE: return "JEDI MASTER ROBE";
			case BASE_ITEM_ARMOR_CLASS_4: return "ARMOUR CLASS 4";
			case BASE_ITEM_ARMOR_CLASS_5: return "ARMOUR CLASS 5";
			case BASE_ITEM_ARMOR_CLASS_6: return "ARMOUR CLASS 6";
			case BASE_ITEM_ARMOR_CLASS_7: return "ARMOUR CLASS 7";
			case BASE_ITEM_ARMOR_CLASS_8: return "ARMOUR CLASS 8";
			case BASE_ITEM_ARMOR_CLASS_9: return "ARMOUR CLASS 9";
			case BASE_ITEM_MASK: return "MASK";
			case BASE_ITEM_GAUNTLETS: return "GLOVES";
			case BASE_ITEM_FOREARM_BANDS: return "FOREARM SHIELD";
			case BASE_ITEM_BELT: return "BELT";
			case BASE_ITEM_IMPLANT_1: return "IMPLANT LVL 1";
			case BASE_ITEM_IMPLANT_2: return "IMPLANT LVL 2";
			case BASE_ITEM_IMPLANT_3: return "IMPLANT LVL 3";
			case BASE_ITEM_DATA_PAD: return "DATAPAD";
			case BASE_ITEM_ADRENALINE: return "ADRENALINE";
			case BASE_ITEM_COMBAT_SHOTS: return "COMBAT SHOT";
			case BASE_ITEM_MEDICAL_EQUIPMENT: return "MEDICAL EQUIPMENT";
			case BASE_ITEM_DROID_REPAIR_EQUIPMENT: return "DROID REPAIR EQUIPMENT";
			case BASE_ITEM_CREDITS: return "CREDITS";
			case BASE_ITEM_TRAP_KIT: return "MINE";
			case BASE_ITEM_SECURITY_SPIKES: return "SECURITY SPIKES";
			case BASE_ITEM_PROGRAMMING_SPIKES: return "PROGRAMMING SPIKES";
			case BASE_ITEM_GLOW_ROD: return "GLOW ROD";
			case BASE_ITEM_COLLAR_LIGHT: return "COLLAR LIGHT";
			case BASE_ITEM_TORCH: return "TORCH";
			case BASE_ITEM_PLOT_USEABLE_ITEMS: return "PLOT USEABLE";
			case BASE_ITEM_AESTHETIC_ITEM: return "AESTHETIC";
			case BASE_ITEM_DROID_LIGHT_PLATING: return "DROID LIGHT PLATING";
			case BASE_ITEM_DROID_MEDIUM_PLATING: return "DROID MEDIUM PLATING";
			case BASE_ITEM_DROID_HEAVY_PLATING: return "DROID HEAVY PLATING";
			case BASE_ITEM_DROID_SEARCH_SCOPE: return "DROID SEARCH SCOPE";
			case BASE_ITEM_DROID_MOTION_SENSORS: return "DROID MOTION SENSOR";
			case BASE_ITEM_DROID_SONIC_SENSORS: return "DROID SONIC SENSOR";
			case BASE_ITEM_DROID_TARGETING_COMPUTERS: return "DROID TARGETING COMPUTER";
			case BASE_ITEM_DROID_COMPUTER_SPIKE_MOUNT: return "DROID COMPUTER SPIKE";
			case BASE_ITEM_DROID_SECURITY_SPIKE_MOUNT: return "DROID SECURITY SPIKE";
			case BASE_ITEM_DROID_SHIELD: return "DROID SHIELD";
			case BASE_ITEM_DROID_UTILITY_DEVICE: return "DROID UTILITY DEVICE";
			case BASE_ITEM_BLASTER_RIFLE: return "BLASTER RIFLE";
			case BASE_ITEM_GHAFFI_STICK: return "GAFFI STICK";
			case BASE_ITEM_WOOKIE_WARBLADE: return "WOOKIE WARBLADE";
			case BASE_ITEM_GAMMOREAN_BATTLEAXE: return "GAMMOREAN BATTLEAXE";
			case BASE_ITEM_CREATURE_ITEM_SLASH: return "CREATURE WEAPON SLASH";
			case BASE_ITEM_CREATURE_ITEM_PIERCE: return "CREATURE WEAPON PIERCE";
			case BASE_ITEM_CREATURE_WEAPON_SL_PRC: return "CREATURE WEAPON SLASH / PIERCE";
			case BASE_ITEM_CREATURE_HIDE_ITEM: return "CREATURE HIDE";
			case BASE_ITEM_BASIC_CLOTHING: return "BASIC CLOTHING";
		}
	
	return "INVALID VALUE (" + IntToString(nItem) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetFaction()
	
	Returns the name of the faction the input creature belongs to as a string for
	debug messages.
	
	DP 2023-12-04																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_GetFaction(object oTarget) {
	int nFaction = GetStandardFaction(oTarget);
	
	if (!GetIsObjectValid(oTarget))
		{
			return "ERROR, OBJECT INVALID";
		}
	
	switch (nFaction)
		{
			case INVALID_STANDARD_FACTION: return "INVALID";
			case STANDARD_FACTION_HOSTILE_1: return "HOSTILE 1";
			case STANDARD_FACTION_FRIENDLY_1: return "FRIENDLY 1";
			case STANDARD_FACTION_HOSTILE_2: return "HOSTILE 2";
			case STANDARD_FACTION_FRIENDLY_2: return "FRIENDLY 2";
			case STANDARD_FACTION_NEUTRAL: return "NEUTRAL";
			case STANDARD_FACTION_INSANE: return "INSANE";
			case STANDARD_FACTION_PTAT_TUSKAN: return "SAND PEOPLE";
			case STANDARD_FACTION_GLB_XOR: return "XOR";
			case STANDARD_FACTION_SURRENDER_1: return "SURRENDER 1";
			case STANDARD_FACTION_SURRENDER_2: return "SURRENDER 2";
			case STANDARD_FACTION_PREDATOR: return "PREDATOR";
			case STANDARD_FACTION_PREY: return "PREY";
			case STANDARD_FACTION_TRAP: return "TRAP";
			case STANDARD_FACTION_ENDAR_SPIRE: return "ENDAR SPIRE";
			case STANDARD_FACTION_RANCOR: return "RANCOR";
			case STANDARD_FACTION_GIZKA_1: return "GIZKA 1";
			case STANDARD_FACTION_GIZKA_2: return "GIZKA 2";
			case 18: return "CZERKA"; // STANDARD_FACTION_CZERKA
			case 19: return "ZONE CONTROLLER"; // STANDARD_FACTION_ZONE_CONTROLLER
			case 20: return "SACRIFICE"; // STANDARD_FACTION_SACRIFICE
		}
	
	return "INVALID VALUE (" + IntToString(nFaction) + ")";
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
/*	CP_GetLocalBoolState()
	
	Returns a string that reports the state of the supplied local boolean on the
	target object. Effectively a modified version of GN_GetSpawnInCondition from
	k_inc_walkways.
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_GetLocalBoolState(object oNPC, int nIndex) {
	int nLocal = GetLocalBoolean(oNPC, nIndex);
	
	if (!GetIsObjectValid(oNPC))
		{
			return "ERROR, OBJECT INVALID";
		}
	
	if (nLocal > 0)
		{
			return CP_GetLocalBoolName(nIndex) + " = TRUE";
		}
		else
			{
				return CP_GetLocalBoolName(nIndex) + " = FALSE";
			}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetLocalBoolName()
	
	Returns a string for the name of the supplied local boolean flag.
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_GetLocalBoolName(int nIndex) {
	switch (nIndex)
		{
			case 0: return "SW_PLOT_BOOLEAN_01";
			case 1: return "SW_PLOT_BOOLEAN_02";
			case 2: return "SW_PLOT_BOOLEAN_03";
			case 3: return "SW_PLOT_BOOLEAN_04";
			case 4: return "SW_PLOT_BOOLEAN_05";
			case 5: return "SW_PLOT_BOOLEAN_06";
			case 6: return "SW_PLOT_BOOLEAN_07";
			case 7: return "SW_PLOT_BOOLEAN_08";
			case 8: return "SW_PLOT_BOOLEAN_09";
			case 9: return "SW_PLOT_BOOLEAN_10";
			case 10: return "SW_PLOT_HAS_TALKED_TO";
			case 11: return "SW_PLOT_COMPUTER_OPEN_DOORS";
			case 12: return "SW_PLOT_COMPUTER_USE_GAS";
			case 13: return "SW_PLOT_COMPUTER_DEACTIVATE_TURRETS";
			case 14: return "SW_PLOT_COMPUTER_DEACTIVATE_DROIDS";
			case 15: return "SW_PLOT_COMPUTER_MODIFY_DROID";
			case 16: return "SW_PLOT_REPAIR_WEAPONS";
			case 17: return "SW_PLOT_REPAIR_TARGETING_COMPUTER";
			case 18: return "SW_PLOT_REPAIR_SHIELDS";
			case 19: return "SW_PLOT_REPAIR_ACTIVATE_PATROL_ROUTE";
			case 20: return "SW_FLAG_EVENT_ON_PERCEPTION";
			case 21: return "SW_FLAG_EVENT_ON_ATTACKED";
			case 22: return "SW_FLAG_EVENT_ON_DAMAGED";
			case 23: return "SW_FLAG_EVENT_ON_FORCE_AFFECTED";
			case 24: return "SW_FLAG_EVENT_ON_DISTURBED";
			case 25: return "SW_FLAG_EVENT_ON_COMBAT_ROUND_END";
			case 26: return "SW_FLAG_EVENT_ON_DIALOGUE";
			case 27: return "SW_FLAG_EVENT_ON_DEATH";
			case 28: return "SW_FLAG_EVENT_ON_HEARTBEAT";
			case 29: return "SW_FLAG_AMBIENT_ANIMATIONS";
			case 30: return "SW_FLAG_AMBIENT_ANIMATIONS_MOBILE";
			case 34: return "SW_FLAG_WAYPOINT_WALK_ONCE";
			case 35: return "SW_FLAG_WAYPOINT_WALK_CIRCULAR";
			case 36: return "SW_FLAG_WAYPOINT_WALK_PATH";
			case 37: return "SW_FLAG_WAYPOINT_WALK_STOP";
			case 38: return "SW_FLAG_WAYPOINT_WALK_RANDOM";
			case 39: return "SW_FLAG_WAYPOINT_WALK_RUN";
			case 41: return "SW_FLAG_WAYPOINT_DIRECTION";
			case 42: return "SW_FLAG_WAYPOINT_DEACTIVATE";
			case 44: return "SW_FLAG_EVENT_ON_SPELL_CAST_AT";
			case 45: return "SW_FLAG_EVENT_ON_BLOCKED";
			case 46: return "SW_FLAG_WAYPOINT_WALK_STOP_LONG";
			case 47: return "SW_FLAG_WAYPOINT_WALK_STOP_RANDOM";
			case 48: return "SW_FLAG_ON_DIALOGUE_COMPUTER";
			case 59: return "SW_FLAG_TARGET_FRIEND";
			case 60: return "SW_FLAG_COMMONER_BEHAVIOR";
			case 61: return "SW_FLAG_SPECTATOR_STATE";
			case 62: return "SW_FLAG_AI_OFF";
			case 63: return "SW_CANDEROUS_COMBAT_REGEN";
			case 64: return "SW_FLAG_BOSS_AI";
			case 65: return "SW_FLAG_SHIELD_USED";
			case 66: return "SW_FLAG_EVENT_ON_DIALOGUE_END";
			case 67: return "SW_FLAG_RESISTANCES_APPLIED";
			case 68: return "SW_FLAG_EVENT_DIALOGUE_END";
			case 69: return "SW_FLAG_STATE_AGITATED";
			case 70: return "SW_FLAG_MALAK_AI_ON";
			case 71: return "SW_FLAG_DYNAMIC_COMBAT_ZONE";
			case 72: return "SW_FLAG_EVENT_ON_DIALOGUE_INTERRUPT";
		}
	
	return "UNKNOWN FLAG (" + IntToString(nIndex) + ")";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetStarMapState()
	
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
	
	if (!GetIsObjectValid(oNPC))
		{
			return "ERROR, OBJECT INVALID";
		}
	
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

//////////////////////////////////////////////////////////////////////////////////
/*	CP_FloatToString()
	
	Returns the input float as a trimmed string, since the use of FloatToString
	by itself introduces an unwanted carriage return. Credit to Star Admiral's
	Utility Armbands mod for the idea.
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_FloatToString(float fFloat) {
	string sFloat = FloatToString(fFloat, 6, 6);
	string sTrim = GetStringLeft(sFloat, GetStringLength(sFloat) - 1);
	
	return sTrim;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_LocationToString()
	
	Returns the input location as a string. Credit to Star Admiral's Utility
	Armbands mod for the idea.
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_LocationToString(location lLoc) {
	vector vLoc = GetPositionFromLocation(lLoc);
	float fFace = GetFacingFromLocation(lLoc);
	string sLoc = "Location(Vector(" + CP_FloatToString(vLoc.x) + ", " + CP_FloatToString(vLoc.y) + ", " + CP_FloatToString(vLoc.z) + "), " + CP_FloatToString(fFace) + ")";
	
	return sLoc;
}
