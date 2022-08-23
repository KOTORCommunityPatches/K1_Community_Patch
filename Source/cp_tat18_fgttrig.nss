//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for newgeneric002.utt in tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is the trigger OnEnter that starts the cutscene for either Calo Nord or
	Darth Bandon's ambush outside the Krayt Dragon cave on Tatooine. Due to the
	way the original script was set up, it was possible to send a single party
	member into the cave in solo mode to loot the holocron belonging to Bastila's
	father and then switch back to the other two outside without triggering the
	showdown scene. The entering object check has now been switched to prevent
	such a bypass working. Additionally, the name of the script has been changed
	from the unhelpfully named vanilla script ("tat_test").
	
	Issue #668: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/668
	
	DP 2022-08-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oEntering = GetEnteringObject();
	object oInvis1 = GetObjectByTag("tat_invis_talker", 0);
	object oInvis2 = GetObjectByTag("tat_invis_talker2", 0);
	int nCaloGlobal = GetGlobalBoolean("TAT_CALO_TRIGGER_SET");
	int nBandGlobal = GetGlobalBoolean("TAT_BANDON_TRIG_SET");
	int nCaloTriggered = GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_02);
	int nBandTriggered = GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_03);
	
	if (IsObjectPartyMember(oEntering) && nCaloGlobal && !nCaloTriggered)
		{
			SetGlobalBoolean("TAT_CALO_TRIGGER_SET", FALSE);
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_02, TRUE);
			
			AssignCommand(oInvis1, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
		else if (IsObjectPartyMember(oEntering) && nBandGlobal && !nBandTriggered)
			{
				SetGlobalBoolean("TAT_BANDON_TRIG_SET", FALSE);
				SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_03, TRUE);
				
				AssignCommand(oInvis2, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
			}
}
