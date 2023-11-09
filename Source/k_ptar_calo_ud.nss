//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for tar08_calo082.utc in tar_m08aa (Taris Davik's Estate).
	
	This is the UserDefine script for Calo Nord during the showdown with him and
	Davik in the hangar. It has been tweaked to spawn the placeable ceiling stuff
	that falls on him during his last stand cutscene under a fadeout, since in the
	vanilla scene it can be seen being spawned at the start of the cutscene due to
	the upwards facing camera.
	
	See also k_ptar_runaway.
	
	Issue #368: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/368
	
	DP 2023-11-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
 
 void main() {
	
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
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
			if (GetCurrentHitPoints(OBJECT_SELF) < GetMaxHitPoints(OBJECT_SELF) / 2)
				{
					object oDavik = GetObjectByTag("davik082", 0);
					object oExp = GetNearestObjectByTag("tar08_wpexplosion", oDavik, 1);
					
					SignalEvent(oExp, EventUserDefined(2000));
					
					SetMinOneHP(oDavik, FALSE);
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oDavik);
				}
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
	else if (nUser == 2000)
		{
			object oPC = GetFirstPC();
			object oPM1 = CP_GetPartyMember(1);
			object oPM2 = CP_GetPartyMember(2);
			
			NoClicksFor(1.5);
			
			ClearAllActions();
			SurrenderToEnemies();
			CancelCombat(oPC);
			CancelCombat(oPM1);
			CancelCombat(oPM2);
			
			DelayCommand(0.2, SetGlobalFadeOut());
			DelayCommand(1.0, SetGlobalFadeIn(0.0, 0.5));
			
			DelayCommand(0.5, UT_CreateObject(OBJECT_TYPE_PLACEABLE, "rfl001", GetLocation(OBJECT_SELF)));
			
			DelayCommand(0.75, ActionStartConversation(oPC, "tar08_calo082", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
 		}
 }
