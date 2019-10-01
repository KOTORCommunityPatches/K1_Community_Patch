//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnUserDefine in unk_m41aa (Lehon Central Beach).
	
	This is the OUD for the Central Beach module. Its purpose is to trigger
	the cutscene of the two Duros once the initial battle with the Rakata on
	the first entrance to the beach ends. It has been tweaked to clean up the
	way the party is jumped, in conjunction with other edits to the scene.
	
	See also k_punk_ith01, k_punk_ith03, k_punk_ith05.
	
	Issue #285: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/285
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int RakCheck() {
	
	object oRakata1 = GetObjectByTag("unk41_blk1", 0);
	object oRakata2 = GetObjectByTag("unk41_blk2", 0);
	object oRakata3 = GetObjectByTag("unk41_blk3", 0);
	object oRakata4 = GetObjectByTag("unk41_blk4", 0);
	object oRakata5 = GetObjectByTag("unk41_blk5", 0);
	
	if (((((((!GetIsObjectValid(oRakata4)) ||
	GetIsDead(oRakata4)) && ((!GetIsObjectValid(oRakata5)) ||
	GetIsDead(oRakata5))) && ((!GetIsObjectValid(oRakata1)) ||
	GetIsDead(oRakata1))) && ((!GetIsObjectValid(oRakata2)) ||
	GetIsDead(oRakata2))) && ((!GetIsObjectValid(oRakata3)) ||
	GetIsDead(oRakata3))))
			{
				return TRUE;
			}
	
	return FALSE;
}

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 10)
		{
			if (RakCheck())
				{
					if (!GetGlobalBoolean("K_PUNK_BEACH_RESET"))
						{
							object oPC = GetFirstPC();
							location lPC = GetLocation(GetWaypointByTag("i1wp"));
							location lPM1 = Location(Vector(96.632,149.879,22.16), 130.0);
							location lPM2 = Location(Vector(97.724,151.351,22.379), 156.0);
							
							SetGlobalBoolean("K_PUNK_BEACH_RESET", TRUE);
							SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_08, TRUE);
							
							SetGlobalFadeOut();
							
							NoClicksFor(2.0);
							
							CreateObject(OBJECT_TYPE_CREATURE, "unk41_ithor01", GetLocation(GetObjectByTag("d1", 0)));
							CreateObject(OBJECT_TYPE_CREATURE, "unk41_ithor02", GetLocation(GetObjectByTag("d2", 0)));
							
							DelayCommand(0.25, CP_DLGSetup("invish"));
							
							DelayCommand(0.75, CP_PartyHerder(lPC, lPM1, lPM2));
							
							DelayCommand(1.0, AssignCommand(GetObjectByTag("invish", 0), ActionStartConversation(oPC, "unk41_ithor01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
						}
				}
		}
}
