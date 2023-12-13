//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_k1

	Include script for K1 Community Patch		
																				*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"


// Hard-coded faction values that aren't declared in nwscript.nss
int STANDARD_FACTION_CZERKA              = 18;
int STANDARD_FACTION_ZONE_CONTROLLER     = 19;
int STANDARD_FACTION_SACRIFICE           = 20;

// Bitmask value including all valid KOTOR 1 inventory slots 
int INVENTORY_SLOT_ALL = 0x0003C7BB;


// Gets the expected tag of a party member based on their ID number.
string CP_NPCToTag(int nNPC);

// Gets the ID of a party member (NPC_*) from an object tag.
int CP_TagToNPC(string sTag);

// Has a creature clear all actions and then jump to a location.
void CP_PartyJump(object oPM, location lLoc);

// Has a creature clear all actions and then jump to an object.
void CP_PartyJumpObject(object oPM, object oJumpTo);

// Has a creature clear all actions and then walk or run to a location.
void CP_PartyMove(object oPM, location lLoc, int bRun = FALSE);

// Has a creature clear all actions and then walk or run to an object.
void CP_PartyMoveObject(object oPM, object oMoveTo, int bRun = FALSE);

// Jumps/walks/runs the entire party to the specified locations.
void CP_PartyHerder(location lPC, location lPM1, location lPM2, int bJump = TRUE, int bRun = FALSE);

// Alternative to GetPartyMemberByIndex that always returns party members in the same order.
object CP_GetPartyMember(int nIndex);

// Prepares party for a conversation.
void CP_DLGSetup(string sNPCTag);

// Alternative to CP_PartyHerder specifically designed for use with conversations.
void CP_DLGHerder(location lPC, location lPM1, location lPM2, int bJump = TRUE, int bRun = FALSE);

// Initiates dialogue with NPC with party herding options.
void CP_DLGInit(string sNPCTag, string sDLG = "", int bJump = FALSE, float fWait = 0.5, float fFade = 2.0);

// Makes the target creature equip the first weapon in their inventory.
void CP_EquipFirstWeapon(object oCreature, int bInstant = FALSE);

// Destroys all creatures in the area with the given tag.
void CP_DestroyCreatures(string sTag);

// One-shot check and set plot flag function for use with triggers.
int CP_HasNeverTriggered();

// One-shot check and set SW_PLOT_HAS_TALKED_TO plot flag function for use with NPCs.
int CP_HasNeverTalkedTo();

// Allows toggling creature AI on and off.
void CP_DisableAI(int bState);

// Disables the supplied creature's AI for the specified amount of time before toggling it back on.
void CP_ToggleAI(object oNPC, float fDelay = 1.0f);

// Modified version of the Messenger spawning function called in the various landing zone modules.
void CP_JumpMessenger();

// Duplicates an NPC's equipment in the desired slots into the player's inventory.
void CP_DupeEquipment(object oNPC, object oGive, int nEquipFlags = 0x0003C7BB);

// Commands an NPC to perform an uninterruptible move to a given location and face the associated direction.
void CP_ReturnToBase(location lLoc, int bRun = FALSE);

// Commands an NPC to face towards the specified target object.
void CP_FaceNPC(object oNPC, object oFace);

// Removes Burst of Speed / Knight Speed / Master Speed from the designated target object.
void CP_RemoveForceSpeed(object oTarget);

// Destroys the item with the specified tag possessed by the player/party.
void CP_DestroyPartyItem(string sTag);

// Gives all plot items possessed by the target object to the player.
void CP_GivePCPlotItems(object oTarget);

// An alternative to UT_ExitArea that can take an arbitrary location input rather than an exit waypoint.
void CP_ExitArea(location lExit, int bRun = FALSE);

// A wrapper for locking/unlocking orientation and head tracking in dialogue.
void CP_DLGLock(object oNPC, int bLock);

// Returns a float for the delay value to be used when playing the various star map animations.
float CP_StarMapAnimLength(int nMap);

// A streamlined version of UT_StarMap1VariableSet to removed unnecessary/unused debug cruft.
void CP_StarMapSetState();

// A replacement for, and merge of, UT_StarMap2PlayAnimation and UT_StarMap4RunStarMap that plays the star map animations.
void CP_StarMapPlayAnim();


//////////////////////////////////////////////////////////////////////////////////
/*	CP_NPCToTag()
	
	Gets the expected tag of a party member based on their ID number.
	
	- nNPC: NPC ID from party table (NPC_*)
	
	JC 2019-07-29																*/
//////////////////////////////////////////////////////////////////////////////////
string CP_NPCToTag(int nNPC) {
	switch( nNPC ) {
	case NPC_BASTILA: return "Bastila";
	case NPC_CANDEROUS: return "Cand";
	case NPC_CARTH: return "Carth";
	case NPC_HK_47: return "HK47";
	case NPC_JOLEE: return "Jolee";
	case NPC_JUHANI: return "Juhani";
	case NPC_MISSION: return "Mission";
	case NPC_T3_M4: return "T3M4";
	case NPC_ZAALBAR: return "Zaalbar";
	}
	return "";
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_TagToNPC()
	
	Gets the ID of a party member (NPC_*) from an object tag.
	
	- sTag: NPC ID from party table 
	
	JC 2022-12-28																*/
//////////////////////////////////////////////////////////////////////////////////
int CP_TagToNPC(string sTag) {
	if( sTag == "Bastila" )
		return NPC_BASTILA;
	if( sTag == "Cand" )
		return NPC_CANDEROUS;
	if( sTag == "Carth" )
		return NPC_CARTH;
	if( sTag == "HK47" )
		return NPC_HK_47;
	if( sTag == "Jolee" )
		return NPC_JOLEE;
	if( sTag == "Juhani" )
		return NPC_JUHANI;
	if( sTag == "Mission" )
		return NPC_MISSION;
	if( sTag == "T3M4" )
		return NPC_T3_M4;
	if( sTag == "Zaalbar" )
		return NPC_ZAALBAR;
	if( sTag == "end_trask" )
		return NPC_BASTILA;
	return 0x80000000;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyJump()
	
	Has a creature clear all actions and then jump to a location. Used for party
	herding.
	
	- oPM: Party member (or any creature)
	- lLoc: Location
	
	JC 2019-04-30																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_PartyJump(object oPM, location lLoc) {
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionJumpToLocation(lLoc));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyJumpObject()
	
	Companion function to CP_PartyJump that uses ActionMoveToObject instead of
	ActionMoveToLocation. Used for party herding.
	
	- oPM: Party member (or any creature)
	- oJumpTo: Object to jump to (typically a waypoint)
	
	DP 2019-11-03																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_PartyJumpObject(object oPM, object oJumpTo) {
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionJumpToObject(oJumpTo));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyMove()
	
	Has a creature clear all actions and then walk or run to a location. Used
	for party herding.
	
	- oPM: Party member (or any creature)
	- lLoc: Location
	- bRun: TRUE to run, FALSE to walk
	
	JC 2019-05-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_PartyMove(object oPM, location lLoc, int bRun = FALSE) {
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionMoveToLocation(lLoc, bRun));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyMoveObject()
	
	Companion function to CP_PartyMove that uses ActionMoveToObject instead of
	ActionMoveToLocation. Used for party herding.
	
	- oPM: Party member (or any creature)
	- oMoveTo: Object to move to (typically a waypoint)
	- bRun: TRUE to run, FALSE to walk
	
	DP 2019-10-31																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_PartyMoveObject(object oPM, object oMoveTo, int bRun = FALSE) {
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionMoveToObject(oMoveTo, bRun));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyHerder()
	
	Herds the party into specified locations.
	
	- lPC: Location for player character
	- lPM1: Location for 1st party member
	- lPM2: Location for 2nd party member
	- bJump: If TRUE, jump to locations; if FALSE, move walk or run to them
	- bRun: TRUE to run, FALSE to walk (does nothing if we're jumping)
	
	JC 2019-05-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_PartyHerder(location lPC, location lPM1, location lPM2, int bJump = TRUE, int bRun = FALSE) {
	object oPC = GetFirstPC();
	int i = 0;
	
	// Loop to get first party member
	object oPM1 = OBJECT_INVALID;
	while( !GetIsObjectValid(oPM1) && i <= 8 ) {
		oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
		if( !IsObjectPartyMember(oPM1) )
			oPM1 = OBJECT_INVALID;
		i++;
	}
	
	// Loop to get second party member
	object oPM2 = OBJECT_INVALID;
	while( !GetIsObjectValid(oPM2) && i <= 8 ) {
		oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
		if( !IsObjectPartyMember(oPM2) )
			oPM2 = OBJECT_INVALID;
		i++;
	}
	
	// Herd party into position
	if( bJump ) {
		CP_PartyJump(oPC, lPC);
		if( GetIsObjectValid(oPM1) )
			CP_PartyJump(oPM1, lPM1);
		if( GetIsObjectValid(oPM2) )
			CP_PartyJump(oPM2, lPM2);
	}
	else {
		CP_PartyMove(oPC, lPC, bRun);
		if( GetIsObjectValid(oPM1) )
			CP_PartyMove(oPM1, lPM1, bRun);
		if( GetIsObjectValid(oPM2) )
			CP_PartyMove(oPM2, lPM2, bRun);
	}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GetPartyMember()
	
	Returns a member of the party.
	
	This functions similarly to GetPartyMemberByIndex(), except it always uses
	the same party order and will work inside and outside of dialogues.
	
	- nIndex: Which party member (0, 1, or 2)
	  0 is always the Player Character.
	  1st and 2nd party members are always in order by ID (NPC_*) which for K1
	  is also alphabetical.
	
	Returns OBJECT_INVALID if there isn't a party member to return.
	
	JC 2019-05-04																*/
//////////////////////////////////////////////////////////////////////////////////
object CP_GetPartyMember(int nIndex) {
	object oPC = GetFirstPC();
	
	// 0 returns PC
	if( nIndex == 0 )
		return oPC;
		
	// Otherwise, loop
	int i = 0;
	
	// Loop to get first party member
	object oPM1 = OBJECT_INVALID;
	while( !GetIsObjectValid(oPM1) && i <= 8 ) {
		oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
		if( !IsObjectPartyMember(oPM1) )
			oPM1 = OBJECT_INVALID;
		i++;
	}
	// Return 1st party member if that's what we're looking for
	if( nIndex == 1 && GetIsObjectValid(oPM1) )
		return oPM1;

	// Loop to get second party member
	object oPM2 = OBJECT_INVALID;
	while( !GetIsObjectValid(oPM2) && i <= 8 ) {
		oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
		if( !IsObjectPartyMember(oPM2) )
			oPM2 = OBJECT_INVALID;
		i++;
	}
	// Return 2nd party member if that's what we're looking for
	if( nIndex == 2 && GetIsObjectValid(oPM2) )
		return oPM2;
	
	// If nothing worked, return invalid
	return OBJECT_INVALID;
}

//////////////////////////////////////////////////////////////////////////////////
/*	A note on dialogues:
	
	The next three functions initiate dialogue with an NPC. They should be run
	in sequence, like so:
		CP_DLGSetup(sNPCTag);
		CP_DLGHerder(lPC, lPM1, lPM2, bJump, bRun);
		CP_DLGInit(sNPCTag, sDLG, FALSE, fWait, fFade);
	for manual herding, or
		CP_DLGSetup(sNPCTag);
		CP_DLGInit(sNPCTag, sDLG, TRUE, fWait, fFade);
	to not bother and automatically jump to the NPC.
	
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGSetup()
	
	Heals the party up and cancels all player and NPC actions so they're ready
	for dialogue.
	
	Copied & repurposed from UT_NPC_InitConversation.
	
	- sNPCTag: Tag of NPC to talk to
	
	JC 2019-04-30																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DLGSetup(string sNPCTag) {
	object oNPC = GetObjectByTag(sNPCTag);
	object oPC = GetFirstPC();

	// Heal party
	UT_RestorePartyToOneHealth();

	// NPC must exist
	if( GetIsObjectValid(oNPC) == TRUE ) {
		if( oPC == GetPartyMemberByIndex(0) ) {
			// Player already in control
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oNPC, ClearAllActions());
			CancelCombat(oPC);
		}
		else {
			// Fade to black, switch player control to the main character
			SetGlobalFadeOut();
			SetPartyLeader(NPC_PLAYER);

			// Cancel all actions & player input
			NoClicksFor(0.7);
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oNPC, ClearAllActions());
			CancelCombat(oPC);
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGHerder()
	
	Executes CP_PartyHerder for dialogues. Timed to work with CP_DLGStart() and
	CP_DLGInit().
	
	Herds the party into specified locations.
	
	- lPC: Location for player character
	- lPM1: Location for 1st party member
	- lPM2: Location for 2nd party member
	- bJump: If TRUE, jump to locations; if FALSE, move walk or run to them
	- bRun: TRUE to run, FALSE to walk (does nothing if we're jumping)
	
	JC 2019-05-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DLGHerder(location lPC, location lPM1, location lPM2, int bJump = TRUE, int bRun = FALSE) {
	float fDelay;

	if( bJump )
		fDelay = 0.2;
	else
		fDelay = 0.55;
	
	AssignCommand(GetFirstPC(), DelayCommand(fDelay, CP_PartyHerder(lPC, lPM1, lPM2, bJump, bRun)));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGInit()
	
	Initiates dialogue with NPC. Allows for manual herding (run before this
	function) or it can jump the party to the NPC if specified.
	
	Copied & repurposed from UT_NPC_InitConversation.
	
	- sNPCTag: Tag of NPC to talk to
	- sDLG: Dialogue file to use (defaults to Conversation in the UTC file)
	- bJump: If TRUE, jumps the party to the NPC. Keep FALSE if you want to do
			 manual party herding or leave them where they are.
	- fWait: Time to wait before fading in. Note that anything less than 0.5
			 seconds may leave the setup visible.
	- fFade: Length of fade in
	
	JC 2019-05-02																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DLGInit(string sNPCTag, string sDLG = "", int bJump = FALSE, float fWait = 0.5, float fFade = 2.0) {
	object oNPC = GetObjectByTag(sNPCTag);
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	float fDelay;

	if( bJump )
		fDelay = 0.4;
	else
		fDelay = 0.6;

	// NPC must exist
	if( GetIsObjectValid(oNPC) ) {
		// If we didn't run our own jump, jump to NPC
		if( bJump ) {
			AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oNPC)));
			AssignCommand(oPM1, DelayCommand(0.5, JumpToObject(oPC)));
			AssignCommand(oPM2, DelayCommand(0.5, JumpToObject(oPC)));
		}

		// Party faces NPC
		AssignCommand(oPC, DelayCommand(fDelay, ActionDoCommand(SetFacingPoint(GetPosition(oNPC)))));
		AssignCommand(oPM1, DelayCommand(fDelay + 0.3, ActionDoCommand(SetFacingPoint(GetPosition(oNPC)))));
		AssignCommand(oPM2, DelayCommand(fDelay + 0.3, ActionDoCommand(SetFacingPoint(GetPosition(oNPC)))));

		// Fade in, begin conversation
		AssignCommand(oNPC, ActionDoCommand(SetGlobalFadeIn(fWait, fFade)));
		DelayCommand(0.5, AssignCommand(oNPC, ActionStartConversation(oPC, sDLG, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_EquipFirstWeapon()
	
	Makes the target creature equip the first weapon in their inventory.
	
	- oCreature: Target creature
	- bInstant: Whether to equip the item instantaneously, TRUE or FALSE
	
	JC 2019-07-29																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_EquipFirstWeapon(object oCreature, int bInstant = FALSE) {
	object oRWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oCreature);

	if( !GetIsObjectValid(oRWeapon) ) {
		object oItem = GetFirstItemInInventory(oCreature);
		object oEquip = OBJECT_INVALID;
		while( GetIsObjectValid(oItem) ) {
			switch( GetBaseItemType(oItem) ) {
			case BASE_ITEM_DOUBLE_BLADED_LIGHTSABER:
			case BASE_ITEM_DOUBLE_BLADED_SWORD:
			case BASE_ITEM_GAMMOREAN_BATTLEAXE:
			case BASE_ITEM_GHAFFI_STICK:
			case BASE_ITEM_LIGHTSABER:
			case BASE_ITEM_LONG_SWORD:
			case BASE_ITEM_QUARTER_STAFF:
			case BASE_ITEM_SHORT_LIGHTSABER:
			case BASE_ITEM_SHORT_SWORD:
			case BASE_ITEM_STUN_BATON:
			case BASE_ITEM_VIBRO_BLADE:
			case BASE_ITEM_VIBRO_DOUBLE_BLADE:
			case BASE_ITEM_VIBRO_SWORD:
			case BASE_ITEM_WOOKIE_WARBLADE:
			case BASE_ITEM_BLASTER_CARBINE:
			case BASE_ITEM_BLASTER_PISTOL:
			case BASE_ITEM_BLASTER_RIFLE:
			case BASE_ITEM_BOWCASTER:
			case BASE_ITEM_DISRUPTER_PISTOL:
			case BASE_ITEM_DISRUPTER_RIFLE:
			case BASE_ITEM_HEAVY_BLASTER:
			case BASE_ITEM_HEAVY_REPEATING_BLASTER:
			case BASE_ITEM_HOLD_OUT_BLASTER:
			case BASE_ITEM_ION_BLASTER:
			case BASE_ITEM_ION_RIFLE:
			case BASE_ITEM_REPEATING_BLASTER:
			case BASE_ITEM_SONIC_PISTOL:
			case BASE_ITEM_SONIC_RIFLE:
			case BASE_ITEM_SONIC_PISTOL:
				oEquip = oItem;
				oItem = OBJECT_INVALID;
				break;
			default:
				oItem = GetNextItemInInventory(oCreature);
				break;
			}
		}
		if( GetIsObjectValid(oEquip) )
			AssignCommand(oCreature, ActionEquipItem(oEquip, INVENTORY_SLOT_RIGHTWEAPON, bInstant));
	}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DestroyCreatures()
	
	Destroys all creatures in the area with the given tag.
	
	- sTag: Tag of creatures we want to destroy
	
	JC 2019-05-19																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DestroyCreatures(string sTag) {
	object oPC = GetFirstPC();
	int i = 1;
	object oCreature = GetNearestObjectByTag(sTag, oPC, 1);
	while( GetIsObjectValid(oCreature) ) {
		// Safety condition to prevent the destruction of a party member
		// (because that breaks the game)
		if( !IsObjectPartyMember(oCreature) ) {
			AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
			DestroyObject(oCreature, 0.0, FALSE);
		}
		oCreature = GetNearestObjectByTag(sTag, oPC, ++i);
	}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_HasNeverTriggered()
	
	Returns true is a trigger has not been fired yet. Intended for one shot
	triggers. Stolen from vanilla planet includes to cut down on the number
	of includes called in our custom scripts.
	
	Updated 2022-06-22 to switch the initial check from FALSE to not TRUE.
	
	DP 2019-09-30 / DP 2022-06-22												*/
//////////////////////////////////////////////////////////////////////////////////
int CP_HasNeverTriggered() {
	if (!UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			return TRUE;
		}
	return FALSE;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_HasNeverTalkedTo()
	
	Returns true if the creature/object has not been talked to yet. An all-in-one
	alternative to the UT_Set/GetTalkedToBooleanFlag functions that can work with
	the vanilla k_con_talkedto starting conditional script.
	
	Updated 2022-06-22 to switch the initial check from FALSE to not TRUE.
	
	DP 2019-10-03 / DP 2022-06-22												*/
//////////////////////////////////////////////////////////////////////////////////
int CP_HasNeverTalkedTo() {
	if (!UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO))
		{
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
			return TRUE;
		}
	return FALSE;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DisableAI()
	
	A function to allow toggling creature AI. Useful when you need to prevent
	them doing something like ambient animations, etc.
	
	The index (62) is SW_FLAG_AI_OFF from k_inc_generic. 
	
	FALSE - Default state. AI is active.
	TRUE - AI is disabled. Should be re-enabled before combat.
	
	DP 2019-10-03																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DisableAI(int bState) {
	SetLocalBoolean(OBJECT_SELF, 62, bState);
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_ToggleAI()
	
	Disables the supplied creature's AI for the specified amount of time before
	toggling it back on. Can be useful for herding NPCs at the beginning of a
	conversation.
	
	DP 2023-12-07																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_ToggleAI(object oNPC, float fDelay = 1.0f) {
	AssignCommand(oNPC, CP_DisableAI(TRUE));
	DelayCommand(fDelay, AssignCommand(oNPC, CP_DisableAI(FALSE)));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_JumpMessenger()
	
	Modified version of the Messenger spawning function called in the various
	landing zone modules. It checks for any Messenger that spawned but didn't
	properly fire its DLG. Sometimes they get stuck for some reason, like on
	Dantooine where they can hide in Aratech Mercantile. If any such example
	is found, it will attempt to force them to initiate their DLG. If none
	are present, it will proceed to the vanilla function (UT_SpawnMessenger).
	
	Updated 2020-11-29 to correct the function (again) to finally work as
	intended and properly initiate a scene with a stranded messenger without
	accidentally re-triggering an already properly completed conversation.
	
	See also k_messenger_plot.
	
	Issue #262: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/262
	
	DP 2019-09-30 / DP 2021-11-29												*/
//////////////////////////////////////////////////////////////////////////////////
void CP_JumpMessenger() {
	object oPC = GetFirstPC();
	object oDavin = GetObjectByTag("g_davink", 0);
	object oJagi = GetObjectByTag("g_jagi", 0);
	object oJordo = GetObjectByTag("g_jordo", 0);
	object oLena = GetObjectByTag("g_lena", 0);
	object oMalare = GetObjectByTag("g_malare", 0);
	object oXor = GetObjectByTag("g_xor", 0);
	object oZiagrom = GetObjectByTag("g_Ziagrom", 0);

	if( GetGlobalBoolean("K_MESS_JOLEE") && IsNPCPartyMember(NPC_JOLEE) && GetIsObjectValid(oDavin) && !GetIsInConversation(oDavin) && !GetLocalBoolean(OBJECT_SELF, 50) && !GetLocalBoolean(oDavin, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 50, TRUE);
		SetCommandable(TRUE, oDavin);
		AssignCommand(oDavin, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oDavin, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if( GetGlobalBoolean("K_MESS_CANDEROUS") && IsNPCPartyMember(NPC_CANDEROUS) && GetIsObjectValid(oJagi) && !GetIsInConversation(oJagi) && !GetLocalBoolean(OBJECT_SELF, 51) && !GetLocalBoolean(oJagi, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 51, TRUE);
		SetCommandable(TRUE, oJagi);
		AssignCommand(oJagi, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oJagi, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if( GetGlobalBoolean("K_MESS_CARTH") && IsNPCPartyMember(NPC_CARTH) && GetIsObjectValid(oJordo) && !GetIsInConversation(oJordo) && !GetLocalBoolean(OBJECT_SELF, 52) && !GetLocalBoolean(oJordo, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 52, TRUE);
		SetCommandable(TRUE, oJordo);
		AssignCommand(oJordo, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oJordo, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if( GetGlobalBoolean("K_MESS_MISSION") && IsNPCPartyMember(NPC_MISSION) && GetIsObjectValid(oLena) && !GetIsInConversation(oLena) && !GetLocalBoolean(OBJECT_SELF, 53) && !GetLocalBoolean(oLena, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 53, TRUE);
		SetCommandable(TRUE, oLena);
		AssignCommand(oLena, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oLena, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if( GetGlobalBoolean("K_MESS_BASTILA") && IsNPCPartyMember(NPC_BASTILA) && GetIsObjectValid(oMalare) && !GetIsInConversation(oMalare) && !GetLocalBoolean(OBJECT_SELF, 54) && !GetLocalBoolean(oMalare, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 54, TRUE);
		SetCommandable(TRUE, oMalare);
		AssignCommand(oMalare, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oMalare, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if( GetGlobalBoolean("K_MESS_JUHANI") && IsNPCPartyMember(NPC_JUHANI) && GetIsObjectValid(oXor) && !GetIsInConversation(oXor) && !GetLocalBoolean(OBJECT_SELF, 55) && !GetLocalBoolean(oXor, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 55, TRUE);
		SetCommandable(TRUE, oXor);
		AssignCommand(oXor, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oXor, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else if( GetGlobalBoolean("K_MESS_ZIAGROM") && GetIsObjectValid(oZiagrom) && !GetIsInConversation(oZiagrom) && !GetLocalBoolean(OBJECT_SELF, 56) && !GetLocalBoolean(oZiagrom, 50) ) {
		NoClicksFor(0.6);
		SetLocalBoolean(OBJECT_SELF, 56, TRUE);
		SetCommandable(TRUE, oZiagrom);
		AssignCommand(oZiagrom, ClearAllActions());
		DelayCommand(0.5, AssignCommand(oZiagrom, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
	else {
		UT_SpawnMessenger();
	}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DupeEquipment()
	
	Duplicates a copy of an NPC's equipped items into the target's inventory.
	Intended for use when an NPC is forcibly removed from the party temporarily
	or permanently in a cutscene, such as Bastila on the Leviathan.
	
	nMask is a bitmask representing which inventory slots will be duplicated.
	Bitwise operators can be used with the INVENTORY_SLOT_* constants to configure
	what type of items to duplicate.
	
	e.g. for armor and weapons only:
		nMask = (1 << INVENTORY_SLOT_BODY)
			  | (1 << INVENTORY_SLOT_RIGHTWEAPON)
			  | (1 << INVENTORY_SLOT_LEFTWEAPON);
	
	or, for all inventory slots except headgear:
		nMask = INVENTORY_SLOT_ALL ^ (1 << INVENTORY_SLOT_HEAD);
	
	DP 2021-11-03, JC 2022-12-28												*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DupeEquipment(object oNPC, object oGive, int nMask) {
	int i;
	for (i = 0; i < NUM_INVENTORY_SLOTS; ++i)
		{
			if (nMask & (1 << i))
				{
					object oItem = GetItemInSlot(i, oNPC);
					if (GetIsObjectValid(oItem))
						CreateItemOnObject(GetStringLowerCase(GetTag(oItem)), oNPC); 
				}
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_ReturnToBase()
	
	Forces an NPC to return to a specific location and face in that direction.
	Intended for having NPCs return to their starting point post-combat, or
	after a cutscene. Modified after TAR_PlotMoveObject in k_inc_tar, using a
	location instead of an object and adding in a facing command.
	
	DP 2021-11-29																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_ReturnToBase(location lLoc, int bRun = FALSE) {
	ClearAllActions();
	ActionMoveToLocation(lLoc, bRun);
	ActionDoCommand(SetFacing(GetFacingFromLocation(lLoc)));
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
	ActionDoCommand(SetCommandable(TRUE));
	SetCommandable(FALSE);
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_FaceNPC()
	
	Forces an NPC to face towards the specified target object. Then briefly
	plays an animation in order to force the reorientation and prevent the
	freezing that can sometimes happen in DLGs.
	
	DP 2021-12-12																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_FaceNPC(object oNPC, object oFace) {
	AssignCommand(oNPC, ActionDoCommand(SetFacingPoint(GetPosition(oFace))));
	DelayCommand(0.2, AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_RemoveForceSpeed()
	
	Checks the target for any of the three levels of Force Speed and removes
	them, if present. A targeted alternative to ClearAllEffects. Derived from
	Sp_RemoveSpecificEffect and Sp_RemoveSpellEffectsGeneral in k_inc_force.
	
	DP 2022-08-01																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_RemoveForceSpeed(object oTarget) {
	effect eSpeed  = GetFirstEffect(oTarget);
	
	while (GetIsEffectValid(eSpeed))
		{
			switch (GetEffectSpellId(eSpeed))
				{
					case FORCE_POWER_SPEED_BURST:
					case FORCE_POWER_KNIGHT_SPEED:
					case FORCE_POWER_SPEED_MASTERY:
						RemoveEffect(oTarget, eSpeed);
				}
			eSpeed = GetNextEffect(oTarget);
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DestroyPartyItem()
	
	Destroys the item with the specified tag possessed by the player/party.
	
	DP 2023-07-15																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DestroyPartyItem(string sTag) {
	DestroyObject(GetItemPossessedBy(GetFirstPC(), sTag));
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_GivePCPlotItems()
	
	Searches the target object's inventory and gives any plot items that it
	possesses to the player.
	
	DP 2023-10-13																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_GivePCPlotItems(object oTarget) {
	object oPC = GetFirstPC();
	object oItem;
	
	oItem = GetFirstItemInInventory(oTarget);
	
	while (GetIsObjectValid(oItem))
		{
			if (GetPlotFlag(oItem))
				{
					// Add a delay to prevent premature termination of the loop halfway through the inventory's contents.
					DelayCommand(0.2, GiveItem(oItem, oPC));
				}
			
			oItem = GetNextItemInInventory(oTarget);
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_ExitArea()
	
	An alternative to UT_ExitArea that can take an arbitrary location input rather
	than the predefined exit waypoints (K_EXIT or SW_EXIT). Commands an NPC to
	walk/run to the designated point and then destroy itself.
	
	DP 2023-10-22																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_ExitArea(location lExit, int bRun = FALSE) {
	ActionForceMoveToLocation(lExit, bRun, 10.0);
	ActionDoCommand(SetCommandable(TRUE));
	ActionDoCommand(DestroyObject(OBJECT_SELF));
	SetCommandable(FALSE);
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGLock()
	
	A wrapper for locking/unlocking orientation and head tracking in dialogue.
	
	DP 2023-12-08																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_DLGLock(object oNPC, int bLock) {
	SetLockOrientationInDialog(oNPC, bLock);
	SetLockHeadFollowInDialog(oNPC, bLock);
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_StarMapAnimLength()
	
	Returns a float for the delay value to be used when playing the various star
	map animations.
	
	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////
float CP_StarMapAnimLength(int nMap) {
	switch (nMap)
		{
			case 0: return 23.6;		// 3x ANIMATION_PLACEABLE_ANIMLOOP01
			case 10: return 23.7;		// 3x ANIMATION_PLACEABLE_ANIMLOOP02
			case 20: return 23.7;		// 3x ANIMATION_PLACEABLE_ANIMLOOP03
			case 30: return 23.7;		// 3x ANIMATION_PLACEABLE_ANIMLOOP04
			case 40: return 46.6667;	// 1x ANIMATION_PLACEABLE_ANIMLOOP06
		}
	return 7.9;
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_StarMapAnimLength()
	
	A streamlined version of UT_StarMap1VariableSet to removed unnecessary/unused
	debug cruft.
	
	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_StarMapSetState() {
	int nStar = GetGlobalNumber("K_STAR_MAP");
	int nBast = GetGlobalNumber("K_SWG_BASTILA");
	int nTalk = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);

	if (!nTalk)
		{
			nStar = nStar + 10;
			SetGlobalNumber("K_STAR_MAP", nStar);
			
			if (nStar == 30)
				{
					if(nBast < 3)
						{
							SetGlobalNumber("K_SWG_BASTILA", 99);
						}
				}
				else if(nStar == 40)
					{
						//The player should now be captured by the Leviathan
						SetGlobalNumber("K_CAPTURED_LEV", 5);
						
						if (nBast < 5)
							{
								SetGlobalNumber("K_SWG_BASTILA", 99);
							}
					}
					else if (nStar == 50)
						{
							//The player should now have access to the Unknown World.
							SetGlobalNumber("K_KOTOR_MASTER", 30);
						}
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
			UT_SetStarmapJournal();
		}
}

//////////////////////////////////////////////////////////////////////////////////
/*	CP_StarMapPlayAnim()
	
	A replacement for, and merge of, the vanilla UT_StarMap2PlayAnimation and
	UT_StarMap4RunStarMap functions that handles playing the appropriate star map
	animation for the given stage of the plot. Makes use of more precise timings
	to match the anim lengths and adds a custom deactivation anim for use with the
	final map anim (animloop 6), added in an edited version of the star map model.
	
	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////
void CP_StarMapPlayAnim() {
	int nStar = GetGlobalNumber("K_STAR_MAP");
	int nTalk = GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO);
	float fAnim = CP_StarMapAnimLength(nStar);
	float fDelay = 13.1 + fAnim; // Account for activation animation, since placeable loop anims don't stack like creature anims.
	
	if (!nTalk)
		{
			PlaySound("pl_starmap_open");
			ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
			ActionPlayAnimation(UT_StarMap3GetLoopAnim(nStar));
			
			if (nStar < 40)
				{
					DelayCommand(fDelay, PlaySound("pl_starmap_close"));
					DelayCommand(fDelay, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
				}
				else
					{
						DelayCommand(fDelay - 0.05, PlaySound("pl_starmap_close"));
						// An added On2Off variant for use with animloop 6. Requires custom star map placeable model.
						// Clip off the end of the animloop 6 anim slightly to prevent it starting a new loop.
						DelayCommand(fDelay - 0.05, ActionPlayAnimation(ANIMATION_PLACEABLE_ANIMLOOP08)); 
						// Force into an instant off state after the above has played once, since it's a loop not fire and forget.
						DelayCommand(fDelay + 10.35, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
					}
			
			DelayCommand(0.1, CP_StarMapSetState());
		}
}
