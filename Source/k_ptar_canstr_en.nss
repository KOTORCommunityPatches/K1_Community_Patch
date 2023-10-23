//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for tar04_canstr.utt in tar_m04aa (Taris Undercity).
	
	This is the trigger OnEnter that starts the cutscene showing Canderous and
	his band of merry men returning from looting the crashed escape pods in the
	Taris Undercity. It has been altered to jump the party into a better position
	and start the scene under a fadeout so that there's a nicer introduction of
	Canderous and friends walking. It also spawns an invisible placeable that is
	used as a listener for the mook's line about hearing Rakghouls so that he
	faces in the right direction.
	
	See also k_ptar_candatk, k_ptar_cander03, k_ptar_cander04.
	
	Issue #235: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/235
	
	DP 2023-10-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oCand = GetObjectByTag("canderous043");
	location lInvis = GetLocation(GetObjectByTag("tar04_ghoulsp04"));
	location lPC = Location(Vector(201.69,247.81,3.00), 198.06);
	location lPM1 = Location(Vector(204.00,247.25,3.00), 198.06);
	location lPM2 = Location(Vector(203.23,249.63,3.00), 198.06);
	
	
	if (IsObjectPartyMember(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			NoClicksFor(5.0);
			
			SetGlobalFadeOut();
			DelayCommand(2.0, SetGlobalFadeIn(0.0, 1.5));
			
			CancelCombat(oEntering);
			
			SetPartyLeader(NPC_PLAYER);
			
			UT_CreateObject(OBJECT_TYPE_PLACEABLE, "cp_tar04_canrak", lInvis);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			DelayCommand(0.2, AssignCommand(oCand, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
