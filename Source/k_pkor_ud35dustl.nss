//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefine for Dustil in korr_m35aa (Korriban Sith Academy).
	
	This is Dustil's OUD which causes Carth to say his "I'm sorry, Dustil. I did
	all I could, and I... failed you" bark if Dustil turns hostile and is killed.
	In some circumstances it wouldn't play, presumably because Carth was still
	considered in combat. A command for him to cancel combat first has been added.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-11-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_switch"

void main() {
	int int1 = GetUserDefinedEventNumber();
	if ((int1 == 1001)) {
	}
	else {
		if ((int1 == 1002)) {
		}
		else {
			if ((int1 == 1003)) {
			}
			else {
				if ((int1 == 1004)) {
				}
				else {
					if ((int1 == 1005)) {
					}
					else {
						if ((int1 == 1006)) {
						}
						else {
							if ((int1 == 1007)) {
								if (IsNPCPartyMember(NPC_CARTH))
									{
										object oPC = GetFirstPC();
										object oCarth = GetObjectByTag("carth", 0);
										
										CancelCombat(oCarth);
										AssignCommand(oCarth, ActionStartConversation(oPC, "kor35_carth2"));
									}
							}
							else {
								if ((int1 == 1008)) {
								}
								else {
									if ((int1 == 1009)) {
									}
									else {
										if ((int1 == 1010)) {
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
