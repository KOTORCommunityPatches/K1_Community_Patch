//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for cp_k33_thugtrig2.utt / k33b_trg_initthg.utt in korr_m33aa
	(Korriban Dreshdae).
	
	This is the OnEnter script that fires the scene of the four Sith thugs up the
	hallway from the cantina in Dreshdae, once the player has spoken to the Academy
	door guard and found out they need to have a medallion in order to enter. While
	rapid transit is supposed to be disabled, if the player does manage to transit
	back to the Hawk and re-enter Dreshdae from the landing pad side they will run
	right past the NPCs before they	hit the trigger for the conversation on the
	other side. The same thing applies to the scene with the Sith murdering a couple
	of mooks in the middle of Dreshdae. A new trigger has now been added on the
	landing bay side in order to trigger the scene when coming from that direction,
	although it shouldn't ever be needed (theoretically). Additionally, the thugs
	now have their AI turned off to stop them playing their ambient animations and
	constantly refacing during the scene, and the party is also jumped into position.
	
	See also k33b_murder_init, k33b_thug_fight.
	
	Issue #282: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/283
	
	DP 2021-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_SwitchOff(object oNPC) {
	AssignCommand(oNPC, ClearAllActions());
	AssignCommand(oNPC, CP_DisableAI(TRUE));
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oEntering = GetEnteringObject();
	object oLeader = GetObjectByTag("k33b_sththuglead", 0);
	object oThug01 = GetObjectByTag("k33b_siththug1", 0);
	object oThug02 = GetObjectByTag("k33b_siththug2", 0);
	object oThug03 = GetObjectByTag("k33b_siththug3", 0);
	object oDroid = GetObjectByTag("kor33a_protocol", 0);
	object oCommF = GetObjectByTag("korr_citizenfwlk", 0);
	object oCommM = GetObjectByTag("korr_citizenmwlk", 0);
	location lPC = Location(Vector(197.51,188.73,5.31), 150.50);
	location lPM1 = Location(Vector(200.54,188.73,5.31), 150.50);
	location lPM2 = Location(Vector(199.06,186.12,5.31), 150.50);
	location lPC_Rear = Location(Vector(187.91,194.35,5.31), -29.50);
	location lPM1_Rear = Location(Vector(184.88,194.34,5.31), -29.50);
	location lPM2_Rear = Location(Vector(186.36,196.95,5.31), -29.50);
	location lLeader_Rear = Location(Vector(190.67,192.82,5.31), 150.50);
	
	if (GetIsPC(oEntering) && GetIsObjectValid(oLeader) && !UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
		{
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.1, 1.5);
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			// Stop waypoint walking NPCs from patrolling.
			AssignCommand(oDroid, ClearAllActions());
			AssignCommand(oCommF, ClearAllActions());
			AssignCommand(oCommM, ClearAllActions());
			
			// Stop the thugs from playing their ambient animations.
			CP_SwitchOff(oLeader);
			CP_SwitchOff(oThug01);
			CP_SwitchOff(oThug02);
			CP_SwitchOff(oThug03);
			
			if (GetTag(OBJECT_SELF) == "cp_k33_thugtrig2")
				{
					// Tripped added trigger - coming from Ebon Hawk side. Destroy the vanilla trigger.
					DestroyObject(GetObjectByTag("k33b_trg_initthg"));
					
					// Jump party and the thug leader, since otherwise he'll be behind the others.
					DelayCommand(0.25, CP_PartyHerder(lPC_Rear, lPM1_Rear, lPM2_Rear));
					DelayCommand(0.25, CP_PartyJump(oLeader, lLeader_Rear));
				}
				else
					{
						// Tripped vanilla trigger - coming from Academy side. Destroy the added trigger.
						DestroyObject(GetObjectByTag("cp_k33_thugtrig2"));
						
						// Jump party.
						DelayCommand(0.25, CP_PartyHerder(lPC, lPM1, lPM2));
					}
			
			// Make sure everyone is facing the right way.
			DelayCommand(0.75, CP_FaceNPC(oLeader, oPC));
			DelayCommand(0.75, CP_FaceNPC(oThug01, oPC));
			DelayCommand(0.75, CP_FaceNPC(oThug02, oPC));
			DelayCommand(0.75, CP_FaceNPC(oThug03, oPC));
			DelayCommand(0.75, CP_FaceNPC(oPC, oLeader));
			DelayCommand(0.75, CP_FaceNPC(oPM1, oLeader));
			DelayCommand(0.75, CP_FaceNPC(oPM2, oLeader));
			
			DelayCommand(1.0, AssignCommand(oLeader, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
