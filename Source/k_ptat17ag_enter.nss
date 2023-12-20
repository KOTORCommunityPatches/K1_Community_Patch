//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for tat_m17ag (Tatooine Czerka Office).
	
	This is the module OnClientEnter (IFO rather than the regular ARE OnEnter).
	The vanilla script has a one second delay when spawning in Griff, which has
	him visibly pop into existence right in front of the player. There's no easy
	way to completely mask this without the use of a DLG, so now the world fade-in
	is held until he is spawned and starts his regular conversation. The added
	script in the DLG jumps the party into position.
	
	See also cp_tat17_griftlk.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2023-12-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tat"

void main() {
	
	if (GetGriffGreetaGlobal() && !GetGriffSpawnLocal())
		{
			object oGriff;
			
			HoldWorldFadeInForDialog();
			
			oGriff = CreateObject(OBJECT_TYPE_CREATURE, "tat17_griff_01", GetLocation(GetWaypointByTag("tat17_griffspawn")));
			
			SetGriffSpawnLocal(TRUE);
			
			DelayCommand(1.0, AssignCommand(oGriff, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
	
	if (GetGlobalNumber("Mis_MissionTalk") == 14 && !GetGlobalBoolean("Tat_Greet_Griff"))
		{
			SetGlobalBoolean("Tat_Greet_Griff", TRUE);
		}
}
