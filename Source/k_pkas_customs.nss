//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas22_customtrig.utt in kas_m22aa (Kashyyyk Landing Pad).
	
	This is the OnEnter script for the trigger in front of the Ebon Hawk that
	starts the cutscene with Janos the Ithorian Czerka rep the first time the
	player lands on Kashyyyk (and subsequent times if they refuse to pay the
	landing fee). The party have now been herded, since only the player is
	jumped to the module entry point by default.
	
	Issue #632: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/632
	
	DP 2023-07-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_kas"
 
 void main() {
 	
 	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
 	object oEntering = GetEnteringObject();
 	object oJanos = GetObjectByTag("kas22_janos_01", 0);
	object oFace = GetObjectByTag("kas22_janostalk", 0);
	location lPC = Location(Vector(57.14,51.04,64.39), 11.25);
	location lPM1 = Location(Vector(55.34,51.70,64.39), 11.25);
	location lPM2 = Location(Vector(55.73,49.73,64.39), 11.25);
 	
 	if (!GetJanosPaidLocal(oJanos) && GetIsPC(oEntering) && GetIsObjectValid(oJanos))
 		{
 			HoldWorldFadeInForDialog();
			SetGlobalFadeOut();
			
			NoClicksFor(1.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oPM1, lPM1);
			CP_PartyJump(oPM2, lPM2);
			
			DelayCommand(0.1, CP_FaceNPC(oPC, oFace));
			DelayCommand(0.1, CP_FaceNPC(oPM1, oFace));
			DelayCommand(0.1, CP_FaceNPC(oPM2, oFace));
			
			DelayCommand(0.3, AssignCommand(oJanos, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
 		}
 }
