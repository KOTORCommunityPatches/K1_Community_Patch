////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_inc_k1

	Include script for K1 Community Patch		
	                                                                          */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_utility"


////////////////////////////////////////////////////////////////////////////////
/*	CP_NPCToTag()
	
	Gets the expected tag of a party member based on their ID number (NPC_*).
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
string CP_NPCToTag(int nNPC) {

string sTag = "";	
if( nNPC == 0 ) sTag = "Bastila";
if( nNPC == 1 ) sTag = "Cand";
if( nNPC == 2 ) sTag = "Carth";
if( nNPC == 3 ) sTag = "HK47";
if( nNPC == 4 ) sTag = "Jolee";
if( nNPC == 5 ) sTag = "Juhani";
if( nNPC == 6 ) sTag = "Mission";
if( nNPC == 7 ) sTag = "T3M4";
if( nNPC == 8 ) sTag = "Zaalbar";

return sTag;

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
	
	JC 2019-04-31                                                             */
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
	
	JC 2019-04-31                                                             */
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
if( nJump = TRUE ) {
	// Jump
	CP_PartyJump(oPC, lPC);
	if( GetIsObjectValid(oPM1) ) CP_PartyJump(oPM1, lPM1);
	if( GetIsObjectValid(oPM2) ) CP_PartyJump(oPM2, lPM2);
	}
else {
	// Walk/run
	CP_PartyMove(oPC, lPC);
	if( GetIsObjectValid(oPM1) ) CP_PartyMove(oPM1, lPM1);
	if( GetIsObjectValid(oPM2) ) CP_PartyMove(oPM2, lPM2);
	}

}


////////////////////////////////////////////////////////////////////////////////
/*	A note on dialogues:
	
	The next three functions initiate dialogue with an NPC. They should be run
	in sequence, like so:
		CP_DLGSetup(sNPCTag);
		CP_DLGHerder(lPC, lPM1, lPM2);
		CP_DLGInit(sNPCTag, sDLG, FALSE);
	for manual jump, or
		CP_DLGSetup(sNPCTag);
		CP_DLGInit(sNPCTag, sDLG, TRUE);
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
	
	JC 2019-04-31                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGHerder(location lPC, location lPM1, location lPM2, int nJump = TRUE, int nRun = FALSE) {

AssignCommand(GetFirstPC(), DelayCommand(0.2, CP_PartyHerder(lPC, lPM1, lPM2)));

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
	
	JC 2019-04-31                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGInit(string sNPCTag, string sDLG = "", int nJump = FALSE, float fWait = 0.5, float fFade = 2.0) {

object oNPC = GetObjectByTag(sNPCTag);
object oPC = GetFirstPC();
object oPM1 = GetPartyMemberByIndex(1);
object oPM2 = GetPartyMemberByIndex(2);
// NPC must exist
if (GetIsObjectValid(oNPC) == TRUE) {
	// If we didn't run our own jump, jump to NPC
	if( nJump == TRUE ) {
		AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oNPC)));
		AssignCommand(oPM1, DelayCommand(0.5, JumpToObject(oPC)));
		AssignCommand(oPM2, DelayCommand(0.5, JumpToObject(oPC)));
		}
	// Party faces NPC
	AssignCommand(oPC, DelayCommand(0.4, SetFacingPoint(GetPosition(oNPC))));
	AssignCommand(oPM1, DelayCommand(0.7, SetFacingPoint(GetPosition(oNPC))));
	AssignCommand(oPM2, DelayCommand(0.7, SetFacingPoint(GetPosition(oNPC))));
	// Fade in, begin conversation
	AssignCommand(oNPC, ActionDoCommand(SetGlobalFadeIn(fWait, fFade)));
	AssignCommand(oNPC, ActionStartConversation(oPC, sDLG, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
	}

}