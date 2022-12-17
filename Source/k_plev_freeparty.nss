//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_detcompdlg.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is a reconstruction of the vanilla script that fires when the chosen
	jail breaker on the Leviathan opens the torture chamber and brig doors. The
	original would spawn a stunt version of Canderous that was wearing plain
	clothes, regardless of what the real Canderous was wearing if he was the
	chosen jail breaker. This has now been switched to use the party table
	version of him if he was the jail breaker.
	
	Issue #569: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/569
	
	DP 2022-12-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oTrtDoor = GetObjectByTag("lev40_celldoor", 0);
	object oPtyDoor = GetObjectByTag("lev40_partycelldoor", 0);
	object oGrndZero = GetObjectByTag("lev40_groundzero", 0);
	object oInvis = GetObjectByTag("lev40_freetalker", 0);
	object oPCJump = GetWaypointByTag("lev40_wppcesc");
	object oForceCage;
	int nJailBreaker = GetGlobalNumber("Lev_Escape");
	int nCnt;
	location lCand = Location(Vector(22.88,55.73,9.00), -90.00);
	
	NoClicksFor(0.3);
	
	SetGlobalFadeOut();
	
	SetGlobalBoolean("LEV_RESCUE", TRUE);
	SetGlobalNumber("LEV_ELEVATOR", 1);
	
	// Kill any remaining mooks in the main corridor that may have been stealthed past.
	SignalEvent(oGrndZero, EventUserDefined(2000));
	
	// Open the doors to the party cell and torture chamber.
	AssignCommand(oPtyDoor, ActionOpenDoor(oPtyDoor));
	AssignCommand(oTrtDoor, ActionOpenDoor(oTrtDoor));
	
	// Deactivate the force cages in the torture chamber.
	nCnt = 0;
	
	while (nCnt < 3)
		{
			oForceCage = GetObjectByTag("lev40_tortcage", nCnt);
			
			AssignCommand(oForceCage, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
			
			nCnt++;
		}
	
	// Switch controlled character from the jail breaker to the PC.
	SwitchPlayerCharacter(NPC_PLAYER);
	
	// Jump the PC to their scene starting point.
	AssignCommand(GetFirstPC(), ActionJumpToObject(oPCJump));
	
	// Spawn Canderous for the following cutscene.
	if (nJailBreaker == 4)
		{
			// If he was the jail breaker, use the party table version to preserve any equipped gear.
			UT_SpawnAvailableNPC(NPC_CANDEROUS, lCand);
		}
		else
			{
				// Otherwise use a stunt version with plain clothing.
				UT_CreateObject(OBJECT_TYPE_CREATURE, "p_cand", lCand);
			}
	
	DelayCommand(0.1, AssignCommand(oInvis, ActionStartConversation(oInvis, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
}
