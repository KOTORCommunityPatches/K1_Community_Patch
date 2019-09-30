////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_trig01.utt in danm13 (Dantooine Jedi Enclave).
	
	This is the OnEnter script for one of the triggers right outside the
	Hawk on Dantooine. It starts the initial cutscene with Bastila on landing,
	and the one with Carth following the first Council conversation. After
	that it spawns in the Messengers for the party member personal quests,
	when appropriate. For some reason, on occasion a Messenger may spawn but
	end up stuck in their spawn point inside Aratech Mercantile without ever
	triggering their conversation. This can lead to a situation where the
	player may never see the Messenger, if they don't enter the shop or
	aren't aware of the bug, and thus fail to advance the relevant quest.
	
	This edit to the OnEnter now first checks if each Messenger has already
	spawned and if they still present, then tries to force them to initiate
	their conversation. If none of them are present then it proceeds to the
	vanilla check for spawning new ones (refer to CP_JumpMessenger() in
	cp_inc_k1). This is an extremely difficult bug to test, since the root
	cause of it is undetermined, however it does appear to resolve the one
	instance that we have a working example of, Lena.
	
	Issue #262: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/262
	
	DP 2019-09-30                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	
	if (GetIsPC(oEntering))
		{
			if (!UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01))
				{
					object oBast = GetObjectByTag("bastila", 0);
					
					RemovePartyMember(NPC_BASTILA);
					RemovePartyMember(NPC_CARTH);
					SetGlobalNumber("DAN_BASTILA_ZONE", 10);
					AddJournalQuestEntry("k_ebonhawk", 1);
					AssignCommand(oBast, ActionStartConversation(oEntering, "bastila", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
					UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
				}
				else if (!UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_02) && GetGlobalNumber("DAN_JEDI_PLOT") == 1)
					{
						object oCarth = GetObjectByTag("carth", 0);
						
						RemovePartyMember(NPC_CARTH);
						SetGlobalNumber("DAN_CARTH_ZONE", 4);
						AssignCommand(oCarth, ActionStartConversation(oEntering, "carth", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
						UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_02, TRUE);
					}
					else
						{
							CP_JumpMessenger();
						}
		}
}
