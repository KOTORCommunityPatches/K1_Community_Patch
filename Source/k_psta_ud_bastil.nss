//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for sta_bastila.utc/sta_bastila001.utc in sta_m45ac (Star Forge Deck 3).
	
	This is the UserDefine script for Bastila in the Light Side route of the game
	where she is confronted on Deck 3 of the Star Forge. In the vanilla version of
	the script, the final conversation after defeating her is initiated between an
	invisible placeable (named Bastila) and the stunt Bastila NPC. This results in
	the conversation log displaying it as Bastila talking to herself. The use of a
	placeable is required because it is possible for the player to execute Bastila
	during this scene, which would cause a break if she was the DLG owner. This has
	been changed to the placeable initiating the DLG with the player, which should
	fix the incorrect reply labels in the log.
	
	Issue #420: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/420
	
	DP 2020-09-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_endgame"

void CombatEnd(object oNPC) {
	object oPC = GetFirstPC();
	CancelCombat(oNPC);
	CancelCombat(oPC);
}

void CombatSurrender(object oNPC) {
	DelayCommand(0.3, ClearAllActions());
	DelayCommand(0.4, SurrenderRetainBuffs());
	DelayCommand(0.5, CancelCombat(oNPC));
	DelayCommand(0.5, CancelCombat(OBJECT_SELF));
}

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 1001) // KOTOR_DEFAULT_EVENT_ON_HEARTBEAT
		{
			
		}
	else if (nUser == 1002) // KOTOR_DEFAULT_EVENT_ON_PERCEPTION
		{
			
		}
	else if (nUser == 1003) // KOTOR_DEFAULT_EVENT_ON_COMBAT_ROUND_END
		{
			
		}
	else if (nUser == 1004) // KOTOR_DEFAULT_EVENT_ON_DIALOGUE
		{
			
		}
	else if (nUser == 1005) // KOTOR_DEFAULT_EVENT_ON_ATTACKED
		{
			
		}
	else if (nUser == 1006) // KOTOR_DEFAULT_EVENT_ON_DAMAGE
		{
			object oPC = GetFirstPC();
			object oTalker = GetObjectByTag("sta_bastlast_talk", 0);
			int nGlobal = GetGlobalNumber("Sta_BastTalk");
			int nCurHP = GetCurrentHitPoints(OBJECT_SELF);
			
			if (nCurHP <= 10 && nGlobal == 3)
				{
					CombatSurrender(oPC);
					// Initiate final DLG between an invisible placeable and the player, in case the option to kill Bastila is chosen.
					DelayCommand(1.0, AssignCommand(oTalker, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
				else if (nCurHP <= 70 && nGlobal == 2)
					{
						CombatSurrender(oPC);
						DelayCommand(1.0, ActionStartConversation(oPC));
					}
					else if (nCurHP <= 80 && nGlobal == 1)
						{
							CombatSurrender(oPC);
							DelayCommand(1.0, ActionStartConversation(oPC));
						}
		}
	else if (nUser == 1007) // KOTOR_DEFAULT_EVENT_ON_DEATH
		{
			object oDoor1 = GetObjectByTag("k45_door_bast1", 0);
			object oDoor2 = GetObjectByTag("k45_door_bast2", 0);
			location lSelf = GetLocation(OBJECT_SELF);
			
			SetGlobalBoolean("STA_BASTILA_DEAD", TRUE);

			CreateObject(OBJECT_TYPE_WAYPOINT, "g_lastlocal", lSelf);
			
			DelayCommand(1.9, CombatEnd(OBJECT_SELF));
			
			SetLocked(oDoor1, FALSE);
			SetLocked(oDoor2, FALSE);
			
			DelayCommand(2.0, SetGlobalFadeOut(0.0, 2.0));
			
			AssignCommand(GetModule(), DelayCommand(3.0, ST_PlayBastilaLight()));
		}
	else if (nUser == 1008) // KOTOR_DEFAULT_EVENT_ON_DISTURBED
		{
			
		}
	else if (nUser == 1009) // KOTOR_DEFAULT_EVENT_ON_BLOCKED
		{
			
		}
	else if (nUser == 1010) // KOTOR_DEFAULT_EVENT_ON_FORCE_AFFECTED
		{
			
		}
	else if (nUser == 1011) // KOTOR_DEFAULT_EVENT_ON_GLOBAL_DIALOGUE_END
		{
			
		}
	else if (nUser == 8888) // CUSTOM
		{
			PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, -1.0);
			DelayCommand(2.0, ApplyEffectToObject(0, EffectVisualEffect(1015, 0), OBJECT_SELF, 0.0));
		}
}
