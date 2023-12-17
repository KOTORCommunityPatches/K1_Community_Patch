//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for tat17_consertrig.utt in tat_m17ag (Tatooine Czerka Office).
	
	This is the trigger OnEnter that starts the scene with the Duros conservationist
	arguing with the Czerka protocol officer the first time the player enters the
	Czerka Office. It has been altered to jump the party into a better position to
	keep them out of the way when the Duros exits.
	
	Updated 2023-12-17 to add a missing check to prevent the trigger firing more
	than once.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2023-12-14 / DP 2023-12-17												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oDuros = GetObjectByTag("tat17_xconser_02", 0);
	location lPC = Location(Vector(4.13,3.69,1.39), 120.00);
	location lPM1 = Location(Vector(4.04,1.74,1.39), 100.00);
	location lPM2 = Location(Vector(5.80,2.69,1.39), 140.00);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(1.5);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			DelayCommand(1.0, AssignCommand(oDuros, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
