////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_k1

	Include script for K1 Community Patch		
	                                                                          */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_utility"


// Hard-coded faction values that aren't declared in nwscript.nss
int STANDARD_FACTION_CZERKA              = 18;
int STANDARD_FACTION_ZONE_CONTROLLER     = 19;
int STANDARD_FACTION_SACRIFICE           = 20;


// Gets the expected tag of a party member based on their ID number.
string CP_NPCToTag(int nNPC);

// Has a creature clear all actions and then jump to a location.
void CP_PartyJump(object oPM, location lLoc);

// Has a creature clear all actions and then jump to an object.
void CP_PartyJumpObject(object oPM, object oJumpTo);

// Has a creature clear all actions and then walk or run to a location.
void CP_PartyMove(object oPM, location lLoc, int nRun = FALSE);

// Has a creature clear all actions and then walk or run to an object.
void CP_PartyMoveObject(object oPM, object oMoveTo, int nRun = FALSE);

// Jumps/walks/runs the entire party to the specified locations.
void CP_PartyHerder(location lPC, location lPM1, location lPM2, int nJump = TRUE, int nRun = FALSE);

// Alternative to GetPartyMemberByIndex that always returns party members in the same order.
object CP_GetPartyMember(int nIndex);

// Prepares party for a conversation.
void CP_DLGSetup(string sNPCTag);

// Alternative to CP_PartyHerder specifically designed for use with conversations.
void CP_DLGHerder(location lPC, location lPM1, location lPM2, int nJump = TRUE, int nRun = FALSE);

// Initiates dialogue with NPC with party herding options.
void CP_DLGInit(string sNPCTag, string sDLG = "", int nJump = FALSE, float fWait = 0.5, float fFade = 2.0);

// Makes the target creature equip the first weapon in their inventory.
void CP_EquipFirstWeapon(object oCreature, int nInstant = FALSE);

// Destroys all creatures in the area with the given tag.
void CP_DestroyCreatures(string sTag);

// One-shot check and set plot flag function for use with triggers.
int CP_HasNeverTriggered();

// One-shot check and set SW_PLOT_HAS_TALKED_TO plot flag function for use with NPCs.
int CP_HasNeverTalkedTo();

// Allows toggling creature AI on and off.
void CP_DisableAI(int nState);

// Modified version of the Messenger spawning function called in the various landing zone modules.
void CP_JumpMessenger();

// Duplicates an NPC's equipment in the desired slots into the player's inventory.
void CP_DupeEquipment(object oNPC, object oGive, int nRWeap = TRUE, int nLWeap = TRUE, int nHead = TRUE, int nTorso = TRUE, int nGloves = TRUE, int nRShield = TRUE, int nLShield = TRUE, int nImplant = TRUE, int nBelt = TRUE);

// Commands an NPC to perform an uninterruptible move to a given location and face the associated direction.
void CP_ReturnToBase(location lLoc, int nRun = FALSE);

////////////////////////////////////////////////////////////////////////////////
/*	CP_NPCToTag()
	
	Gets the expected tag of a party member based on their ID number.
	
	- nNPC: NPC ID from party table (NPC_*)
	
	JC 2019-07-29                                                             */
////////////////////////////////////////////////////////////////////////////////
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


////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyJump()
	
	Has a creature clear all actions and then jump to a location. Used for party
	herding.
	
	- oPM: Party member (or any creature)
	- lLoc: Location
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_PartyJump(object oPM, location lLoc) {
 
AssignCommand(oPM, ClearAllActions());
//AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
AssignCommand(oPM, ActionJumpToLocation(lLoc));	

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyJumpObject()
	
	Companion function to CP_PartyJump that uses ActionMoveToObject instead of
	ActionMoveToLocation. Used for party herding.
	
	- oPM: Party member (or any creature)
	- oJumpTo: Object to jump to (typically a waypoint)
	
	DP 2019-11-03                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_PartyJumpObject(object oPM, object oJumpTo) {
 
	AssignCommand(oPM, ClearAllActions());
	//AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
	AssignCommand(oPM, ActionJumpToObject(oJumpTo));
}


////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyMove()
	
	Has a creature clear all actions and then walk or run to a location. Used
	for party herding.
	
	- oPM: Party member (or any creature)
	- lLoc: Location
	- nRun: TRUE to run, FALSE to walk
	
	JC 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_PartyMove(object oPM, location lLoc, int nRun = FALSE) {
 
AssignCommand(oPM, ClearAllActions());
//AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
AssignCommand(oPM, ActionMoveToLocation(lLoc, nRun));

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyMoveObject()
	
	Companion function to CP_PartyMove that uses ActionMoveToObject instead of
	ActionMoveToLocation. Used for party herding.
	
	- oPM: Party member (or any creature)
	- oMoveTo: Object to move to (typically a waypoint)
	- nRun: TRUE to run, FALSE to walk
	
	DP 2019-10-31                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_PartyMoveObject(object oPM, object oMoveTo, int nRun = FALSE) {
 
	AssignCommand(oPM, ClearAllActions());
	//AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
	AssignCommand(oPM, ActionMoveToObject(oMoveTo, nRun));
}


////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyHerder()
	
	Herds the party into specified locations.
	
	- lPC: Location for player character
	- lPM1: Location for 1st party member
	- lPM2: Location for 2nd party member
	- nJump: If TRUE, jump to locations; if FALSE, move walk or run to them
	- nRun: TRUE to run, FALSE to walk (does nothing if we're jumping)
	
	JC 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_PartyHerder(location lPC, location lPM1, location lPM2, int nJump = TRUE, int nRun = FALSE) {

object oPC = GetFirstPC();
int i = 0;
// Loop to get first party member
object oPM1 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM1) && i <= 8 ) {
	oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
	if( !IsObjectPartyMember(oPM1) ) oPM1 = OBJECT_INVALID;
	i++;
	}
// Loop to get second party member
object oPM2 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM2) && i <= 8 ) {
	oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
	if( !IsObjectPartyMember(oPM2) ) oPM2 = OBJECT_INVALID;
	i++;
	}
// Herd party into position
if( nJump == TRUE ) {
	// Jump
	CP_PartyJump(oPC, lPC);
	if( GetIsObjectValid(oPM1) ) CP_PartyJump(oPM1, lPM1);
	if( GetIsObjectValid(oPM2) ) CP_PartyJump(oPM2, lPM2);
	}
else {
	// Walk/run
	CP_PartyMove(oPC, lPC, nRun);
	if( GetIsObjectValid(oPM1) ) CP_PartyMove(oPM1, lPM1, nRun);
	if( GetIsObjectValid(oPM2) ) CP_PartyMove(oPM2, lPM2, nRun);
	}

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_GetPartyMember()
	
	Returns a member of the party.
	
	This functions similarly to GetPartyMemberByIndex(), except it always uses
	the same party order and will work inside and outside of dialogues.
	
	- nIndex: Which party member (0, 1, or 2)
	  0 is always the Player Character.
	  1st and 2nd party members are always in order by ID (NPC_*) which for K1
	  is also alphabetical.
	
	Returns OBJECT_INVALID if there isn't a party member to return.
	
	JC 2019-05-04                                                             */
////////////////////////////////////////////////////////////////////////////////
object CP_GetPartyMember(int nIndex) {

object oPC = GetFirstPC();
// 0 returns PC
if( nIndex == 0 ) return oPC;
// Otherwise, loop
int i = 0;
// Loop to get first party member
object oPM1 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM1) && i <= 8 ) {
	oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
	if( !IsObjectPartyMember(oPM1) ) oPM1 = OBJECT_INVALID;
	i++;
	}
// Return 1st party member if that's what we're looking for
if( nIndex == 1 && GetIsObjectValid(oPM1) ) return oPM1;
// Loop to get second party member
object oPM2 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM2) && i <= 8 ) {
	oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
	if( !IsObjectPartyMember(oPM2) ) oPM2 = OBJECT_INVALID;
	i++;
	}
// Return 2nd party member if that's what we're looking for
if( nIndex == 2 && GetIsObjectValid(oPM2) ) return oPM2;
// If nothing worked, return invalid
return OBJECT_INVALID;

}


////////////////////////////////////////////////////////////////////////////////
/*	A note on dialogues:
	
	The next three functions initiate dialogue with an NPC. They should be run
	in sequence, like so:
		CP_DLGSetup(sNPCTag);
		CP_DLGHerder(lPC, lPM1, lPM2, nJump, nRun);
		CP_DLGInit(sNPCTag, sDLG, FALSE, fWait, fFade);
	for manual herding, or
		CP_DLGSetup(sNPCTag);
		CP_DLGInit(sNPCTag, sDLG, TRUE, fWait, fFade);
	to not bother and automatically jump to the NPC.
	
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGSetup()
	
	Heals the party up and cancels all player and NPC actions so they're ready
	for dialogue.
	
	Copied & repurposed from UT_NPC_InitConversation.
	
	- sNPCTag: Tag of NPC to talk to
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGSetup(string sNPCTag) {

object oNPC = GetObjectByTag(sNPCTag);
object oPC = GetFirstPC();
// Heal party
UT_RestorePartyToOneHealth();
// NPC must exist
if (GetIsObjectValid(oNPC) == TRUE) {
	if (oPC == GetPartyMemberByIndex(0)) {
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


////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGHerder()
	
	Executes CP_PartyHerder for dialogues. Timed to work with CP_DLGStart() and
	CP_DLGInit().
	
	Herds the party into specified locations.
	
	- lPC: Location for player character
	- lPM1: Location for 1st party member
	- lPM2: Location for 2nd party member
	- nJump: If TRUE, jump to locations; if FALSE, move walk or run to them
	- nRun: TRUE to run, FALSE to walk (does nothing if we're jumping)
	
	JC 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGHerder(location lPC, location lPM1, location lPM2, int nJump = TRUE, int nRun = FALSE) {

float fDelay;
if( nJump == TRUE ) fDelay = 0.2;
else fDelay = 0.55;
AssignCommand(GetFirstPC(), DelayCommand(fDelay, CP_PartyHerder(lPC, lPM1, lPM2, nJump, nRun)));

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGInit()
	
	Initiates dialogue with NPC. Allows for manual herding (run before this
	function) or it can jump the party to the NPC if specified.
	
	Copied & repurposed from UT_NPC_InitConversation.
	
	- sNPCTag: Tag of NPC to talk to
	- sDLG: Dialogue file to use (defaults to Conversation in the UTC file)
	- nJump: If TRUE, jumps the party to the NPC. Keep FALSE if you want to do
			 manual party herding or leave them where they are.
	- fWait: Time to wait before fading in. Note that anything less than 0.5
			 seconds may leave the setup visible.
	- fFade: Length of fade in
	
	JC 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGInit(string sNPCTag, string sDLG = "", int nJump = FALSE, float fWait = 0.5, float fFade = 2.0) {

object oNPC = GetObjectByTag(sNPCTag);
object oPC = GetFirstPC();
object oPM1 = GetPartyMemberByIndex(1);
object oPM2 = GetPartyMemberByIndex(2);
float fDelay;
if( nJump == TRUE ) fDelay = 0.4;
else fDelay = 0.6;
// NPC must exist
if (GetIsObjectValid(oNPC) == TRUE) {
	// If we didn't run our own jump, jump to NPC
	if( nJump == TRUE ) {
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


////////////////////////////////////////////////////////////////////////////////
/*	CP_EquipFirstWeapon()
	
	Makes the target creature equip the first weapon in their inventory.
	
	- oCreature: Target creature
	- nInstant: Whether to equip the item instantaneously, TRUE or FALSE
	
	JC 2019-07-29                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_EquipFirstWeapon(object oCreature, int nInstant = FALSE) {

object oRWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oCreature);
if( !GetIsObjectValid(oRWeapon) ) {
	object oItem = GetFirstItemInInventory(oCreature);
	object oEquip = OBJECT_INVALID;
	while( GetIsObjectValid(oItem) ) {
		int nBaseItem = GetBaseItemType(oItem);
		switch( nBaseItem ) {
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
	if( GetIsObjectValid(oEquip) ) {
		AssignCommand(oCreature, ActionEquipItem(oEquip, INVENTORY_SLOT_RIGHTWEAPON, nInstant));
		}
	}

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_DestroyCreatures()
	
	Destroys all creatures in the area with the given tag.
	
	- sTag: Tag of creatures we want to destroy
	
	JC 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DestroyCreatures(string sTag) {

int i = 0;
for(;;) {
	i++;
	object oCreature = GetNearestObjectByTag(sTag, GetFirstPC(), i);
	if( GetIsObjectValid(oCreature) ){
		// Safety condition to prevent the destruction of a party member
		// (because that breaks the game)
		if( !IsObjectPartyMember(oCreature) ) {
			AssignCommand(oCreature, SetIsDestroyable(TRUE, FALSE, FALSE));
			DestroyObject(oCreature, 0.0, FALSE);
			}
		}
	else break;
	}

}

////////////////////////////////////////////////////////////////////////////////
/*	CP_HasNeverTriggered()
	
	Returns true is a trigger has not been fired yet. Intended for one shot
	triggers. Stolen from vanilla planet includes to cut down on the number
	of includes called in our custom scripts.
	
	DP 2019-09-30                                                             */
////////////////////////////////////////////////////////////////////////////////
int CP_HasNeverTriggered() {
	
	int bReturn;
	
	if (UT_GetPlotBooleanFlag(OBJECT_SELF,SW_PLOT_BOOLEAN_01) == FALSE)
		{
			bReturn = TRUE;
			UT_SetPlotBooleanFlag(OBJECT_SELF,SW_PLOT_BOOLEAN_01,TRUE);
		}
	
	return bReturn;
}


////////////////////////////////////////////////////////////////////////////////
/*	CP_HasNeverTalkedTo()
	
	Returns true if the creature/object has not been talked to yet. An all-in-one
	alternative to the UT_Set/GetTalkedToBooleanFlag functions that can work with
	the vanilla k_con_talkedto starting conditional script.
	
	DP 2019-10-03                                                             */
////////////////////////////////////////////////////////////////////////////////
int CP_HasNeverTalkedTo() {
	
	int bReturn;
	
	if (UT_GetPlotBooleanFlag(OBJECT_SELF,SW_PLOT_HAS_TALKED_TO) == FALSE)
		{
			bReturn = TRUE;
			UT_SetPlotBooleanFlag(OBJECT_SELF,SW_PLOT_HAS_TALKED_TO,TRUE);
		}
	
	return bReturn;
}

////////////////////////////////////////////////////////////////////////////////
/*	CP_DisableAI()
	
	A function to allow toggling creature AI. Useful when you need to prevent
	them doing something like ambient animations, etc.
	
	The index (62) is SW_FLAG_AI_OFF. 
	
	FALSE - Default state. AI is active.
	TRUE - AI is disabled. Should be re-enabled before combat.
	
	DP 2019-10-03                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DisableAI(int nState) {
	SetLocalBoolean(OBJECT_SELF, 62, nState);
}

////////////////////////////////////////////////////////////////////////////////
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
	
	DP 2019-09-30 / DP 2021-11-29                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_JumpMessenger() {
	
	object oPC = GetFirstPC();
	object oDavin = GetObjectByTag("g_davink", 0);
	object oJagi = GetObjectByTag("g_jagi", 0);
	object oJordo = GetObjectByTag("g_jordo", 0);
	object oLena = GetObjectByTag("g_lena", 0);
	object oMalare = GetObjectByTag("g_malare", 0);
	object oXor = GetObjectByTag("g_xor", 0);
	object oZiagrom = GetObjectByTag("g_Ziagrom", 0);
	
	if (GetGlobalBoolean("K_MESS_JOLEE") && IsNPCPartyMember(NPC_JOLEE) && GetIsObjectValid(oDavin) && !GetIsInConversation(oDavin) && !GetLocalBoolean(OBJECT_SELF, 50) && !GetLocalBoolean(oDavin, 50))
		{
			NoClicksFor(0.6);
			SetLocalBoolean(OBJECT_SELF, 50, TRUE);
			SetCommandable(TRUE, oDavin);
			AssignCommand(oDavin, ClearAllActions());
			DelayCommand(0.5, AssignCommand(oDavin, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
		else if (GetGlobalBoolean("K_MESS_CANDEROUS") && IsNPCPartyMember(NPC_CANDEROUS) && GetIsObjectValid(oJagi) && !GetIsInConversation(oJagi) && !GetLocalBoolean(OBJECT_SELF, 51) && !GetLocalBoolean(oJagi, 50))
			{
				NoClicksFor(0.6);
				SetLocalBoolean(OBJECT_SELF, 51, TRUE);
				SetCommandable(TRUE, oJagi);
				AssignCommand(oJagi, ClearAllActions());
				DelayCommand(0.5, AssignCommand(oJagi, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			}
			else if (GetGlobalBoolean("K_MESS_CARTH") && IsNPCPartyMember(NPC_CARTH) && GetIsObjectValid(oJordo) && !GetIsInConversation(oJordo) && !GetLocalBoolean(OBJECT_SELF, 52) && !GetLocalBoolean(oJordo, 50))
				{
					NoClicksFor(0.6);
					SetLocalBoolean(OBJECT_SELF, 52, TRUE);
					SetCommandable(TRUE, oJordo);
					AssignCommand(oJordo, ClearAllActions());
					DelayCommand(0.5, AssignCommand(oJordo, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
				else if (GetGlobalBoolean("K_MESS_MISSION") && IsNPCPartyMember(NPC_MISSION) && GetIsObjectValid(oLena) && !GetIsInConversation(oLena) && !GetLocalBoolean(OBJECT_SELF, 53) && !GetLocalBoolean(oLena, 50))
					{
						NoClicksFor(0.6);
						SetLocalBoolean(OBJECT_SELF, 53, TRUE);
						SetCommandable(TRUE, oLena);
						AssignCommand(oLena, ClearAllActions());
						DelayCommand(0.5, AssignCommand(oLena, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
					}
					else if (GetGlobalBoolean("K_MESS_BASTILA") && IsNPCPartyMember(NPC_BASTILA) && GetIsObjectValid(oMalare) && !GetIsInConversation(oMalare) && !GetLocalBoolean(OBJECT_SELF, 54) && !GetLocalBoolean(oMalare, 50))
						{
							NoClicksFor(0.6);
							SetLocalBoolean(OBJECT_SELF, 54, TRUE);
							SetCommandable(TRUE, oMalare);
							AssignCommand(oMalare, ClearAllActions());
							DelayCommand(0.5, AssignCommand(oMalare, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
						}
						else if (GetGlobalBoolean("K_MESS_JUHANI") && IsNPCPartyMember(NPC_JUHANI) && GetIsObjectValid(oXor) && !GetIsInConversation(oXor) && !GetLocalBoolean(OBJECT_SELF, 55) && !GetLocalBoolean(oXor, 50))
							{
								NoClicksFor(0.6);
								SetLocalBoolean(OBJECT_SELF, 55, TRUE);
								SetCommandable(TRUE, oXor);
								AssignCommand(oXor, ClearAllActions());
								DelayCommand(0.5, AssignCommand(oXor, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
							}
							else if (GetGlobalBoolean("K_MESS_ZIAGROM") && GetIsObjectValid(oZiagrom) && !GetIsInConversation(oZiagrom) && !GetLocalBoolean(OBJECT_SELF, 56) && !GetLocalBoolean(oZiagrom, 50))
								{
									NoClicksFor(0.6);
									SetLocalBoolean(OBJECT_SELF, 56, TRUE);
									SetCommandable(TRUE, oZiagrom);
									AssignCommand(oZiagrom, ClearAllActions());
									DelayCommand(0.5, AssignCommand(oZiagrom, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
								}
								else 
									{
										UT_SpawnMessenger();
									}
}

////////////////////////////////////////////////////////////////////////////////
/*	CP_DupeEquipment()
	
	Duplicates a copy of an NPC's equipped items into the target's inventory.
	Intended for use when an NPC is forcibly removed from the party temporarily
	or permanently in a cutscene, such as Bastila on the Leviathan.
	
	DP 2021-11-03                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DupeEquipment(object oNPC, object oGive, int nRWeap = TRUE, int nLWeap = TRUE, int nHead = TRUE, int nTorso = TRUE, int nGloves = TRUE, int nRShield = TRUE, int nLShield = TRUE, int nImplant = TRUE, int nBelt = TRUE) {
	
	object oNPC_RWeap = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oNPC);
	object oNPC_LWeap = GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oNPC);
	object oNPC_Head = GetItemInSlot(INVENTORY_SLOT_HEAD, oNPC);
	object oNPC_Torso = GetItemInSlot(INVENTORY_SLOT_BODY, oNPC);
	object oNPC_Gloves = GetItemInSlot(INVENTORY_SLOT_HANDS, oNPC);
	object oNPC_RShield = GetItemInSlot(INVENTORY_SLOT_RIGHTARM, oNPC);
	object oNPC_LShield = GetItemInSlot(INVENTORY_SLOT_LEFTARM, oNPC);
	object oNPC_Implant = GetItemInSlot(INVENTORY_SLOT_IMPLANT, oNPC);
	object oNPC_Belt = GetItemInSlot(INVENTORY_SLOT_BELT, oNPC);
	
	if (nRWeap && GetIsObjectValid(oNPC_RWeap))
		{
			CreateItemOnObject(GetTag(oNPC_RWeap), oGive, 1);
		}
	
	if (nLWeap && GetIsObjectValid(oNPC_LWeap))
		{
			CreateItemOnObject(GetTag(oNPC_LWeap), oGive, 1);
		}
	
	if (nHead && GetIsObjectValid(oNPC_Head))
		{
			CreateItemOnObject(GetTag(oNPC_Head), oGive, 1);
		}
	
	if (nTorso && GetIsObjectValid(oNPC_Torso))
		{
			CreateItemOnObject(GetTag(oNPC_Torso), oGive, 1);
		}
	
	if (nGloves && GetIsObjectValid(oNPC_Gloves))
		{
			CreateItemOnObject(GetTag(oNPC_Gloves), oGive, 1);
		}
	
	if (nRShield && GetIsObjectValid(oNPC_RShield))
		{
			CreateItemOnObject(GetTag(oNPC_RShield), oGive, 1);
		}
	
	if (nLShield && GetIsObjectValid(oNPC_LShield))
		{
			CreateItemOnObject(GetTag(oNPC_LShield), oGive, 1);
		}
	
	if (nImplant && GetIsObjectValid(oNPC_Implant))
		{
			CreateItemOnObject(GetTag(oNPC_Implant), oGive, 1);
		}
	
	if (nBelt && GetIsObjectValid(oNPC_Belt))
		{
			CreateItemOnObject(GetTag(oNPC_Belt), oGive, 1);
		}
}

////////////////////////////////////////////////////////////////////////////////
/*	CP_ReturnToBase()
	
	Forces an NPC to return to a specific location and face in that direction.
	Intended for having NPCs return to their starting point post-combat, or
	after a cutscene. Modified after TAR_PlotMoveObject in k_inc_tar, using a
	location instead of an object and adding in a facing command.
	
	DP 2021-11-29                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_ReturnToBase(location lLoc, int nRun = FALSE) {
	ClearAllActions();
	ActionMoveToLocation(lLoc, nRun);
	ActionDoCommand(SetFacing(GetFacingFromLocation(lLoc)));
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
	ActionDoCommand(SetCommandable(TRUE));
	SetCommandable(FALSE);
}
