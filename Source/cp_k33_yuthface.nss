////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_yuthura.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script fires just prior to the "slave" interjections in order to
	force them to face Yuthura, since by default they tend to face the player
	instead.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-07-15                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oYuth = GetObjectByTag("kor33_yuthura");
	object oBastila = GetObjectByTag("Bastila");
	object oJolee = GetObjectByTag("Jolee");
	object oJuhani = GetObjectByTag("Juhani");
	object oHK = GetObjectByTag("HK47");

	if(IsNPCPartyMember(NPC_BASTILA))
		{
			AssignCommand(oBastila, SetFacingPoint(GetPosition(oYuth)));
		}
	
	if(IsNPCPartyMember(NPC_JOLEE))
		{
			AssignCommand(oJolee, SetFacingPoint(GetPosition(oYuth)));
		}
	
	if(IsNPCPartyMember(NPC_JUHANI))
		{
			AssignCommand(oJuhani, SetFacingPoint(GetPosition(oYuth)));
		}
	
	if(IsNPCPartyMember(NPC_HK_47))
		{
			AssignCommand(oHK, SetFacingPoint(GetPosition(oYuth)));
		}
}
