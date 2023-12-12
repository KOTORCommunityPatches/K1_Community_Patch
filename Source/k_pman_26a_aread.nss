////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Area UserDefine in manm26aa (Manaan Ahto West).
	
	This is the Ahto West UserDefine. It is used to perform a number of functions
	before and after the Sunry trial sequence. The primary changes are in the post-
	trial cleanup. Now the judges get refaced, the party gets herded, and the guard
	gets properly jumped back to his post outside the jail door.
	
	Updated 2023-12-12 to move locking the player's orientation back into the DLG
	and adding an unlock for it in the cleanup event.
	
	See also k_pman_murder81, k_pman_trial05, k_pman_wit02.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20 / DP 2023-12-12												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void PlaceTrialNPC(string sTag) {
	object oNPC = GetObjectByTag(sTag);
	object oWP = GetObjectByTag("trial_" + sTag);
	object oFace = GetObjectByTag("man26_seljud1");
	object oSpawn;
	
	if (GetIsObjectValid(oNPC))
		{
			AssignCommand(oNPC, JumpToObject(oWP));
			DelayCommand(0.1, CP_FaceNPC(oNPC, oFace));
		}
		else
			{
				oSpawn = CreateObject(OBJECT_TYPE_CREATURE, sTag, GetLocation(oWP));
				CP_FaceNPC(oSpawn, oFace);
			}
}

void main() {
	
	object oSunry = GetObjectByTag("man26_sunry");
	object oElora = GetObjectByTag("man26_elora");
	object oGuard = GetObjectByTag("man26_selguard");
	object oWP1 = GetObjectByTag("man26a_eloraleave");
	object oWP2 = GetObjectByTag("man26a_sunryleave");
	int nEvent = GetUserDefinedEventNumber();
	
	switch (nEvent)
		{
			case 100:	// Sunry trial pre-commencement setup, NPC spawn/jump (man26_selward.dlg R7).
				{
					DestroyObject(GetObjectByTag("man26_repac"));
					DestroyObject(GetObjectByTag("man26a_inittrig03"));
					
					PlaceTrialNPC("man26_ignus");
					PlaceTrialNPC("man26_firith");
					PlaceTrialNPC("man26_gluupor");
					PlaceTrialNPC("man26_sithac");
					PlaceTrialNPC("man26_elora");
					PlaceTrialNPC("man26_sunry");
					PlaceTrialNPC("man26_selguard");
				}
			break;
			
			case 110:	// Sunry trial commences (man26_selward.dlg R8).
				{
					object oPC = GetFirstPC();
					object oPM1 = CP_GetPartyMember(1);
					object oPM2 = CP_GetPartyMember(2);
					object oFace = GetObjectByTag("man26_seljud1");
					object oInvis = GetObjectByTag("man26_trialobj");
					
					NoClicksFor(1.0);
					
					SetPartyLeader(NPC_PLAYER);
					ExecuteScript("k_pman_npcstop", oPM1);
					ExecuteScript("k_pman_npcstop", oPM2);
					AssignCommand(oPC, JumpToObject(GetObjectByTag("trial_pc")));
					AssignCommand(oPM1, JumpToObject(GetObjectByTag("trial_npc1")));
					AssignCommand(oPM2, JumpToObject(GetObjectByTag("trial_npc2")));
					DelayCommand(0.1, CP_FaceNPC(oPC, oFace));
					DelayCommand(0.1, CP_FaceNPC(oPM1, oFace));
					DelayCommand(0.1, CP_FaceNPC(oPM2, oFace));
					
					DelayCommand(0.5, SignalEvent(oInvis, EventUserDefined(10)));
				}
			break;
			
			case 120:	// Appears unused? Global version of k_pman_trial03 (man26_trial.dlg E11) points to this, but it is overridden by a module version.
						// Sunry trial ending when he is found innocent.
				{
					AssignCommand(oSunry, ActionForceMoveToObject(oWP2));
					AssignCommand(oElora, ActionForceMoveToObject(oWP1));
				}
			break;
			
			case 130:	// Sunry trial post-conclusion cleanup (man26_trial.dlg R11/R29/R39).
				{
					object oGuard = GetObjectByTag("man26_selguard");
					object oJudge;
					int nIdx = 1;
					location lPC = Location(Vector(55.52,-4.25,59.16), 0.00);
					location lPM1 = Location(Vector(54.31,-3.25,59.16), 0.00);
					location lPM2 = Location(Vector(54.31,-5.25,59.16), 0.00);
					
					SetGlobalFadeOut();
					
					NoClicksFor(3.0);
					
					SetLockOrientationInDialog(GetFirstPC(), FALSE);
					
					DestroyObject(GetObjectByTag("man26_ignus"));
					DestroyObject(GetObjectByTag("man26_firith"));
					DestroyObject(GetObjectByTag("man26_gluupor"));
					DestroyObject(GetObjectByTag("man26_sithac"));
					DestroyObject(GetObjectByTag("man26_elora"));
					DestroyObject(GetObjectByTag("man26_sunry"));
					
					AssignCommand(oGuard, ActionJumpToObject(GetObjectByTag("POST_man26_selguard")));
					AssignCommand(oGuard, ActionDoCommand(SetFacing(DIRECTION_WEST)));
					AssignCommand(oGuard, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
					
					oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
					
					while (GetIsObjectValid(oJudge))
						{
							AssignCommand(oJudge, ActionDoCommand(SetFacing(DIRECTION_WEST)));
							AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
							
							nIdx++;
							
							oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
						}
					
					SetLocked(GetObjectByTag("man26aa_door02"), TRUE);
					
					DelayCommand(1.5, CP_PartyHerder(lPC, lPM1, lPM2));
					
					DelayCommand(3.0, SetGlobalFadeIn(0.0, 4.0));
				}
			break;
		}
}
