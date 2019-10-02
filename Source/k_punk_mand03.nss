//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_ambush.dlg in unk_m41ad (Lehon Temple Exterior).
	
	This script is fired on the opening node of the ambush DLG. It moves the party
	towards the stone pillar. Or at least that was the intention. In practice the
	party invariably had pathing issues and only the player did as they were told.
	That usually resulted in the Mandos that spawn on the next node spawning in
	right on top of one or both companions, causing them to freak out and reposition.
	Since the party is now jumped by the trigger, they have a clear route through to
	new destinations that gets them all moving and keeps them out of the way of the
	subsequently spawning Mandos.
	
	See also cp_unk41_mandhos, k_punk_mand02.
	
	Issue #286: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/286
	
	DP 2019-10-02																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oPillar = GetObjectByTag("ambush01", 0);
	location lPC = Location(Vector(272.522,83.268,36.153), -55.0);
	location lPM1 = Location(Vector(269.382,84.416,36.078), -32.0);
	location lPM2 = Location(Vector(272.5,86.593,36.395), -74.0);
	
	ActionPauseConversation();
	
	CP_PartyMove(oPC, lPC);
	DelayCommand(0.5, CP_PartyMove(oPM1, lPM1));
	DelayCommand(0.3, CP_PartyMove(oPM2, lPM2));
	
	
	DelayCommand(0.7, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oPillar)))));
	DelayCommand(0.5, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oPillar)))));
	
	DelayCommand(2.5, ActionResumeConversation());
}
