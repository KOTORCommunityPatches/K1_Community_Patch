//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnEnter for k33_sha_initconv.utt in korr_m33aa (Korriban Dreshdae)
	
	This is the trigger OnEnter that starts the scene with Shaardan terrorising
	the student hopefuls in Korriban Dreshdae. Since the party would often not
	obey their jump orders, they are now jumped twice to try and forcefully
	wrangle them into position. They have also been moved further back and out
	of the way of the students so they can exit (assuming they survive) at the
	end of the scene without their pathfinding freaking out trying to get past
	the PC. The PC was originally positioned right in their path in order to
	keep them out of the frame of one of the static cameras.
	
	DP 2023-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			object oShaar = GetObjectByTag("kor33_shaardan", 0);
			location lPC = Location(Vector(139.58,154.12,7.98), -33.75);
			location lPM1 = Location(Vector(138.42,156.53,7.98), -33.75);
			location lPM2 = Location(Vector(136.78,154.08,7.98), -33.75);
			
			SetGlobalFadeOut();
			DelayCommand(1.2, SetGlobalFadeIn(0.0, 0.75));
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			DelayCommand(0.5, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(1.0, CP_FaceNPC(oPM1, oShaar));
			DelayCommand(1.0, CP_FaceNPC(oPM2, oShaar));
			
			DelayCommand(0.8, AssignCommand(oShaar, ClearAllActions()));
			DelayCommand(1.0, AssignCommand(oShaar, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
