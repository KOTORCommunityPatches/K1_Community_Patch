//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_daysotalk.utt in tat_m17aa (Tatooine Anchorhead).
	
	This is the trigger OnEnter that fires after you leave the Czerka office in
	Anchorhead for the first time. You are accosted by a conservationist (named
	"Dayso Tiff" judging by the boolean resref) who argues against killing the
	Sand People. The vanilla scene leaves the party in the positions they start
	the module in, which tend to be a bit haphazard, so they are now jumped into
	a neater formation.
	
	Issue #309: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/309
	
	DP 2019-11-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oWP = GetWaypointByTag("tat17_daysospawn");
	location lSpawn = GetLocation(oWP);
	location lPC = Location(Vector(129.5,106.0,3.75), 180.0);
	location lPM1 = Location(Vector(131.25,107.5,3.75), 180.0);
	location lPM2 = Location(Vector(131.25,104.5,3.75), 180.0);
	
	if (GetIsPC(oEntering) && GetGlobalBoolean("tat_DaysoTiff"))
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(1.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oPM1, lPM1);
			CP_PartyJump(oPM2, lPM2);
			
			object oDuros = CreateObject(OBJECT_TYPE_CREATURE, "tat17_xconser_01", lSpawn);
			AssignCommand(oDuros, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
			
			DestroyObject(OBJECT_SELF);
		}
}
