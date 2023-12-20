//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas_zaalbartrig.utt in kas_m22aa (Kashyyyk Landing Pad).
	
	This is the trigger OnEnter for the scene at the start of the landing pad
	with Zaalbar when entering the landing pad for the first time. The vanilla
	scene was assigned to an invisible placeable, so that has been switched to
	Zaalbar to prevent looking at the ground. Additionally, only Zaalbar and the
	player were jumped, so now any second party member is jumped into position
	as well.
	
	See also k_pkas_zaaldone1.
	
	Issue #513: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/513
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
 	object oZaal = GetObjectByTag("Zaalbar", 0);
	location lPC = Location(Vector(104.51,57.77,62.88), 204.98);
	location lPM1 = Location(Vector(104.13,56.07,62.88), 114.98);
	location lPM2 = Location(Vector(102.64,56.96,62.88), 24.98);
 	
 	if (GetIsPC(oEntering))
 		{
 			if (!GetGlobalBoolean("kas_TalkChuundar") && !UT_GetPlotBooleanFlag(GetArea(OBJECT_SELF), SW_PLOT_BOOLEAN_01) && IsNPCPartyMember(NPC_ZAALBAR))
				{
					SetGlobalFadeOut();
					
					NoClicksFor(1.5);
					
					SetPartyLeader(NPC_PLAYER);
					
					CP_ToggleAI(oPM1);
					CP_ToggleAI(oPM2);
					DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
					
					// Reface the PC and Zaalbar just in case Zaalbar is the only party member and thus ends up in the PM1 position.
					DelayCommand(0.5, CP_FaceNPC(oZaal, oPC));
					DelayCommand(0.5, CP_FaceNPC(oPC, oZaal));
					
					DelayCommand(1.1, AssignCommand(oZaal, ActionStartConversation(oPC, "22aa_zaalb01_01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
				else
					{
						DestroyObject(OBJECT_SELF);
					}
 		}
}
