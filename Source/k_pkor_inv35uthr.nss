////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k35_uthar_ftlckr.utp in korr_m35aa (Korriban Sith Academy)
	
	This is the OnInvDisturbed script for the footlooker that spawns in Uthar's
	room as part of the Finding Dustil quest. The original script was lacking
	in the checks it did, since it didn't check that the PC had the datapad,
	or whether the conversation with Carth had already been triggered previously.
	Both are now included as part of changes to deal with Dustil being killed
	before the quest was resolved (in this instance, destroying the datapad if
	the Academy has turned hostile post-Tomb of Naga Sadow). Some additional
	provision for dealing with Carth being out of range has also been added,
	since pathfinding is so terrible and the quest state is now updated via that
	dialogue.
	
	Issue #4: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/4
	
	DP 2019-08-11                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("carth", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oLockerDPad = GetItemPossessedBy(OBJECT_SELF, "datapad");
	object oPCDatapad = GetItemPossessedBy(oPC, "datapad");
	
	if ((IsNPCPartyMember(NPC_CARTH)) && (!GetIsObjectValid(oLockerDPad)) && (GetIsObjectValid(oPCDatapad)) && (GetGlobalNumber("KOR_DANEL") == 3) && (!UT_GetTalkedToBooleanFlag(OBJECT_SELF)))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			if (GetDistanceBetween(oCarth, oPC) <= 5.0)
				{
					AssignCommand(oPC, ActionStartConversation(oCarth, "kor35_carth"));
				}
				else
					{
						SetGlobalFadeOut();
						SetGlobalFadeIn(0.5, 1.0);
						
						SetPartyLeader(NPC_PLAYER);
						SetSoloMode(FALSE);
						
						AssignCommand(oPC, ClearAllActions());
						AssignCommand(oPC, ActionJumpToObject(OBJECT_SELF));
						
						DelayCommand(0.25, AssignCommand(oPM1, ClearAllActions()));
						DelayCommand(0.25, AssignCommand(oPM1, ActionJumpToObject(oPC)));
						DelayCommand(0.5, AssignCommand(oPM1, SetFacingPoint(GetPosition(oPC))));
						
						DelayCommand(0.25, AssignCommand(oPM2, ClearAllActions()));
						DelayCommand(0.25, AssignCommand(oPM2, ActionJumpToObject(oPC)));
						DelayCommand(0.5, AssignCommand(oPM2, SetFacingPoint(GetPosition(oPC))));
						
						DelayCommand(0.5, AssignCommand(oPC, ActionStartConversation(oCarth, "kor35_carth")));
					}
		}
}
