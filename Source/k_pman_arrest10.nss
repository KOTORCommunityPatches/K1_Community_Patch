////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarb.dlg in manm26aa (Manaan Ahto West).
	
	This script fires in the player's trial post-Sith Base. It does the initial
	courtroom setup under the cover of the fade-out, jumping the player from their
	jail cell, moving the Sith and Republic lawyers out of the way, spawning some
	guard droids, and jumping the Arbiter if he is representing the player. Now it
	also faces the judges and locks their orientation, as is also done during the
	Sunry trial, to prevent any facing issues during the scene. The Arbiter also
	gets a facing and has his orientation locked. His commands are now all directly
	issued as actions (since he is the DLG owner) so that they are added to his
	action stack in the proper order and the script doesn't resume the conversation
	too early.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
 	
	object oRepLaw = GetObjectByTag("man26_repac", 0);
 	object oSithLaw = GetObjectByTag("man26_sithac", 0);
	object oJudge;
	int nIdx = 1;
	string sDroid1 = "man_traildrd01";
	string sDroid2 = "man_traildrd02";
 	
	ActionPauseConversation();
	
	NoClicksFor(2.0);
	
	AssignCommand(GetFirstPC(), JumpToObject(GetObjectByTag("arrest_player_01", 0)));
	
	UT_CreateObject(OBJECT_TYPE_CREATURE, sDroid1, GetLocation(GetWaypointByTag("POST_" + sDroid1)));
	UT_CreateObject(OBJECT_TYPE_CREATURE, sDroid2, GetLocation(GetWaypointByTag("POST_" + sDroid2)));
 	
	AssignCommand(oRepLaw, JumpToObject(GetObjectByTag("wp_man26_replaw2", 0)));
 	AssignCommand(oSithLaw, JumpToObject(GetObjectByTag("wp_man26_sithlaw2", 0)));
	
	oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
	
	while (GetIsObjectValid(oJudge))
		{
			AssignCommand(oJudge, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("arrest_player_01")))));
			AssignCommand(oJudge, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
			AssignCommand(oJudge, ActionDoCommand(SetLockOrientationInDialog(oJudge, TRUE)));
			
			nIdx++;
			
			oJudge = GetObjectByTag("man26_seljud" + IntToString(nIdx));
		}
	
	if (GetGlobalBoolean("MAN_SARBITER"))
		{
			ActionDoCommand(SetLockOrientationInDialog(OBJECT_SELF, TRUE));
			ActionJumpToObject(GetObjectByTag("wp_man26_sithlaw", 0));
			ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("man26_seljud1"))));
			ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
			ActionWait(1.0);
			ActionResumeConversation();
		}
		else
			{
				ActionWait(1.0);
				ActionResumeConversation();
			}
}
