//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_daysotalk.utt in tat_m17aa (Tatooine Anchorhead).
	
	This is the trigger OnEnter that fires after you leave the Czerka office in
	Anchorhead for the first time. You are accosted by a conservationist (named
	"Dayso Tiff" judging by the boolean resref) who argues against killing the
	Sand People. The vanilla scene leaves the party in the positions they start
	the module in, which tend to be a bit haphazard, so they are now jumped into
	a neater formation.
	
	Updated 2023-12-20 to toggle the party member AI so that they obey commands.
	
	Issue #309: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/309
	
	DP 2019-11-04 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oDuros;
	location lSpawn = GetLocation(GetWaypointByTag("tat17_daysospawn"));
	location lPC = Location(Vector(129.50,106.00,3.75), 180.00);
	location lPM1 = Location(Vector(131.25,107.25,3.75), 195.00);
	location lPM2 = Location(Vector(131.25,104.75,3.75), 165.00);
	
	if (GetIsPC(oEntering) && GetGlobalBoolean("tat_DaysoTiff"))
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_ToggleAI(oPM1);
			CP_ToggleAI(oPM2);
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			oDuros = CreateObject(OBJECT_TYPE_CREATURE, "tat17_xconser_01", lSpawn);
			DelayCommand(0.3, AssignCommand(oDuros, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			
			// Extend the delay before destroying the script owner so that the party member AI has enough time to toggle back on (1 sec).
			DelayCommand(1.5, DestroyObject(OBJECT_SELF));
		}
}
