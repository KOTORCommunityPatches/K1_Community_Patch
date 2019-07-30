////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_k1

	Include script for K1 Community Patch		
	                                                                          */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_utility"


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
AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
AssignCommand(oPM, ActionJumpToLocation(lLoc));	

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
AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
AssignCommand(oPM, ActionMoveToLocation(lLoc, nRun));

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