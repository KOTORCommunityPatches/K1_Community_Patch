//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for kas25_hurt_01.utc in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This is Grrrwahrr's OUD. It has been modified from the original to walk him
	back to his spawn point once the attacking Mandos are defeated rather than
	initiate a conversation with the player immediately, as the vanilla script
	did. This is done in conjunction with a party jump on the first node of the
	DLG.
	
	See also cp_kas25_jumppty.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-12-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void CP_ClearNPC(object oNPC) {
	CancelCombat(oNPC);
	AssignCommand(oNPC, ClearAllEffects());
	AssignCommand(oNPC, ClearAllActions());
}

void CP_WookHome() {
	object oPC = GetFirstPC();
	location lHome = GetLocation(GetWaypointByTag("kas25_wp_hurthome"));
	CancelCombat(OBJECT_SELF);
	ClearAllActions();
	if (GetDistanceBetweenLocations(GetLocation(OBJECT_SELF), lHome) > 1.5)
		{
			ActionMoveToLocation(lHome);
			ActionDoCommand(SetFacing(-33.75));
			ActionDoCommand(SetGlobalFadeOut());
			ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
			ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE);
			SetCommandable(FALSE, OBJECT_SELF);
		}
		else
			{
				SetGlobalFadeOut();
				ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE);
			}
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oMando01 = GetObjectByTag("kas25_mandalor05", 0);
	object oMando02 = GetObjectByTag("kas25_mandalor06", 0);
	object oMando03 = GetObjectByTag("kas25_mandalor07", 0);
	object oRWeap = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{
			if (!UT_GetTalkedToBooleanFlag(OBJECT_SELF) && !GetPlotFlag() && !GetIsObjectValid(oMando01) && !GetIsObjectValid(oMando02) && !GetIsObjectValid(oMando03) && !GetIsInConversation(OBJECT_SELF))
				{
					NoClicksFor(2.0);
					
					ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
					DestroyObject(oRWeap);
					CP_WookHome();
					
					CP_ClearNPC(oPC);
					CP_ClearNPC(oPM1);
					CP_ClearNPC(oPM2);
				}
				
			if (GetCurrentHitPoints(OBJECT_SELF) < FloatToInt(GetMaxHitPoints(OBJECT_SELF) / 2.0) && !GetIsInCombat(OBJECT_SELF) && !GetIsInConversation(OBJECT_SELF))
				{
					if (GetIsObjectValid(oRWeap))
						{
							DestroyObject(oRWeap);
						}
					
					PlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 6.0);
				}
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
	else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase("wp_homebase");
		}
}
