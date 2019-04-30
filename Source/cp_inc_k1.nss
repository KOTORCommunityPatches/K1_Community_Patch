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
/*	CP_Jump()
	
	Has a creature clear all actions and then jump to a location. Used for party
	herding.
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_Jump(object oPM, location lLoc) {
 
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
	AssignCommand(oPM, ActionJumpToLocation(lLoc));	

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_PartyHerder()
	
	Herds the party into specified locations.
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_PartyHerder(location lPC, location lPM1, location lPM2) {

object oPC = GetFirstPC();
int i = 0;
// Loop to get first party member
object oPM1 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM1) && i <= 8 ) {
	oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
	i++;
}
// Loop to get second party member
object oPM2 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM2) && i <= 8 ) {
	oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
	i++;
}
// Move party into position
CP_Jump(oPC, lPC);
if( GetIsObjectValid(oPM1) ) CP_Jump(oPM1, lPM1);
if( GetIsObjectValid(oPM2) ) CP_Jump(oPM2, lPM2);

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
		AssignCommand(oPC, ClearAllActions());
		AssignCommand(oNPC, ClearAllActions());
		CancelCombat(oPC);
		}
	else {// Fade to black, switch player control to the main character
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
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGHerder(location lPC, location lPM1, location lPM2) {

AssignCommand(GetFirstPC(), DelayCommand(0.2, CP_PartyHerder(lPC, lPM1, lPM2)));

}


////////////////////////////////////////////////////////////////////////////////
/*	CP_DLGInit()
	
	Initiates dialogue with NPC. Allows for manual herding (run before this
	function) or it can jump the party to the NPC if specified.
	
	Copied & repurposed from UT_NPC_InitConversation.
	
	JC 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////
void CP_DLGInit(string sNPCTag, string sDLG = "", int nJump = TRUE) {

object oNPC = GetObjectByTag(sNPCTag);
object oPC = GetFirstPC();
// NPC must exist
if (GetIsObjectValid(oNPC) == TRUE) {
	// If we didn't run our own jump, jump to NPC
	if( nJump == TRUE ) {
		object oPM1 = GetPartyMemberByIndex(1);
		object oPM2 = GetPartyMemberByIndex(2);
		AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oNPC)));
		AssignCommand(oPM1, DelayCommand(0.5, JumpToObject(oPC)));
		AssignCommand(oPM2, DelayCommand(0.5, JumpToObject(oPC)));
		}
	// Fade in, begin conversation
	AssignCommand(oNPC, ActionDoCommand(SetGlobalFadeIn(0.5, 2.0)));
	AssignCommand(oNPC, ActionStartConversation(oPC, sDLG, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
	}

}