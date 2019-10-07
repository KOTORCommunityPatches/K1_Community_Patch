//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_rodiantrig.utt in tar_m02aa (Taris Upper City South Apartments).
	
	This is the trigger OnEnter that starts the scene where the party is approached
	by the messenger from Canderous after winning the swoop race. It was tweaked to
	jump the party into better positions, since they were a bit scattered by default
	and that could lead to issues with the messenger being commanded to run	to the
	player in the DLG.
	
	See also k_ptar_msgcs0.
	
	Issue #247: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/247
	
	DP 2019-10-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	
	if (GetIsPC(oEntering) && GetGlobalBoolean("Tar_SwoopRace") && CP_HasNeverTalkedTo())
		{
			object oPC = GetFirstPC();
			object oMessenger = CreateObject(OBJECT_TYPE_CREATURE, "tar02_rodianmsg", GetLocation(GetWaypointByTag("tar02_wpmessenger")));
			location lPC = Location(Vector(94.404,132.467,0.0), 15.0);
			location lPM1 = Location(Vector(93.509,130.694,0.0), 15.0);
			location lPM2 = Location(Vector(92.421,132.37,0.0), 15.0);
			
			HoldWorldFadeInForDialog();
			
			NoClicksFor(1.5);
			
			SetPartyLeader(NPC_PLAYER);
			CP_DLGHerder(lPC, lPM1, lPM2);
			
			AssignCommand(oMessenger, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
}
