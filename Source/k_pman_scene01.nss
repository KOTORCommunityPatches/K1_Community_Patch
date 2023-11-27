//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnEnter for dan14ad_cutscene.utt in danm14ad (Dantooine Sandral Grounds).
	
	This trigger OnEnter starts the final cutscene of the Sandral-Matale Feud quest
	in the courtyard of the Sandral estate. Because of the way the scene is set up,
	invariably one of the party members blocks half the screen in the opening shot.
	The player is also standing right in the middle of proceedings, which is awkward
	when pursuing the DS "slaughter everyone" route. A party herder element has been
	added in to make things a bit neater.
	
	Updated 2019-05-19 to refactor using CP Include functions.
	
	Updated 2023-11-27 to further tweak the code and adjust the party jump locations.
	The party members have their AI temporarily disabled so that they obey orders
	and don't turn to face the player.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2019-02-19 / DP 2019-05-19 / DP 2023-11-27								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_CycleAI(object oNPC) {
	AssignCommand(oNPC, CP_DisableAI(TRUE));
	DelayCommand(5.0, AssignCommand(oNPC, CP_DisableAI(FALSE)));
}

void main() {

	// Fire the cutscene if the party has left the Sandral estate with Shen and Rahasia in tow.
	if (GetIsPC(GetEnteringObject()) && GetGlobalBoolean("DAN_LEAVE_DONE") && CP_HasNeverTriggered())
		{
			object oPC = GetFirstPC();
			object oInvis = GetObjectByTag("dan14_cutscene01", 0);
			location lPC = Location(Vector(333.00,151.00,56.16), 59.17);
			location lPM1 = Location(Vector(330.84,151.84,56.16), 28.54);
			location lPM2 = Location(Vector(330.84,153.45,56.16), 11.22);
			
			HoldWorldFadeInForDialog();
			
			CP_CycleAI(CP_GetPartyMember(1));
			CP_CycleAI(CP_GetPartyMember(2));
			
			DelayCommand(0.5, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(1.0, AssignCommand(oInvis, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
	}
}
