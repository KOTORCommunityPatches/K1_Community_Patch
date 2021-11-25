//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Include k_inc_generic
	
	This is one of the major vanilla includes used in creature AI. One of the
	problems in K1 is that neutral creatures will erroneously respond to shouts,
	even though they shouldn't. Obsidian fixed this problem in TSL by simply
	adding an exclusion for neutral creatures, which has now been incorporated
	here (see function GN_RespondToShout). This is in service of changing
	k_ai_master, even though that script itself isn't actually touched, just
	recompiled with this edited include.
	
	Issue #487: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/487
	
	DP 2021-11-25																*/
//////////////////////////////////////////////////////////////////////////////////


//:: k_inc_generic
/*
	v1.5
	Generic Include for KOTOR
	Post Clean Up as of March 3, 2003
*/
//:: Created By: Preston Watamaniuk
//:: Copyright (c) 2002 Bioware Corp.



#include "k_inc_gensupport"
#include "k_inc_walkways"
#include "k_inc_drop"

struct tLastRound
{
	int nLastAction;
	int nLastActionID;
	int nLastTalentCode;
	object oLastTarget;
	int nTalentSuccessCode;
	int nIsLastTargetDebil;
	int nLastCombo;
	int nLastComboIndex;
	int nCurrentCombo;
	int nBossSwitchCurrent;
};

struct tLastRound tPR;

//LOCAL BOOLEANS RANGE FROM 0 to 96
int AMBIENT_PRESENCE_DAY_ONLY = 1;        //POSSIBLE CUT
int AMBIENT_PRESENCE_NIGHT_ONLY = 2;      //POSSIBLE CUT
int AMBIENT_PRESENCE_ALWAYS_PRESENT = 3;

int SW_FLAG_EVENT_ON_PERCEPTION =   20;
int SW_FLAG_EVENT_ON_ATTACKED   =   21;
int SW_FLAG_EVENT_ON_DAMAGED    =   22;
int SW_FLAG_EVENT_ON_FORCE_AFFECTED = 23;
int SW_FLAG_EVENT_ON_DISTURBED = 24;
int SW_FLAG_EVENT_ON_COMBAT_ROUND_END = 25;
int SW_FLAG_EVENT_ON_DIALOGUE    = 26;
int SW_FLAG_EVENT_ON_DEATH       = 27;
int SW_FLAG_EVENT_ON_HEARTBEAT   = 28;
//int SW_FLAG_AMBIENT_ANIMATIONS = 29;          located in k_inc_walkways
//int SW_FLAG_AMBIENT_ANIMATIONS_MOBILE = 30;   located in k_inc_walkways
int SW_FLAG_FAST_BUFF            = 31;   //POSSIBLE CUT
int SW_FLAG_ASC_IS_BUSY          = 32;   //POSSIBLE CUT
int SW_FLAG_ASC_AGGRESSIVE_MODE  = 33;   //POSSIBLE CUT
int SW_FLAG_AMBIENT_DAY_ONLY     = 40;   //POSSIBLE CUT
int SW_FLAG_AMBIENT_NIGHT_ONLY   = 43;   //POSSIBLE CUT
int SW_FLAG_EVENT_ON_SPELL_CAST_AT = 44;
int SW_FLAG_EVENT_ON_BLOCKED     = 45;
int SW_FLAG_ON_DIALOGUE_COMPUTER = 48;
int SW_FLAG_FORMATION_POSITION_0 = 49;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_1 = 50;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_2 = 51;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_3 = 52;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_4 = 53;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_5 = 54;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_6 = 55;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_7 = 56;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_8 = 57;   //POSSIBLE CUT
int SW_FLAG_FORMATION_POSITION_9 = 58;   //POSSIBLE CUT
//int SW_FLAG_TARGET_FRIEND      = 59;        Located in k_inc_gensupport
int SW_FLAG_COMMONER_BEHAVIOR    = 60;
int SW_FLAG_SPECTATOR_STATE      = 61;
int SW_FLAG_AI_OFF               = 62;
int SW_CANDEROUS_COMBAT_REGEN    = 63;
int SW_FLAG_BOSS_AI              = 64;
int SW_FLAG_SHIELD_USED          = 65;
int SW_FLAG_EVENT_ON_DIALOGUE_END = 66;
int SW_FLAG_RESISTANCES_APPLIED  = 67;
int SW_FLAG_EVENT_DIALOGUE_END   = 68;   //User defined event
//This flag is set when the creature percieves a hostile for the first time.
//Used to eliminate the delay a creature puts on his perception event when first seeing a hostile.
int SW_FLAG_STATE_AGITATED       = 69;
int SW_FLAG_MALAK_AI_ON          = 70;
int SW_FLAG_DYNAMIC_COMBAT_ZONE  = 71;
int SW_FLAG_EVENT_ON_DIALOGUE_INTERRUPT  = 72;

//TALENT ROUTINES
int GEN_TALENT_SUPRESS_FORCE = 1;
int GEN_TALENT_REMOVE_POISON = 2;
int GEN_TALENT_HEALING       = 3;
int GEN_TALENT_BUFF          = 4;

//Sets the NPC listening patterns for the purposes of shouts
void GN_SetListeningPatterns();
//Determines what combat actions the character is going to take.
void GN_DetermineCombatRound(object oIntruder = OBJECT_INVALID);
// Function used by the On Dialogue script to determine what to do when a NPC gets shout
void GN_RespondToShout(object oShouter, int nShoutIndex, object oIntruder = OBJECT_INVALID);
//Sets the day night patterns for the creature.  Uses the AMBIENCE_ constants.
void GN_SetDayNightPresence(int nPresenceSetting);
//Sets the attack target depending on whether oTarget or oIntruder is Valid
object GN_DetermineAttackTarget(object oIntruder = OBJECT_INVALID);
//Makes the character flee the center of an explosion
void GN_DodgeGrenade(object oIntruder);
//Resets the formation booleans on a character.
void GN_ResetFormationBooleans();
//Checks which position on a character is free.
void GN_MoveToFormation(object oAnchor, int nFormationType);
//Runs the default AI routine
int GN_RunDefaultAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Aid AI routine
int GN_RunAidAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Grenade Thrower AI
int GN_RunGrenadeAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Jedi Support AI routine
int GN_RunJediSupportAIRoutine(object oIntruder = OBJECT_INVALID);
//Runs the Boss AI Routine
int GN_RunBossAIRoutine(object oIntruder = OBJECT_INVALID);
//Run Boss Grenade AI Routine
int GN_RunBossGrenadeAI();
//Run Boss AOE Force Power Routine
int GN_RunBossAOEPowerRoutine();
//Runs special AI just for Darth Malak on the Star Forge
int GN_RunMalakAIRoutine();
//Run Boss Targeted Routine
int GN_RunBossTargetedRoutine();
//Sets up struct tLastRound to allow for a single point of determination.
void GN_SetLastRoundData();
//Makes the person or droid activate a shield
int GN_ActivateForceField();
//Makes the person activate Resist Elements and Resist Force.
int GN_ActivateResistances();
//Resets a Droid to his deactivated animation
void GN_ResetDroidDeactivationState(object oDroid = OBJECT_SELF);
//Checks the target and the droid utility use to make sure they are compatible
talent GN_CheckDroidUtilityUsage(object oTarget, talent tUse);
//Checks the target and the force power to make sure that a lightsaber is not thrown from close range.
talent GN_CheckThrowLightSaberUsage(object oTarget, talent tUse);
//Checks the target and the force power to make sure that a non-droid force power is used against a droid
talent GN_CheckNonDroidForcePower(object oTarget, talent tUse);
//Performs a series of checks in case the combat portion of DetermineCombatRound falls through.
int GN_DoPostDCRChecks();
//A void version of do post DCR checks for use with action do command.
void GN_ActionDoPostDCRChecks();

//Determine Combat Round Targeting Funtions
//This function returns an object if OBJECT_SELF is poisoned, or if any party member is poisoned.
object GN_CheckIfPoisoned();
//This function returns an object if OBJECT_SELF is below 50% health, or if any party member is injured.
object GN_CheckIfInjured();
//This checks the last hostile target and determines the best attack action based on the last round.
int GN_GetAttackTalentCode(object oTarget);
//Pass in a talent type and a target to have object_self use the talent
int GN_TalentMasterRoutine(int nTalentConstant, object oTarget);
//Determines where in the current combo the character is and what to do next based on AI style, and combat info.
talent GN_GetComboMove(int nBoss = FALSE);
//Plays an Ambient Animation depending on the spawn in condition selected.
void GN_PlayAmbientAnimation();
// This causes peasants to flee when people
int GN_CommonAI();
//Should Commoners run away.  This returns a yes or no based on a set of conditions
int GN_CheckShouldFlee();


void GN_DetermineCombatRound(object oIntruder = OBJECT_INVALID)
{
	GN_MyPrintString("");
	GN_MyPrintString("GENERIC DEBUG *************** START DETERMINE COMBAT ROUND " + GN_ReturnDebugName(OBJECT_SELF));

	GN_SetLastRoundData();
	int nPartyAI = GetPartyAIStyle(); //Determines how the party should react to intruders
	int nNPC_AI = GetNPCAIStyle(OBJECT_SELF); //Determines how the individual should react in combat
	GN_MyPrintString("GENERIC DEBUG *************** AI STYLE = " + GN_ReturnAIStyle());
	if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
	&& !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
	&& !GN_GetSpawnInCondition(SW_FLAG_AI_OFF)
	//MODIFIED by Preston Watamaniuk on March 27
	//Put this back in to cancel Determine Combat when user actions are present.
	&& !GetUserActionsPending())
	{
		if(GetPartyMemberByIndex(0) != OBJECT_SELF && !GetPlayerRestrictMode())
		{
			if((IsObjectPartyMember(OBJECT_SELF) && !GetPlayerRestrictMode()) || !IsObjectPartyMember(OBJECT_SELF))
			{
				if(nNPC_AI == NPC_AISTYLE_MELEE_ATTACK)
				{
					if(GetIsObjectValid(oIntruder))
					{
						ClearAllActions();
						ActionAttack(oIntruder);
						return;
					}
					else
					{
						object oDefault = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
						if(GetIsObjectValid(oDefault))
						{
							ClearAllActions();
							ActionAttack(oDefault);
							return;
						}
					}
					return;
				}
				//Always try and run a force field at the beginning of combat.
				if(GN_ActivateForceField() == TRUE)
				{
					GN_MyPrintString("GENERIC DEBUG *************** Terminating AI from Shields");
					return;
				}
				//Always try to use Force Resistance at the beginning of combat.
				if(GN_ActivateResistances() == TRUE){return;}

				//P.W. (June 9) - Malak AI put into the generics
				if(GN_GetSpawnInCondition(SW_FLAG_MALAK_AI_ON) == TRUE)
				{
					if(GN_RunMalakAIRoutine() == TRUE){return;}
				}

				//If the boss flag is set then the creature will run the boss AI first.
				if(GN_GetSpawnInCondition(SW_FLAG_BOSS_AI) == TRUE)
				{
					if(GN_RunBossAIRoutine(oIntruder) == TRUE){return;}
				}

				if(nNPC_AI == NPC_AISTYLE_DEFAULT_ATTACK)
				{
					 //ACTIVE
					 if(GN_RunDefaultAIRoutine(oIntruder) == TRUE)
					 {
						return;
					 }
				}
				else if(nNPC_AI == NPC_AISTYLE_GRENADE_THROWER)
				{
					 //ACTIVE
					 if(GN_RunGrenadeAIRoutine(oIntruder) == TRUE){return;}
				}
				else if(nNPC_AI == NPC_AISTYLE_JEDI_SUPPORT)
				{
					 //ACTIVE
					 if(GN_RunJediSupportAIRoutine(oIntruder) == TRUE){return;}
				}
			}
		}
	}
	if(GN_DoPostDCRChecks())
	{
		GN_MyPrintString("GENERIC DEBUG *************** DETERMINE COMBAT ROUND END");
	}
	GN_MyPrintString("GENERIC DEBUG *************** WARNING DETERMINE COMBAT ROUND FAILURE");
}

//::///////////////////////////////////////////////
//:: Do Post Determine Combat Round Checks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Performs a series of checks in case the combat
	portion of DetermineCombatRound falls through.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 25, 2003
//:://////////////////////////////////////////////
int GN_DoPostDCRChecks()
{
	GN_MyPrintString("GENERIC DEBUG *************** Post DCR Checks for " + GN_ReturnDebugName(OBJECT_SELF));
	if(GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR) && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE))
	{
		//MODIFIED by Preston Watamaniuk on May 29, 2003
		//Changed the commoner subroutine to make sure it walks ways at the end of battles.
		if(GN_CommonAI())
		{
			return TRUE;
		}
	}
	else if(GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Clear 1000");
		ClearAllActions();
		return TRUE;
	}
	//If all combat actions fail, then return to Walkways
	//P.W.(May 22, 2003) - Added check to make sure a waypoint path is set out for the creature. If then do not clear all actions.
	if(!IsObjectPartyMember(OBJECT_SELF) && GN_CheckWalkWays(OBJECT_SELF) == TRUE)
	{
		GN_MyPrintString("GENERIC DEBUG *************** Clear 1100");
		ClearAllActions();
		//MODIFIED by Preston Watamaniuk on May15, 2003
		//Put this delay command in so that bark bubble do not disapear so quickly off conversations.
		DelayCommand(1.0, GN_WalkWayPoints());
		return TRUE;
	}
	else if(GetPartyMemberByIndex(0) != OBJECT_SELF &&
			!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)) &&
			IsObjectPartyMember(OBJECT_SELF))
	{
		if(!GetSoloMode())
		{
			GN_PostString("NO TARGET: FOLLOW LEADER");
			CancelCombat(OBJECT_SELF);
			GN_MyPrintString("GENERIC DEBUG *************** Clear 1200");
			ClearAllActions();
			ActionFollowLeader();
		}
		return TRUE;
	}
	return FALSE;
}

//::///////////////////////////////////////////////
//:: GN_ActionDoPostDCRChecks
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	A form of the DCR checks that can be run as
	an actions.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 29, 2003
//:://////////////////////////////////////////////
void GN_ActionDoPostDCRChecks()
{
	int nx = GN_DoPostDCRChecks();
}

//:://////////////////////////////////////////////
//:: Run Default AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Runs the default AI for an NPC. Returns FALSE
	if they cannot do anything.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////
int GN_RunDefaultAIRoutine(object oIntruder)
{
	object oTarget, oClose;
	int nTalentCode;
	talent tUse;

	oTarget = GN_CheckIfPoisoned();
	if(GetIsObjectValid(oTarget))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_REMOVE_POISON, oTarget)) {return TRUE;}
	}
	oTarget = GN_CheckIfInjured();
	if(GetIsObjectValid(oTarget))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oTarget)) {return TRUE;}
	}

	tUse = GN_GetComboMove();

	int nFriend = GetLocalBoolean(OBJECT_SELF, SW_FLAG_TARGET_FRIEND);
	if(nFriend == TRUE)
	{
		if(GetNPCAIStyle(OBJECT_SELF) == NPC_AISTYLE_JEDI_SUPPORT)
		{
			oTarget = GetPartyMemberByIndex(0);
		}
		else
		{
			oTarget = OBJECT_SELF;
		}
	}
	else
	{
		oTarget = tPR.oLastTarget;
		oClose = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF,1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);

		GN_MyPrintString("GENERIC DEBUG *************** Default AI Debug Start *************************");
		GN_MyPrintString("GENERIC DEBUG *************** Intruder    = " + GN_ReturnDebugName(oIntruder));
		GN_MyPrintString("GENERIC DEBUG *************** Last Target = " + GN_ReturnDebugName(oTarget));
		GN_MyPrintString("GENERIC DEBUG *************** Closest     = " + GN_ReturnDebugName(oClose));

		//GN_MyPrintString("GENERIC DEBUG *************** " + GN_ReturnDebugName(OBJECT_SELF) + "I see an enemy = " + IntToString(GetIsObjectValid(oClose)));

		//MODIFIED by Preston Watamaniuk on June 3, 2003
		//I put this check in to make sure the party members only attack what you want until that things dies or leaves.
		if(IsObjectPartyMember(OBJECT_SELF) && GetIsObjectValid(oTarget) && !GetIsDead(oTarget) && GetObjectSeen(oTarget))
		{
			oTarget = oTarget; //Just put this here to show that the target is being used.
		}
		//MODIFIED by Preston Watamaniuk on May 15, 2003
		//Made it so the intruder object is always used if they can be seen and are valid.
		else if(GetIsObjectValid(oIntruder) && GetObjectSeen(oIntruder))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Intruder becomes Target");
			oTarget = oIntruder;
		}
		else if(GetIsObjectValid(oClose) && GetObjectSeen(oClose))
		{
			if((!GetIsObjectValid(oTarget) ||
			   !GetIsEnemy(oTarget) ||
			   GetIsDead(oTarget) ||
			   GetCurrentHitPoints(oTarget) < GetCurrentHitPoints(oClose)))
			   {
				  GN_MyPrintString("GENERIC DEBUG *************** Closest becomes Target");
				  oTarget = oClose;
			   }
		}
	}

	//MODIFIED by Preston Watamaniuk on April 22, 2003
	//Put this check in to allow Droids to use their special abilities in a more logical manner. Passes in the talent and the target
	//and double checks that the usage is logical.
	if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
	{
		tUse = GN_CheckDroidUtilityUsage(oTarget, tUse);
	}
	tUse = GN_CheckThrowLightSaberUsage(oTarget, tUse);
	tUse = GN_CheckNonDroidForcePower(oTarget, tUse);

	GN_MyPrintString("GENERIC DEBUG *************** Default AI Debug End ***************************");

	GN_MyPrintString("GENERIC DEBUG *************** Target = " + GN_ReturnDebugName(oTarget) + " is Enemy: " + IntToString(GetIsEnemy(oTarget)));
	if(GetIsObjectValid(oTarget))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Clear 1300");
		ClearAllActions();
		if(GN_EquipAppropriateWeapon())
		{
		   GN_MyPrintString("GENERIC DEBUG *************** Switching Weapons");
		}

		if(GetIsTalentValid(tUse) && GetIsEnemy(oTarget))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Using Talent on Target");
			ActionUseTalentOnObject(tUse, oTarget);
			return TRUE;
		}
		else if(GetIsEnemy(oTarget))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Action Attack by Default");
			ActionAttack(oTarget);
			return TRUE;
		}
	}
	GN_MyPrintString("GENERIC DEBUG *************** Default AI has failed to do an action");
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Jedi Aid AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	AI that concentrates on keeping the party healed,
	poison free.  If the party is doing ok then the Jedi
	will attempt to use Force Powers. If they are unable
	to use force powers they will run default AI.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 20, 2003
//:://////////////////////////////////////////////

int GN_RunAidAIRoutine(object oIntruder = OBJECT_INVALID)
{
	object oPoisoned = GN_CheckIfPoisoned();
	if(GetIsObjectValid(oPoisoned))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_REMOVE_POISON, oPoisoned)) {return TRUE;}
	}
	object oInjured = GN_CheckIfInjured();
	if(GetIsObjectValid(oInjured))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oInjured)) {return TRUE;}
	}

	return GN_RunDefaultAIRoutine(oIntruder);
}

//::///////////////////////////////////////////////
//:: Grenade AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Trys to use a grenades on targets not surrounded
	by enemies
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////

int GN_RunGrenadeAIRoutine(object oIntruder = OBJECT_INVALID)
{
	if(IsObjectPartyMember(OBJECT_SELF) || d100() > 50)
	{
		int nDroid = FALSE;
		talent tUse;
		object oTarget = GN_FindGrenadeTarget();

		if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
		{
			nDroid = TRUE;
		}

		tUse = GN_GetGrenadeTalent(nDroid);

		if(GetIsObjectValid(oTarget) && GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Clear 1400");
			ClearAllActions();
			ActionUseTalentOnObject(tUse, oTarget);
			return TRUE;
		}
		GN_MyPrintString("GENERIC DEBUG *************** Grenade AI Failure");
		return GN_RunDefaultAIRoutine(oIntruder);
	}
	GN_MyPrintString("GENERIC DEBUG *************** Grenade AI Fall Through");
	return GN_RunDefaultAIRoutine(oIntruder);
}

//::///////////////////////////////////////////////
//:: Jedi Support
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	This will make the Jedi use Force Powers before
	everything else.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////
int GN_RunJediSupportAIRoutine(object oIntruder = OBJECT_INVALID)
{
	object oPoisoned = GN_CheckIfPoisoned();
	talent tUse;
	object oTarget;

	//P.W (May 27, 2003) - Made a change so that Droids can use Jedi Support. Its just defaul AI with an AI check however.
	if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
	{
		return GN_RunDefaultAIRoutine();
	}

	if(GN_TalentMasterRoutine(GEN_TALENT_BUFF, OBJECT_SELF))
	{
		return TRUE;
	}
	if(GetIsObjectValid(oPoisoned))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_REMOVE_POISON, oPoisoned)) {return TRUE;}
	}
	object oInjured = GN_CheckIfInjured();
	if(GetIsObjectValid(oInjured))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oInjured)) {return TRUE;}
	}

	oTarget = GN_FindAOETarget();
	GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: AOE Target = " + GN_ITS(GetIsObjectValid(oTarget)));
	if(GetIsObjectValid(oTarget))
	{
		if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
		{
			tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_FORCE_POWER, TRUE);
		}
		else
		{
			tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_FORCE_POWER);
		}
	}
	else
	{
		GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: Inside the Party AI Section");

		oTarget = GN_DetermineAttackTarget();

		GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + GN_ReturnDebugName(oTarget));

		if(GetIsObjectValid(oTarget))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: Valid oTarget Set As = " + GN_ReturnDebugName(oTarget));
			if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
			{
				tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_NPC, TRUE);
			}
			else
			{
				tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_NPC);
			}
		}
	}
	tUse = GN_CheckThrowLightSaberUsage(oTarget, tUse);
	tUse = GN_CheckNonDroidForcePower(oTarget, tUse);
	if(GetIsObjectValid(oTarget) && GetIsTalentValid(tUse))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Clear 1450");
		ClearAllActions();
		ActionUseTalentOnObject(tUse, oTarget);
		return TRUE;
	}
	GN_MyPrintString("GENERIC DEBUG *************** Jedi Support AI: Fall Through");
	return GN_RunDefaultAIRoutine();
}

//::///////////////////////////////////////////////
//:: Boss AI: Grenade
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Run Boss Grenade AI Routine
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
int GN_RunBossGrenadeAI()
{
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Grenade Function Starting");
	talent tUse;
	object oCheck = GN_FindGrenadeTarget();
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Grenade Target = " + GN_ITS(GetIsObjectValid(oCheck)));
	int nDroid;
	if(GetIsObjectValid(oCheck))
	{
		 if(GetRacialType(oCheck) == RACIAL_TYPE_DROID)
		 {
			nDroid == TRUE;
		 }
		 tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_GRENADE, nDroid);
		 if(GetIsTalentValid(tUse))
		 {
			GN_MyPrintString("GENERIC DEBUG *************** Clear 1460");
			ClearAllActions();
			ActionUseTalentOnObject(tUse, oCheck);
			GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Success");
			return TRUE;
		 }
	}
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Failure");
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Boss AI: AOE Power
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Run Boss AOE Force Power Routine
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
int GN_RunBossAOEPowerRoutine()
{
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Function Starting");
	talent tUse;
	object oCheck = GN_FindAOETarget();
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Target = " + GN_ITS(GetIsObjectValid(oCheck)));
	int nDroid;
	if(GetIsObjectValid(oCheck))
	{
		 if(GetRacialType(oCheck) == RACIAL_TYPE_DROID)
		 {
			nDroid == TRUE;
		 }
		 tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_FORCE_POWER, nDroid);
		 if(GetIsTalentValid(tUse))
		 {
			ClearAllActions();
			ActionUseTalentOnObject(tUse, oCheck);
			GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Success");
			return TRUE;
		 }
	}
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: AOE Failure");
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Boss AI: Targeting
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	This will make boss monsters use targeted
	super powers.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
int GN_RunBossTargetedRoutine()
{
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Start Targeted Action Routine");
	talent tUse;
	object oTarget;
	int nDroid;
	int nRand = d6();
	int nCnt = 1;
	if(nRand < 4){nRand = 1;}
	if(nRand == 4){nRand = 2;}
	if(nRand == 5){nRand = 3;}
	if(nRand == 6){nRand = 4;}

	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Get the #" + GN_ITS(nRand) + " target");

	object oFind = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + GN_ReturnDebugName(oFind));
	while(GetIsObjectValid(oFind) && nCnt <= nRand)
	{
		GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Valid oFind = " + GN_ReturnDebugName(oFind) + " nCnt = " + GN_ITS(nCnt));
		if(GetIsObjectValid(oFind))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Valid oTarget Set As = " + GN_ReturnDebugName(oFind));
			oTarget = oFind;
		}
		nCnt++;
		oFind = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	}

	//DEBUG STATEMENTS
	int nX = TRUE;
	if(nX == TRUE)
	{
		if(GetIsTalentValid(tUse))
		{
			if(GetTypeFromTalent(tUse) == TALENT_TYPE_FEAT)
			{
				GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Talent Feat = " + GN_ITS(GetIdFromTalent(tUse)));
			}
			else if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
			{
				GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Talent Power = " + GN_ITS(GetIdFromTalent(tUse)));
			}
		}
	}
	if(GetIsObjectValid(oTarget))
	{
		if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
		{
			GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Get Boss Combat Move AI Droid");
			nDroid = TRUE;
		}
		tUse = GN_GetBossCombatMove(SW_BOSS_ATTACK_TYPE_NPC, nDroid);
		
		tUse = GN_CheckThrowLightSaberUsage(oTarget, tUse);
		tUse = GN_CheckNonDroidForcePower(oTarget, tUse);
		
		//MODIFIED by Preston Watamaniuk on April 2, 2003
		//Added this check to make the Droid setting was used for non-specific attacks.
		GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Target = " + GN_ITS(GetIsObjectValid(oTarget)));
		GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Talent = " + GN_ITS(GetIsTalentValid(tUse)));
		if(GetIsTalentValid(tUse) && GetIsObjectValid(oTarget))
		{
			ClearAllActions();
			ActionUseTalentOnObject(tUse, oTarget);
			GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Targeted Power Success");
			return TRUE;
		}
	}
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Targeted Failure");
	return FALSE;
}


//::///////////////////////////////////////////////
//:: Boss AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	This will make boss monsters buff themselves
	and use more force powers or utility devices
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2003
//:://////////////////////////////////////////////
int GN_RunBossAIRoutine(object oIntruder = OBJECT_INVALID)
{
	GN_MyPrintString("GENERIC DEBUG *************** Boss AI Start");

	object oTarget = GN_CheckIfInjured();
	if(GetIsObjectValid(oTarget))
	{
		if(GN_TalentMasterRoutine(GEN_TALENT_HEALING, oTarget)) {return TRUE;}
	}
	if(GN_EquipAppropriateWeapon())
	{
	   GN_MyPrintString("GENERIC DEBUG *************** Switching Weapons");
	}

	if(GN_RunBossGrenadeAI() == TRUE) {return TRUE;}
	else if(GN_RunBossAOEPowerRoutine() == TRUE) {return TRUE;}
	else if(GN_RunBossTargetedRoutine() ==  TRUE) {return TRUE;}

	GN_MyPrintString("GENERIC DEBUG *************** Boss AI: Fall Through");
	return GN_RunDefaultAIRoutine();
}


//::///////////////////////////////////////////////
//:: Malak AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	This AI is just for Darth Malak on the Star
	Forge. It assumes there is only the PC and
	no one else.
	
	Malak's Force Powers
		Master Speed
		Force Push
		Throw Lightsaber (15)
		Affliction
		Force Resistance
		Imp. Energy Resist
		Lightning (15)
		Force Breach
		
	This routine is an add-on for boss ai.  It
	tests certain conditions that could be
	occurring in the Malak fight and reacts to them
	in a more agressive manner.

	1. K_END_JEDI_LEFT - Will track the total number
	   of entombed Jedi left in the fight.
	2. K_END_MALAK_JEDI_USED - Will track the number
	of Jedi's Malak has personally used in the fight.

*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 29, 2003
//:://////////////////////////////////////////////
int GN_RunMalakAIRoutine()
{
	GN_MyPrintString("GENERIC DEBUG *************** Malak AI Start");
	int nJediLeft = GetGlobalNumber("K_END_JEDI_LEFT");
	int nMalakUsed = GetGlobalNumber("K_END_MALAK_JEDI_USED");
	object oPC = GetFirstPC();
	int bJedi, bDist, bAttack;
	float fDist = GetDistanceBetween(OBJECT_SELF, oPC);

	//Check to see if Malak need to become more aggressive
	//Test the number of Jedi to see if the player has used any
	if(((8 - nJediLeft) < nMalakUsed))
	{
		bJedi = TRUE;
	}
	//Check to see if the player is running away
	GN_MyPrintString("GENERIC DEBUG *************** Malak Distance to PC = " + FloatToString(GetDistanceBetween(OBJECT_SELF, oPC),4,4));
	if(fDist > 10.0)
	{
		bDist = TRUE;
	}
	if(bDist == TRUE)
	{
		/*
			AI REACTION 2 - Player is keeping his distance.
			1. Force Breach if the player is using speed
			OR
			2. Use Action Attack to Force Jump
		*/
		GN_MyPrintString("GENERIC DEBUG *************** Clear 1480");
		ClearAllActions();
		if(GetHasSpellEffect(FORCE_POWER_SPEED_BURST, oPC) ||
		   GetHasSpellEffect(FORCE_POWER_KNIGHT_SPEED, oPC) ||
		   GetHasSpellEffect(FORCE_POWER_SPEED_MASTERY, oPC))
		{
			talent tBreach = TalentSpell(FORCE_POWER_FORCE_BREACH);
			if(GetIsTalentValid(tBreach))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Using Breach");
				ActionUseTalentOnObject(tBreach, oPC);
			}
			bAttack = TRUE;
		}
		else
		{
			if(fDist > 10.0)
			{
				int nRoll = d3();
				int nPower = -1;
				if(nRoll == 1)
				{
					nPower = FORCE_POWER_LIGHTNING;
				}
				else if(nRoll == 2)
				{
					nPower = FORCE_POWER_LIGHT_SABER_THROW;
				}
				else if(nRoll > 2)
				{
					bAttack = TRUE;
				}
				if(nPower != -1)
				{
					talent tPower = TalentSpell(nPower);
					if(GetIsTalentValid(tPower))
					{
						GN_MyPrintString("GENERIC DEBUG *************** Malak Using Force Power");
						ActionUseTalentOnObject(tPower, oPC);
						return TRUE;
					}
				}
			}
			bAttack = TRUE;
		}
	}
	if(bAttack == TRUE)
	{
		GN_MyPrintString("GENERIC DEBUG *************** Malak Attacking");
		ActionAttack(oPC);
		return TRUE;
	}
	GN_MyPrintString("GENERIC DEBUG *************** Malak AI Drop Out");
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Shield Activation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Organic Shields are 99 to 107
	Droid shields are 110 to 115

	Scans through all of the shield talents to
	see if the target has a shield to use. If the
	shield is used then the person will never use
	another one. Party members will never use this
	function.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2003
//:://////////////////////////////////////////////
int GN_ActivateForceField()
{
	GN_MyPrintString("GENERIC DEBUG *************** Starting Forcefield Search");
	GN_MyPrintString("GENERIC DEBUG *************** Shield Boolean (" + GN_ITS(SW_FLAG_SHIELD_USED) + ") = " + GN_ITS(GN_GetSpawnInCondition(SW_FLAG_SHIELD_USED)));
	if(GN_GetSpawnInCondition(SW_FLAG_SHIELD_USED) == FALSE && !IsObjectPartyMember(OBJECT_SELF))
	{
		int nCnt, nStop;
		int bValid = FALSE;
		talent tShield;
		if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
		{
			nCnt = 110;
			nStop = 115;
		}
		else
		{
			nCnt = 99;
			nStop = 107;
		}

		while(bValid == FALSE && nCnt <= nStop)
		{
			tShield = TalentSpell(nCnt);
			if(GetCreatureHasTalent(tShield))
			{
				bValid = TRUE;
			}
			else
			{
				nCnt++;
			}
		}

		if(GetCreatureHasTalent(tShield))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Clear 1700");
			ClearAllActions();
			ActionUseTalentOnObject(tShield, OBJECT_SELF);
			GN_SetSpawnInCondition(SW_FLAG_SHIELD_USED);
			return TRUE;
		}
		else
		{
			GN_MyPrintString("GENERIC DEBUG *************** Forcefield Search Fallthrough");
			GN_SetSpawnInCondition(SW_FLAG_SHIELD_USED);
			return FALSE;
		}
	}
	GN_MyPrintString("GENERIC DEBUG *************** Forcefield Search Fallthrough");
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Resistance Activation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	20 Resist Force
	41 Force Immunity
	Checks to see if the character has resist force
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2003
//:://////////////////////////////////////////////
//Makes the person activate Resist Elements and Resist Force.
int GN_ActivateResistances()
{
	int bValid = FALSE;
	if(GN_GetSpawnInCondition(SW_FLAG_RESISTANCES_APPLIED) == FALSE && !IsObjectPartyMember(OBJECT_SELF))
	{
		if(GetHitDice(GetFirstPC()) >= 15 || GN_GetSpawnInCondition(SW_FLAG_BOSS_AI))
		{
			talent tResist = TalentSpell(FORCE_POWER_RESIST_FORCE);
			talent tImmune = TalentSpell(FORCE_POWER_FORCE_IMMUNITY);
			talent tUse;
			if(GetCreatureHasTalent(tImmune))
			{
				tUse = tImmune;
				bValid = TRUE;
			}
			else if(GetCreatureHasTalent(tResist))
			{
				tUse = tResist;
				bValid = TRUE;
			}

			if(bValid == TRUE)
			{
				GN_MyPrintString("GENERIC DEBUG *************** Clear 1710");
				ClearAllActions();
				ActionUseTalentOnObject(tUse, OBJECT_SELF);
			}
			GN_SetSpawnInCondition(SW_FLAG_RESISTANCES_APPLIED);
		}
	}

	return bValid;
}



//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Respond to Shout                                           ========  =       =   =======   =       =  =========   ========
//:: Copyright (c) 2001 Bioware Corp.                          =          =       =  =       =  =       =      =      =
//:://////////////////////////////////////////////             =          =       =  =       =  =       =      =      =
/*//                                                           =          =       =  =       =  =       =      =      =
	Catches the shouts and determines the best                 =========  =========  =       =  =       =      =      =========
	course of action for them                                          =  =       =  =       =  =       =      =              =
																	   =  =       =  =       =  =       =      =              =
	SetListenPattern(OBJECT_SELF, "GEN_I_WAS_ATTACKED", 1);            =  =       =  =       =  =       =      =              =
	SetListenPattern(OBJECT_SELF, "GEN_I_SEE_AN_ENEMY", 15);   ========   =       =   =======     ======       =      ========
*///
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 16, 2002
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void GN_RespondToShout(object oShouter, int nShoutIndex, object oIntruder = OBJECT_INVALID)
{
	GN_MyPrintShoutString("");
	GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Respond to Shout Started for " + GN_ReturnDebugName(OBJECT_SELF));
	GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Intruder Object = " + GN_ReturnDebugName(oIntruder));

	// K1CP 2021/11/25 - Taken from TSL's k_inc_generic. Prevents spurious reactions to shouts by neutral creatures.
	// RWT-OEI 10/08/04 - If we're neutral, we just don't want to respond to these shouts. Ever. Seriously.
	if (GetStandardFaction(OBJECT_SELF) == STANDARD_FACTION_NEUTRAL)
		{
			return;
		}


	int nFLAG; //This determines whether the object walksway points instead of attacking.
	int nPartyAI = GetPartyAIStyle(); //Determines how the party should react to intruders
	int nNPC_AI = GetNPCAIStyle(OBJECT_SELF); //Determines how the individual should react in combat

	//MODIFIED by Preston Watamaniuk May 9
	//Put this check into disable shouts being heard by people from different combat zones.
	if(GetLocalNumber(oShouter, SW_NUMBER_COMBAT_ZONE) == GetLocalNumber(OBJECT_SELF, SW_NUMBER_LAST_COMBO) ||
	   GetLocalNumber(oShouter, SW_NUMBER_COMBAT_ZONE) == 0 ||
	   GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBAT_ZONE) == 0 ||
	   IsObjectPartyMember(OBJECT_SELF))
	{
		if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
		   && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
		   && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF)
		   && !GetUserActionsPending())
		{
			GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 1 Pass");
			if(nShoutIndex == 1 && GetIsFriend(oShouter) && oShouter != OBJECT_SELF)
			{
				if((IsObjectPartyMember(OBJECT_SELF) && IsObjectPartyMember(oShouter) && GetSoloMode() == FALSE) ||
					!IsObjectPartyMember(OBJECT_SELF))
				{
					GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 2 Pass");
					if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()) && !GetIsObjectValid(GetAttackTarget()))
					{
						GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 3 Pass");
						if(GetPartyMemberByIndex(0) != OBJECT_SELF && nPartyAI != PARTY_AISTYLE_PASSIVE && !GetPlayerRestrictMode())
						{
							GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 3 Pass");
							if((IsObjectPartyMember(OBJECT_SELF) && !GetPlayerRestrictMode()) || !IsObjectPartyMember(OBJECT_SELF))
							{
								GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Check 5 Pass");

								GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Intruder = " + GN_ReturnDebugName(oIntruder));
								if(GetObjectSeen(oIntruder))
								{
									GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Shout: Determine Combat Round");
									GN_MyPrintString("GENERIC SHOUT DEBUG *************** Shout Clear 1800");

									ClearAllActions();
									GN_DetermineCombatRound(oIntruder);
								}
								else if(GetIsObjectValid(oIntruder))
								{
									GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Shout: Move To Intruder");
									GN_MyPrintString("GENERIC SHOUT DEBUG ***************= Shout Clear 1900");
									ClearAllActions();
									float fDistance = 5.0;
									/*
									if(!GetObjectSeen(oIntruder))
									{
										fDistance = 3.0;
									}
									*/
									//P.W. (June 8) - Put this check in to try and reduce the instances of NPCs running right up
									//to their enemies with blasters.
									if(GetDistanceBetween(OBJECT_SELF, oIntruder) < 20.0 && !GetObjectSeen(oIntruder))
									{
										ActionMoveToObject(oIntruder, TRUE, 2.0);
									}
									else
									{
										if(GN_GetWeaponType(OBJECT_SELF) == 1)
										{
											ActionMoveToObject(oIntruder, TRUE, 4.0);
										}
										else
										{
											ActionMoveToObject(oIntruder, TRUE, 15.0);
										}
									}
								}
								//MODIFIED by Preston Watamaniuk on May 16th
								//Added this check to make Party Members attack after the PC engages in combat.
								else if(IsObjectPartyMember(OBJECT_SELF))
								{
									oIntruder = GetAttackTarget(oShouter);
									GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Attack Intruder = " + GN_ReturnDebugName(oIntruder));
									if(GetIsObjectValid(oIntruder))
									{
										GN_DetermineCombatRound(oIntruder);
									}
									else
									{
										oIntruder = GetSpellTarget(oShouter);
										GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Spell Intruder = " + GN_ReturnDebugName(oIntruder));
										if(GetIsObjectValid(oIntruder))
										{
											GN_DetermineCombatRound(oIntruder);
										}
									}
								}
							}
							//I AM IN COMBAT
							else if(nShoutIndex == 15 && GetIsFriend(oShouter) && oShouter != OBJECT_SELF)
							{
								if(GetCurrentAction(OBJECT_SELF) == ACTION_INVALID)
								{
									if(GetObjectSeen(oIntruder))
									{
										GN_MyPrintString("GENERIC SHOUT DEBUG *************** Clear 2000");
										ClearAllActions();
										GN_MyPrintShoutString("GENERIC SHOUT DEBUG *************** Attack Intruder = " + GN_ReturnDebugName(oIntruder));
										GN_DetermineCombatRound(oIntruder);
										//GN_SetSpawnInCondition(SW_FLAG_SHOUTED_AT);
									}
									else if(GetIsObjectValid(oIntruder))
									{
										GN_MyPrintString("GENERIC SHOUT DEBUG *************** Clear 2100");
										ClearAllActions();
										ActionMoveToObject(oIntruder, TRUE, 5.0);
										//GN_SetSpawnInCondition(SW_FLAG_SHOUTED_AT);
									}
								}
							}
						}
					}
				}
			}
		}
		else if(GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE))
		{
			GN_MyPrintString("GENERIC SHOUT DEBUG *************** Clear 2200");
			ClearAllActions();
			return;
		}
	}
	/*
	if(!GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR)
	   && !GN_GetSpawnInCondition(SW_FLAG_SPECTATOR_STATE)
	   && !GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
	{
		if(GetPartyMemberByIndex(0) != OBJECT_SELF && nPartyAI != PARTY_AISTYLE_PASSIVE && !GetPlayerRestrictMode())
		{
			//P.W.(June 5) It looks stupid, but do not take this out.
			if(GetCurrentAction(OBJECT_SELF) == ACTION_QUEUEEMPTY && !GetUserActionsPending() && !IsObjectPartyMember(OBJECT_SELF))
			{
				if((IsObjectPartyMember(OBJECT_SELF) && IsObjectPartyMember(oShouter) && GetSoloMode() == FALSE) ||
					!IsObjectPartyMember(OBJECT_SELF))
				{
					GN_MyPrintString("GENERIC SHOUT DEBUG *************** Hail Mary activated by " + GN_ReturnDebugName(OBJECT_SELF));
					GN_MyPrintString("GENERIC SHOUT DEBUG *************** Hail Mary Shout Clear 2110");
					GN_DetermineCombatRound();
				}
			}
		}
	}
	*/
	GN_MyPrintShoutString("");
}

//::///////////////////////////////////////////////
//:: SetListeningPatterns
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Sets the correct listen checks on the NPC by
	determining what talents they possess or what
	class they use.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 24, 2001
//:://////////////////////////////////////////////

void GN_SetListeningPatterns()
{
	SetListening(OBJECT_SELF, TRUE);
	SetListenPattern(OBJECT_SELF, "GEN_I_WAS_ATTACKED", 1);
	SetListenPattern(OBJECT_SELF, "GEN_I_AM_DEAD", 3);
	SetListenPattern(OBJECT_SELF, "GEN_CALL_TO_ARMS", 6);
	if(GetHasSpell(FORCE_POWER_SUPRESS_FORCE) || GetHasSpell(FORCE_POWER_FORCE_BREACH))
	{
		SetListenPattern(OBJECT_SELF, "GEN_SUPRESS_FORCE", 9);
	}
	SetListenPattern(OBJECT_SELF, "GEN_GRENADE_TOSSED", 12);
	SetListenPattern(OBJECT_SELF, "GEN_I_SEE_AN_ENEMY", 14);
	SetListenPattern(OBJECT_SELF, "GEN_COMBAT_ACTIVE", 15);

	GN_SetUpWayPoints();
	string sTag = GetTag(OBJECT_SELF);
	if(sTag != "Carth" &&
	   sTag != "Bastila" &&
	   sTag != "Cand" &&
	   sTag != "HK47" &&
	   sTag != "Jolee" &&
	   sTag != "Juhani" &&
	   sTag != "Mission" &&
	   sTag != "T3M4" &&
	   sTag != "Zaalbar" &&
	   !GetIsPC(OBJECT_SELF))
	{
		DR_SpawnCreatureTreasure(OBJECT_SELF);
	}
	
	//MODIFIED by Preston Watamaniuk on May 8, 2003
	//Added functionality for dynamic or encounter creatures
	//to latch onto a Zone Controller.
	//GN_MyPrintString("ZONE DEBUG *****************" + IntToString(GetIsEncounterCreature()) + " " + GN_ReturnDebugName(OBJECT_SELF));
	if(GN_GetSpawnInCondition(SW_FLAG_DYNAMIC_COMBAT_ZONE) || GetIsEncounterCreature())
	{
		string sController;
		int nCount = 1;
		object oController, oTest;
		float fNear;
		float fClosest = 100.0;

		for(nCount; nCount < 40; nCount++)
		{
			if(nCount < 10)
			{
				sController = "ZoneController" + "0" + IntToString(nCount);
			}
			else
			{
				sController = "ZoneController" + IntToString(nCount);
			}
			oTest = GetObjectByTag(sController);
			if(GetIsObjectValid(oTest))
			{
				fNear = GetDistanceBetween(OBJECT_SELF, oTest);
				//GN_MyPrintString("ZONING DEBUG ***************** Controller Distance = " + GN_ReturnDebugName(oController) + " " + FloatToString(fNear, 4, 2));
				if(fNear < fClosest)
				{
					fClosest = fNear;
					oController = oTest;
				}
			}
		}
		if(GetIsObjectValid(oController) && fClosest < 30.0)
		{
			//GN_MyPrintString("ZONING DEBUG ***************** Setup Controller = " + GN_ReturnDebugName(oController));
			int nZone = StringToInt(GetStringRight(GetTag(oController), 2));
			SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBAT_ZONE, nZone);
		}
	}
}

//::///////////////////////////////////////////////
//:: Check for Poison
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Checks if someone in the party is poisoned.
	If the person is a non-party NPC then they
	check if they are poisoned.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////

object GN_CheckIfPoisoned()
{
	GN_MyPrintString("GENERIC DEBUG *************** Starting Poison Check");
	effect ePoison;
	if(IsObjectPartyMember(OBJECT_SELF))
	{
		int nCnt = 0;
		for(nCnt; nCnt > 2; nCnt++)
		{
			ePoison = GetFirstEffect(GetPartyMemberByIndex(nCnt));
			while(GetIsEffectValid(ePoison))
			{
				if(GetEffectType(ePoison) == EFFECT_TYPE_POISON)
				{
					return GetPartyMemberByIndex(nCnt);
				}
				ePoison = GetNextEffect(GetPartyMemberByIndex(nCnt));
			}
		}
	}
	else
	{
		ePoison = GetFirstEffect(OBJECT_SELF);
		while(GetIsEffectValid(ePoison))
		{
			if(GetEffectType(ePoison) == EFFECT_TYPE_POISON)
			{
				return OBJECT_SELF;
			}
			ePoison = GetNextEffect(OBJECT_SELF);
		}
	}
	GN_MyPrintString("GENERIC DEBUG ***************  Returning Invalid Poison Object");
	return OBJECT_INVALID;
}

//::///////////////////////////////////////////////
//:: Check for Injuries
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Returns member index +1 or false depending on
	whether the object belongs in the PCs party.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 9, 2002
//:://////////////////////////////////////////////

object GN_CheckIfInjured()
{
	GN_MyPrintString("GENERIC DEBUG ***************  Starting Injury Check Function");
	if(IsObjectPartyMember(OBJECT_SELF) || GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID)
	{

		object oP0=GetPartyMemberByIndex(0);
		object oP1=GetPartyMemberByIndex(1);
		object oP2=GetPartyMemberByIndex(2);

		float fDown00 = 10.0;
		float fDown01 = 10.0;
		float fDown02 = 10.0;

		if(GetIsObjectValid(oP0) && GetRacialType(oP0) != RACIAL_TYPE_DROID)
		{
			fDown00 = IntToFloat(GetCurrentHitPoints(oP0)) / IntToFloat(GetMaxHitPoints(oP0));
		}
		if(GetIsObjectValid(oP1)&& GetRacialType(oP0) != RACIAL_TYPE_DROID)
		{
			fDown01 = IntToFloat(GetCurrentHitPoints(oP1)) / IntToFloat(GetMaxHitPoints(oP1));
		}
		if(GetIsObjectValid(oP2) && GetRacialType(oP0) != RACIAL_TYPE_DROID)
		{
			fDown02 = IntToFloat(GetCurrentHitPoints(oP2)) / IntToFloat(GetMaxHitPoints(oP2));
		}

		if(GetIsObjectValid(oP0) && !GetIsDead(oP0) && (fDown00 < 0.5 && fDown00 > 0.0))
		{
			GN_MyPrintString("GENERIC DEBUG ***************  Return oP0");
			return oP0;
		}
		else if(GetIsObjectValid(oP1) && !GetIsDead(oP1) && (fDown00 < 0.5 && fDown00 > 0.0))
		{
			GN_MyPrintString("GENERIC DEBUG ***************  Return oP1");
			return oP1;
		}
		else if(GetIsObjectValid(oP2) && !GetIsDead(oP2) && (fDown00 < 0.5 && fDown00 > 0.0))
		{
			GN_MyPrintString("GENERIC DEBUG ***************  Return oP2");
			return oP2;
		}
	}
	else
	{
		float fNPC = IntToFloat(GetCurrentHitPoints(OBJECT_SELF)) / IntToFloat(GetMaxHitPoints(OBJECT_SELF));
		if(fNPC < 0.5)
		{
			return OBJECT_SELF;
		}
	}
	return OBJECT_INVALID;
}

//:://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Generic Talent Routines
//:: Copyright (c) 2001 Bioware Corp.
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 12, 2002
//::////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int GN_TalentMasterRoutine(int nTalentConstant, object oTarget)
{
	if(GetIsObjectValid(oTarget))
	{
		talent tSpe11_01, tSpe11_02, tSpe11_03, tSpe11_04, tSpe11_05, tSpe11_06, tSpe11_07, tUse;
		int nTalent;
		int bValid = FALSE;
		int bHostile = FALSE;
		if(nTalentConstant == GEN_TALENT_SUPRESS_FORCE)
		{
			nTalent = 0xf021; //Any Area, No Harmful, Dispel, Ranged
		}
		else if(nTalentConstant == GEN_TALENT_REMOVE_POISON)
		{
			bValid = FALSE;
			tSpe11_01 = TalentSpell(FORCE_POWER_HEAL);
			tSpe11_02 = TalentSpell(FORCE_POWER_CURE);
			tSpe11_03 = TalentSpell(67); //Remove Poison Item
			if(GetCreatureHasTalent(tSpe11_01) || GetCreatureHasTalent(tSpe11_02))
			{
				bValid = TRUE;
				if(GetCreatureHasTalent(tSpe11_01))
				{
					tUse = tSpe11_01;
				}
				else
				{
					tUse = tSpe11_02;
				}
			}
			else if(GetCreatureHasTalent(tSpe11_03) && oTarget == OBJECT_SELF)
			{
				bValid = TRUE;
				tUse = tSpe11_03;
			}
			//nTalent = 0xff4f;
		}
		else if(nTalentConstant == GEN_TALENT_HEALING)
		{
			bValid = FALSE;
			GN_MyPrintString("GENERIC DEBUG *************** Starting Heal Talent Checks " + GN_ReturnDebugName(OBJECT_SELF));
			tSpe11_01 = TalentSpell(FORCE_POWER_HEAL);
			tSpe11_02 = TalentSpell(FORCE_POWER_CURE);

			if(GetRacialType(OBJECT_SELF) != RACIAL_TYPE_DROID)
			{
				tSpe11_05 = GetCreatureTalentBest(0x1408, 20);
			}
			else
			{
				tSpe11_05 = TalentSpell(128);
				if(!GetCreatureHasTalent(tSpe11_05))
				{
					tSpe11_05 = TalentSpell(127);
					if(!GetCreatureHasTalent(tSpe11_05))
					{
						tSpe11_05 = TalentSpell(84);
					}
				}
			}

			tSpe11_06 = TalentSpell(FORCE_POWER_DRAIN_LIFE);
			tSpe11_07 = TalentSpell(FORCE_POWER_DEATH_FIELD);
			tUse;
			bValid = FALSE;

			if(GetCreatureHasTalent(tSpe11_01) || GetCreatureHasTalent(tSpe11_02))
			{
				GN_MyPrintString("GENERIC DEBUG *************** I have Heal or Cure");
				bValid = TRUE;
				if(GetCreatureHasTalent(tSpe11_01))
				{
					tUse = tSpe11_01;
				}
				else
				{
					tUse = tSpe11_02;
				}
			}
			else if(GetIsTalentValid(tSpe11_05) ||
					GetCreatureHasTalent(tSpe11_06) ||
					GetCreatureHasTalent(tSpe11_07))
			{
				if(oTarget == OBJECT_SELF)
				{
					if(GetCreatureHasTalent(tSpe11_07) && !IsObjectPartyMember(OBJECT_SELF))
					{
						GN_MyPrintString("GENERIC DEBUG *************** I have Death Field");
						bValid = TRUE;
						bHostile = TRUE;
						tUse = tSpe11_07;
					}
					else if(GetCreatureHasTalent(tSpe11_06) && !IsObjectPartyMember(OBJECT_SELF))
					{
						GN_MyPrintString("GENERIC DEBUG *************** I have Drain Life");
						bValid = TRUE;
						bHostile = TRUE;
						tUse = tSpe11_06;
					}
					else
					{
						GN_MyPrintString("GENERIC DEBUG *************** I have a Med Pack");
						bValid = TRUE;
						tUse = tSpe11_05;
					}
				}
			}
		}
		else if(nTalentConstant == GEN_TALENT_BUFF)
		{
			bValid = FALSE;
			tSpe11_01 = TalentSpell(36); //Master Valor
			tSpe11_02 = TalentSpell(33); //Knight Valor
			tSpe11_03 = TalentSpell(22); //Valor
			int bBuff = FALSE;
			if(GetCreatureHasTalent(tSpe11_01))
			{
				bBuff = TRUE;
				tUse = tSpe11_01;
			}
			else if(GetCreatureHasTalent(tSpe11_02))
			{
				bBuff = TRUE;
				tUse = tSpe11_02;
			}
			else if(GetCreatureHasTalent(tSpe11_03))
			{
				bBuff = TRUE;
				tUse = tSpe11_03;
			}
			GN_MyPrintString("GENERIC DEBUG *************** Spell Effect 22" + GN_ITS(GetHasSpellEffect(22)));
			GN_MyPrintString("GENERIC DEBUG *************** Spell Effect 33" + GN_ITS(GetHasSpellEffect(33)));
			GN_MyPrintString("GENERIC DEBUG *************** Spell Effect 36" + GN_ITS(GetHasSpellEffect(36)));
			if(!GetHasSpellEffect(22) &&
			   !GetHasSpellEffect(33) &&
			   !GetHasSpellEffect(36) &&
			   bBuff == TRUE)
			{
				GN_MyPrintString("GENERIC DEBUG *************** I do have VALOR");
				bValid = TRUE;
			}
			else
			{
				GN_MyPrintString("GENERIC DEBUG *************** I do not have VALOR");
				bValid = FALSE;
			}
		}

		if(bValid == TRUE && bHostile == FALSE)
		{
			GN_MyPrintString("GENERIC DEBUG *************** Clear 2300");
			int nSpell = GetIdFromTalent(tUse);
			GN_MyPrintString("GENERIC DEBUG *************** Spells.2DA ID = " + GN_ITS(nSpell));
			ClearAllActions();
			ActionUseTalentOnObject(tUse, OBJECT_SELF);
			return TRUE;
		}
		else if(bValid == TRUE && bHostile == TRUE)
		{
			oTarget = GN_GetActivePartyMember(TRUE);
			if(GetIsObjectValid(oTarget))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Hostile Heal Targeted On: " + GN_ReturnDebugName(oTarget));
				GN_MyPrintString("GENERIC DEBUG *************** Clear 2400");
				ClearAllActions();
				ActionUseTalentOnObject(tUse, oTarget);
				return TRUE;
			}
		}
		talent tUse2 = GetCreatureTalentBest(nTalent, 20);
		if(GetIsTalentValid(tUse) && !GetHasSpellEffect(GetIdFromTalent(tUse)))
		{
			if(GetIsObjectValid(oTarget))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Clear 2500");
				ClearAllActions();
				GN_MyPrintString("GENERIC DEBUG *************** Target = " + GetName(oTarget) + " Talent Code = " + IntToString(nTalent));
				ActionUseTalentOnObject(tUse, OBJECT_SELF);
				return TRUE;
			}
		}
	}
	GN_MyPrintString("GENERIC DEBUG *************** " + GN_ReturnDebugName(OBJECT_SELF) + " VP = " + GN_ITS(GetCurrentHitPoints())+ "/" + GN_ITS(GetMaxHitPoints()) );
	GN_MyPrintString("GENERIC DEBUG *************** Healing Not Used");
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Last Round Setup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Sets the following struct up so that Last Rounds
	information is easier to access.

	int nLastAction;
	int nLastActionID;
	int nLastTalentCode;
	object oLastTarget;
	int nTalentSuccessCode;
	int nIsLastTargetDebil;
	int nLastCombo;
	int nLastComboIndex;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 26, 2002
//:://////////////////////////////////////////////

void GN_SetLastRoundData()
{
	 talent tTalent;

	 tPR.oLastTarget = GetLastHostileTarget();
	 tPR.nIsLastTargetDebil = GetIsDebilitated(tPR.oLastTarget);
	 tPR.nLastAction = GetLastAttackAction();
	 if(tPR.nLastAction == ACTION_CASTSPELL)
	 {
		tPR.nLastActionID = GetLastForcePowerUsed();
		tPR.nTalentSuccessCode = GetWasForcePowerSuccessful();
		tTalent = TalentSpell(tPR.nLastActionID);
		tPR.nLastTalentCode = GetCategoryFromTalent(tTalent);
	 }
	 else if(tPR.nLastAction == ACTION_ATTACKOBJECT)
	 {
		tPR.nLastActionID = GetLastCombatFeatUsed();
		tPR.nTalentSuccessCode = GetLastAttackResult();
		tTalent = TalentFeat(tPR.nLastActionID);
		tPR.nLastTalentCode = GetCategoryFromTalent(tTalent);
	 }
	 //tPR.nLastCombo = GetLocalNumber(OBJECT_SELF, SW_NUMBER_LAST_COMBO);
	 tPR.nLastComboIndex = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX);
	 tPR.nCurrentCombo = GetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE);
}

//::///////////////////////////////////////////////
//:: Combo Sub Routine
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	This function determines what move to do
	based on the last part of the combo performed.
	int nLastAction;
	int nLastActionID;
	int nLastTalentCode;
	object oLastTarget;
	int nTalentSuccessCode;
	int nIsLastTargetDebil;
	int nLastCombo;
	int nLastComboIndex;
	int nCurrentCombo;
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 27, 2002
//:://////////////////////////////////////////////
talent GN_GetComboMove(int nBoss = FALSE)
{
	int nRand;
	int nCombo;
	talent tUse;
	int nNPC_AI = GetNPCAIStyle(OBJECT_SELF); //Determines how the individual should react in combat
	GN_MyPrintString("GENERIC DEBUG *************** Starting GetComboMove");

	//Is the last combo done?
	if(tPR.nLastComboIndex == 4 || tPR.nLastComboIndex == 0)
	{
		//If so then set the local numbers controlling the combo to 0;
		SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 0);
		SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, 0);
		nRand = d6();
		if(nRand > 0)//This nRand check is place here in case we need to limit combo use later
		{
			//If a Jedi use the jedi routines.
			if(GetLevelByClass(CLASS_TYPE_JEDICONSULAR) > 0 ||
			   GetLevelByClass(CLASS_TYPE_JEDIGUARDIAN) > 0 ||
			   GetLevelByClass(CLASS_TYPE_JEDISENTINEL) > 0)
			{
				nCombo = GN_GetStandardJediCombo(nBoss);

				GN_MyPrintString("GENERIC DEBUG *************** Starting Jedi Combo " + GN_FetchComboString(nCombo));

				SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 1);
				SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);

				return GN_GetNextTalentInCombo(nCombo);
			}
			//If a Droid use these routines
			else if(GetLevelByClass(CLASS_TYPE_COMBATDROID) > 0 ||
					GetLevelByClass(CLASS_TYPE_EXPERTDROID) > 0)
			{
				nCombo = GN_GetStandardDroidCombo(nBoss);
				GN_MyPrintString("GENERIC DEBUG *************** Starting Droid Combo " + GN_FetchComboString(nCombo));
				SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 1);
				SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);

				return GN_GetNextTalentInCombo(nCombo);
			}
			//All others.
			else
			{
				nCombo = GN_GetStandardNPCCombo(nBoss);
				GN_MyPrintString("GENERIC DEBUG *************** Starting NPC Combo " + GN_FetchComboString(nCombo));
				SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_INDEX, 1);
				SetLocalNumber(OBJECT_SELF, SW_NUMBER_COMBO_ROUTINE, nCombo);

				return GN_GetNextTalentInCombo(nCombo);
			}
		}
		else//returning an invalid Talent here will mean action attack.
		{
			return tUse;
		}
	}
	else//if(tPR.nTalentSuccessCode > 0)
	{
		//If the PC is already in a combo then continue that combo
		GN_MyPrintString("GENERIC DEBUG *************** Continuing Combo " + GN_FetchComboString(tPR.nCurrentCombo));
		return GN_GetNextTalentInCombo(tPR.nCurrentCombo);
	}
	return tUse;
}

//::///////////////////////////////////////////////
//:: Check Droid Utility Usage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Checks the target and the droid utility use
	to make sure they are compatible
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 22, 2003
//:://////////////////////////////////////////////
talent GN_CheckDroidUtilityUsage(object oTarget, talent tUse)
{
	int bSwitch;
	GN_MyPrintString("GENERIC DEBUG *************** Starting Droid Talent Double Check");
	if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
	{
		GN_MyPrintString("GENERIC DEBUG *************** Droid Talent is a Spell");
		if(GetIdFromTalent(tUse) == 116 || GetIdFromTalent(tUse) == 117) //STUN RAY
		{
			if(GetRacialType(oTarget) == RACIAL_TYPE_HUMAN)
			{
				return tUse;
			}
			else
			{
				bSwitch = TRUE;
			}
		}
		if(GetIdFromTalent(tUse) == 118 || GetIdFromTalent(tUse) == 119) //SHIELD DISRUPTOR
		{
			if(GetHasSpellEffect(99, oTarget) || GetHasSpellEffect(100, oTarget) || GetHasSpellEffect(101, oTarget) ||
			   GetHasSpellEffect(102, oTarget) || GetHasSpellEffect(103, oTarget) || GetHasSpellEffect(104, oTarget) ||
			   GetHasSpellEffect(105, oTarget) || GetHasSpellEffect(106, oTarget) || GetHasSpellEffect(107, oTarget) ||
			   GetHasSpellEffect(110, oTarget) || GetHasSpellEffect(111, oTarget) || GetHasSpellEffect(112, oTarget) ||
			   GetHasSpellEffect(113, oTarget) || GetHasSpellEffect(114, oTarget) || GetHasSpellEffect(115, oTarget))
			{
				return tUse;
			}
			else
			{
				bSwitch = TRUE;
			}
		}
	}
	if(bSwitch == TRUE)
	{
		talent tFeat = GetCreatureTalentBest(0x1181, 20);
		if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
		{
			return tFeat;
		}
		else
		{
			talent Invalid;
			return Invalid;
		}
	}
	return tUse;
}

//::///////////////////////////////////////////////
//:: Throw Lightsaber Check
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Checks the target and the force power to make
	sure that a lightsaber is not thrown from close
	range.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 24, 2003
//:://////////////////////////////////////////////
talent GN_CheckThrowLightSaberUsage(object oTarget, talent tUse)
{
	int bSwitch = FALSE;
	if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
	{
		if(GetIdFromTalent(tUse) == FORCE_POWER_LIGHT_SABER_THROW || GetIdFromTalent(tUse) == FORCE_POWER_LIGHT_SABER_THROW_ADVANCED)
		{
			GN_MyPrintString("GENERIC DEBUG *************** Lightsaber Throw Check = " + FloatToString(GetDistanceBetween(OBJECT_SELF, oTarget),4,2));
			if(GetDistanceBetween(OBJECT_SELF, oTarget) < 10.0)
			{
				bSwitch = TRUE;
			}
		}
	}
	if(bSwitch == TRUE)
	{
		talent tFeat = GetCreatureTalentBest(0x1104, 20);
		if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
		{
			return tFeat;
		}
		else
		{
			talent Invalid;
			return Invalid;
		}
	}
	return tUse;
}

//::///////////////////////////////////////////////
//:: Check Droid Force Power Usage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Checks the force power and makes sure it can
	be used on a droid.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On:May 12, 2003
//:://////////////////////////////////////////////
talent GN_CheckNonDroidForcePower(object oTarget, talent tUse)
{
	int bSwitch = FALSE;
	if(GetTypeFromTalent(tUse) == TALENT_TYPE_FORCE)
	{
		if(GetIdFromTalent(tUse) == FORCE_POWER_HOLD ||
		   GetIdFromTalent(tUse) == FORCE_POWER_HORROR ||
		   GetIdFromTalent(tUse) == FORCE_POWER_INSANITY ||
		   GetIdFromTalent(tUse) == FORCE_POWER_KILL ||
		   GetIdFromTalent(tUse) == FORCE_POWER_PLAGUE ||
		   GetIdFromTalent(tUse) == FORCE_POWER_SLEEP ||
		   GetIdFromTalent(tUse) == FORCE_POWER_SLOW ||
		   GetIdFromTalent(tUse) == FORCE_POWER_STUN ||
		   GetIdFromTalent(tUse) == FORCE_POWER_WOUND ||
		   GetIdFromTalent(tUse) == FORCE_POWER_AFFLICTION ||
		   GetIdFromTalent(tUse) == FORCE_POWER_CHOKE ||
		   GetIdFromTalent(tUse) == FORCE_POWER_DEATH_FIELD ||
		   GetIdFromTalent(tUse) == FORCE_POWER_DRAIN_LIFE ||
		   GetIdFromTalent(tUse) == FORCE_POWER_FEAR)
		{
			if(GetRacialType(oTarget) == RACIAL_TYPE_DROID)
			{
				bSwitch = TRUE;
			}
		}
	}
	if(bSwitch == TRUE)
	{
		talent tFeat = GetCreatureTalentBest(0x1104, 20);
		if(GetIsTalentValid(tUse) && GetCreatureHasTalent(tUse))
		{
			return tFeat;
		}
		else
		{
			talent Invalid;
			return Invalid;
		}
	}
	return tUse;
}

//::///////////////////////////////////////////////
//:: Play Ambient Animations
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Play the correct animations based on the
	spawn in condition selected.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 4, 2002
//:://////////////////////////////////////////////

void GN_PlayAmbientAnimation()
{
	if(!GetIsInConversation(OBJECT_SELF))
	{
		location lLocal;
		vector vFrnd;
		int nRoll = d2();
		object oFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, nRoll, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
		if(!GetIsObjectValid(oFriend))
		{
			oFriend = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nRoll, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
		}
		object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
		int nHDMe = GetHitDice(OBJECT_SELF);
		int nHDOther = GetHitDice(oFriend);

		if(!GN_CheckShouldFlee() || !GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR))
		{
			if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS))
			{
				vFrnd = GetPosition(oFriend);
				nRoll = d6();
				if(GetIsObjectValid(oFriend) && GetDistanceBetween(oFriend, OBJECT_SELF) < 5.0 && !IsObjectPartyMember(oFriend))
				{
					SetFacingPoint(vFrnd);
					GN_MyPrintString("GENERIC DEBUG *************** Clear 2600");
					ClearAllActions();
					if(nRoll == 1 || nRoll == 2)
					{
						ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 3.0);
					}
					else if(nRoll == 3)
					{
						ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 3.0);
					}
					else if(nRoll == 4)
					{
						ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0);
					}
					else if(nRoll == 5)
					{
						ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
					}
					else if(nRoll == 6)
					{
						ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
					}
				}
				else
				{
					nRoll = d8();
					if(nRoll == 1)
					{
						ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED, 1.0);
					}
					else if(nRoll == 2)
					{
						ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0);
					}
					else if(nRoll == 3)
					{
						ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 3.0);
					}
					else if(nRoll == 4 || nRoll == 5)
					{
						if(GetGender(OBJECT_SELF) == GENDER_MALE)
						{
							GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
							ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 20.4);
							ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
						}
						else if(GetGender(OBJECT_SELF) == GENDER_FEMALE)
						{
							GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
							ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 13.3);
							ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
						}
					}
					else if(nRoll == 6)
					{
						ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
					}
					else if(nRoll == 7)
					{
						ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
					}
					else if(nRoll == 8)
					{
						GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, FALSE);
						ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 5.0);
						ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS, TRUE));
					}
				}
			}
			else if(GN_GetSpawnInCondition(SW_FLAG_AMBIENT_ANIMATIONS_MOBILE))
			{
				nRoll = d8();
				GN_MyPrintString("GENERIC DEBUG *************** Clear 2700");
				ClearAllActions();
				if(nRoll == 1)
				{
					ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 2.0);
				}
				else if(nRoll == 2)
				{
					ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0);
				}
				else if(nRoll == 3)
				{
					//ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 0.75);
					//ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 0.75);
				}
				else if(nRoll == 4)
				{
					ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0);
				}
				else if(nRoll >= 5)
				{
					ActionRandomWalk();
				}
			}
		}
		else if(GN_CheckShouldFlee() && GN_GetSpawnInCondition(SW_FLAG_COMMONER_BEHAVIOR))
		{
			GN_CommonAI();
		}
	}
}
//::///////////////////////////////////////////////
//:: Commoner AI
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	If ever engaged in combat they will flee.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 18, 2002
//:://////////////////////////////////////////////
int GN_CommonAI()
{
	GN_MyPrintString("GENERIC DEBUG *************** Start Commoner AI");
	object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
	object oFlee;
	int bValid = TRUE;
	int nIdx = 1;

	object oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL);
	while(GetIsObjectValid(oNeutral) && bValid == TRUE)
	{
		if(GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_1 ||
			GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_2 ||
			GetStandardFaction(oNeutral) == STANDARD_FACTION_INSANE)
		{
			if(GetDistanceBetween(OBJECT_SELF, oNeutral) <= 20.0)
			{
				oFlee = oNeutral;
				bValid = FALSE;
			}
		}
		else
		{
			nIdx++;
			oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nIdx);
		}
	}

	if(GetIsObjectValid(oEnemy))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Clear 2710");
		ClearAllActions();
		ActionMoveAwayFromObject(oEnemy, TRUE, 20.0);
		DelayCommand(0.2, ActionDoCommand(GN_ActionDoPostDCRChecks()));
		return TRUE;
	}
	else if(GetIsObjectValid(oFlee))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Object Flee = " + GN_ReturnDebugName(oFlee));
		GN_MyPrintString("GENERIC DEBUG *************** Clear 2720");
		ClearAllActions();
		ActionMoveAwayFromObject(oFlee, TRUE, 20.0);
		DelayCommand(0.2, ActionDoCommand(GN_ActionDoPostDCRChecks()));
		return TRUE;
	}
	return FALSE;
}
//::///////////////////////////////////////////////
//:: Should Commoner Flee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Checks a number of conditions for a commoner
	to flee.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 20, 2002
//:://////////////////////////////////////////////

int GN_CheckShouldFlee()
{
	int nIdx = 1;
	object oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	object oHostile = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	while(GetIsObjectValid(oNeutral) || GetIsObjectValid(oHostile))
	{
		if(GetIsObjectValid(oHostile))
		{
			return TRUE;
		}
		if(GetIsObjectValid(oNeutral))
		{
			if(GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_1 ||
				GetStandardFaction(oNeutral) == STANDARD_FACTION_HOSTILE_2 ||
				GetStandardFaction(oNeutral) == STANDARD_FACTION_INSANE)
			{
				return TRUE;
			}
		}
		nIdx++;
		oNeutral = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_NEUTRAL, OBJECT_SELF, nIdx, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
	}
	return FALSE;
}

//::///////////////////////////////////////////////
//:: Reset Deactivated Droid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Resets a Droid to his deactivated animation
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 25, 2003
//:://////////////////////////////////////////////

void GN_ResetDroidDeactivationState(object oDroid = OBJECT_SELF)
{
	/*
	GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, FALSE);
	ClearAllActions();
	ActionPlayAnimation(ANIMATION_LOOPING_DEACTIVATE, 1.0, 900.0);
	ActionDoCommand(GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, TRUE));
	*/
	ClearAllActions();
	ActionPlayAnimation(ANIMATION_LOOPING_DEACTIVATE, 1.0, -1.0);
	GN_SetSpawnInCondition(SW_FLAG_EVENT_ON_HEARTBEAT, FALSE);
}

//::///////////////////////////////////////////////
//:: Determine Attack Target
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	Checks the nearest seen target and oIntruder
	for a valid attack target.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 7, 2002
//:://////////////////////////////////////////////
object GN_DetermineAttackTarget(object oIntruder = OBJECT_INVALID)
{
	GN_MyPrintString("GENERIC DEBUG *************** Starting: Determine Attack Target");

	int nPartyAI = GetPartyAIStyle();
	int nNPC_AI = GetNPCAIStyle(OBJECT_SELF);
	object oTarget;
	object oLastTarget = GetLastHostileTarget();

	GN_MyPrintString("GENERIC DEBUG *************** Intruder = " + IntToString(GetIsObjectValid(oIntruder)) + " Last Target = " + IntToString(GetIsObjectValid(oLastTarget)));

	if(GetIsObjectValid(oIntruder) && !GetIsDead(oIntruder) && !GetIsDebilitated(oIntruder))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Intruder Target Returned = " + ObjectToString(oIntruder));
		return oIntruder;
	}
	else if(GetIsObjectValid(oLastTarget) && !GetIsDead(oLastTarget) && !GetIsDebilitated(oLastTarget))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Last Target Returned = " + ObjectToString(oIntruder));
		return oLastTarget;
	}
	else
	{
		if(nPartyAI == PARTY_AISTYLE_AGGRESSIVE)
		{
			int nCnt = 1;
			GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 249");
			object oATarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
			oTarget = oATarget;
			while(!GetIsDebilitated(oTarget) && GetIsObjectValid(oTarget))
			{
				nCnt++;
				oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, nCnt, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
			}
			if(!GetIsObjectValid(oTarget) && GetIsObjectValid(oATarget))
			{
				oTarget = oATarget;
			}
		}
		else if(nPartyAI == PARTY_AISTYLE_DEFENSIVE)
		{
			int nCnt = 0;
			object oHostile;
			while(!GetIsObjectValid(oHostile) && nCnt < 3)
			{
				oHostile = GetLastHostileActor(GetPartyMemberByIndex(nCnt));
				nCnt++;
			}
			if(GetIsObjectValid(oHostile))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 262");
				oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
			}
			else
			{
				oHostile = GetLastHostileTarget(GetPartyMemberByIndex(0));
				if(GetIsObjectValid(oHostile))
				{
					GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 269");
					oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
				}
			}
		}
		else if(nPartyAI != PARTY_AISTYLE_PASSIVE)
		{
			GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 275");
			oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
		}
		else
		{
			GN_MyPrintString("GENERIC DEBUG *************** Getting nearest target - 279");
			oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
		}
	}
	if(GetIsObjectValid(oTarget))
	{
		GN_MyPrintString("GENERIC DEBUG *************** Attack Target From Determine Attack Target = " + GN_ReturnDebugName(oTarget));
		return oTarget;
	}
	GN_MyPrintString("GENERIC DEBUG *************** No Attack Targets Found");
	return OBJECT_INVALID;
}

//::///////////////////////////////////////////////
//:: Return Talent Code
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
	This function determines the state of the selected
	attack target and what should be done to them.
	If the target is last rounds target then they
	will try not to use failed attack types.

	NOTE: The functionality for area attacks and
	specialized talent use will be coded here.
	For the time being, I will just try to get
	the appropriate cascade of talents being used.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 14, 2002
//:://////////////////////////////////////////////

int GN_GetAttackTalentCode(object oTarget)
{
	GN_MyPrintString("GENERIC DEBUG *************** Starting: Getting Talent Attack Code");

	int nPreviousTalentCode;
	//GN_MyPrintString("GENERIC DEBUG *************** Cooked Return Code  0x0100");

	GN_MyPrintString("GENERIC DEBUG *************** Debilitated = " + IntToString(GetIsDebilitated(oTarget)));

	if(!GetIsDead(oTarget) && GetIsObjectValid(oTarget) && !GetIsDebilitated(oTarget) && GetLastHostileTarget() == oTarget)
	{
		//GN_MyPrintString("GENERIC DEBUG *************** Talent Code: Before GetPreviousTalent");
		nPreviousTalentCode = GN_GetPreviousTalentCode();
		//GN_MyPrintString("GENERIC DEBUG *************** Talent Code: Before If Compare");
		if(GN_CompareTalents(nPreviousTalentCode, 0xf2ff))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Talent Code: 0xff1f");
			if(GN_GetHasViableTalent(0xff1f))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Return Code 0xff1f");
				return 0xff1f;
			}
			if(GN_GetHasViableTalent(0x0100))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
				return 0xf1ff;
			}
		}
		else if(GN_CompareTalents(nPreviousTalentCode, 0xff1f))
		{
			if(GN_GetHasViableTalent(0xf1f0))
			{
				GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
				return 0xf1ff;
			}
		}
	}
	else if(!GetIsDead(oTarget) && GetIsObjectValid(oTarget) && !GetIsDebilitated(oTarget) && GetLastHostileTarget() != oTarget)
	{
		if(GN_GetHasViableTalent(0xf3ff))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf3ff");
			return 0xf3ff;
		}
		if(GN_GetHasViableTalent(0xf2ff))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf2ff");
			return 0xf2ff;
		}
		if(GN_GetHasViableTalent(0xff1f))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xff1f");
			return 0xff1f;
		}
		if(GN_GetHasViableTalent(0xf1ff))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
			return 0xf1ff;
		}
	}
	else if(!GetIsDead(oTarget) && GetIsObjectValid(oTarget) && GetIsDebilitated(oTarget))
	{
		if(GN_GetHasViableTalent(0xf1ff))
		{
			GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xf1ff");
			return 0xf1ff;
		}
	}
	GN_MyPrintString("GENERIC DEBUG *************** Return Code  0xffff");
	return 0xffff;
}

//this function was cut from the generics but is needed
//here to keep scripts from breaking.
void GN_SetDayNightPresence(int nPresenceSetting)
{

}
