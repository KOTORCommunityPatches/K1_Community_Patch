//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for cp_k33_murdtrig2.utt / k33b_trg_initmrd.utt in korr_m33aa
	(Korriban Dreshdae).
	
	This is the OnEnter script that fires the scene of the Sith student killing
	a Rodian and about to kill a Twi'lek in the middle of Dreshdae, once the
	player has spoken to the Academy door guard and found out they need to have a
	medallion in order to enter. While rapid transit is supposed to be disabled,
	if the player does manage to transit back to the Hawk and re-enter Dreshdae
	from the landing pad side they will run right past the NPCs before they
	hit the trigger for the conversation on the other side. The same thing applies
	to the scene with the four Sith thugs near the cantina. A new trigger has now
	been added on the landing bay side in order to trigger the scene when coming
	from that direction, although it shouldn't ever be needed (theoretically).
	Additionally, the party is jumped into place for the scene, since the vanilla
	trigger fires from the other side of the room.
	
	See also cp_k33_mrdfcvict, k33b_thug_init.
	
	Issue #283: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/283
	
	DP 2021-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_FaceNPC(object oNPC, object oFace) {
	AssignCommand(oNPC, SetFacingPoint(GetPosition(oFace)));
	DelayCommand(0.2, AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oEntering = GetEnteringObject();
	object oMurderer = GetObjectByTag("kor33b_murderer", 0);
	location lPC = Location(Vector(175.32,192.36,5.31), 215.50);
	location lPM1 = Location(Vector(176.59,195.11,5.31), 215.50);
	location lPM2 = Location(Vector(178.33,192.67,5.31), 215.50);
	location lPC_Rear = Location(Vector(164.76,183.74,5.31), 60.50);
	location lPM1_Rear = Location(Vector(164.77,180.71,5.31), 60.50);
	location lPM2_Rear = Location(Vector(162.16,182.18,5.31), 60.50);
	
	if (GetIsPC(oEntering) && GetIsObjectValid(oMurderer) && !UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01) && !GetIsInCombat(oEntering))
		{
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.1, 1.5);
			
			NoClicksFor(2.0);
			
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			AssignCommand(oMurderer, ClearAllActions());
			
			if (GetTag(OBJECT_SELF) == "cp_k33_murdtrig2")
				{
					// Tripped added trigger - coming from Ebon Hawk side. Destroy the vanilla trigger.
					DestroyObject(GetObjectByTag("k33b_trg_initmrd"));
					
					// Jump party.
					DelayCommand(0.25, CP_PartyHerder(lPC_Rear, lPM1_Rear, lPM2_Rear));
				}
				else
					{
						// Tripped vanilla trigger - coming from Academy side. Destroy the added trigger.
						DestroyObject(GetObjectByTag("cp_k33_murdtrig2"));
						
						// Jump party.
						DelayCommand(0.25, CP_PartyHerder(lPC, lPM1, lPM2));
					}
			
			// Make sure everyone is facing the right way.
			DelayCommand(0.75, CP_FaceNPC(oPC, oMurderer));
			DelayCommand(0.75, CP_FaceNPC(oPM1, oMurderer));
			DelayCommand(0.75, CP_FaceNPC(oPM2, oMurderer));
			
			DelayCommand(1.0, AssignCommand(oMurderer, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
