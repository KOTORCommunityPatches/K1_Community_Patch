//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for kas22_dasol_01.utc in kas_m22aa (Kashyyyk Landing Pad).
	
	A custom OnUserDefine script for Matton that handles some functions during the
	scenes involving Eli being killed or running away.
	
	See also cp_kas22_eli_d, k_pkas_elileave.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118

	DP 2020-06-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 100) // Matton killed Eli
		{
			DelayCommand(2.0, ActionResumeConversation());
		}
	else if (nUser == 200) // Eli was allowed to run away
		{
			AssignCommand(oPC, SetFacingPoint(GetPosition(oMatton)));
			AssignCommand(oPM1, SetFacingPoint(GetPosition(oMatton)));
			AssignCommand(oPM2, SetFacingPoint(GetPosition(oMatton)));
			
			// Play an anim to force the facing and to prevent the player freezing post-conversation.
			AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
			AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
			AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
		}
	else if (nUser == 1001) //HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
	else if (nUser == 1011) // DIALOGUE END
		{
	
		}
	else if (nUser == 1100) // HOSTILE RETREAT
		{
			if (GetCommandable(OBJECT_SELF))
				{
					ClearAllActions();
					CancelCombat(OBJECT_SELF);
					ActionMoveToObject(GetNearestObjectByTag("wp_homebase"), TRUE, 3.0);
					ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
					SetCommandable(FALSE);
				}
		}
}
