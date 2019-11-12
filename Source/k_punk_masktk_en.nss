//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for unk44_lockdoor.utd in unk_m44aa (Unknown World Temple Main Floor).
	
	This is the OnOpen script for the door to the Sith Master's chamber. It starts
	the cutscene of the Master destroying a training droid before attacking the
	party. Since this scene was able to be triggered prematurely, changes have
	been made to prevent the door opening until after the two Dark Jedi outside
	are dead. Additionally, the whole party is now herded, rather than just the
	player.
	
	See also cp_unk44_djd_dth, k_punk_master02, k_punk_master03.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2019-11-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oMaster = GetObjectByTag("darkjedi443");
	object oPC = GetFirstPC();
	location lPC = GetLocation(GetObjectByTag("mastwp", 0));
	location lPM1 = Location(Vector(77.185,70.14,0.436), 270.0);
	location lPM2 = Location(Vector(80.185,70.14,0.436), 270.0);
	
	if (GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_10))
		{
			NoClicksFor(1.0);
			
			SetGlobalFadeOut();
			
			SetPartyLeader(NPC_PLAYER);
			
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE));
			
			DelayCommand(0.3, AssignCommand(oMaster, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
