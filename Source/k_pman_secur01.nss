//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine forman27_sithdip.utc in manm27aa (Manaan Sith Base).
	
	This is the revised OUD for the Sith diplomat. The original script was not
	formatted as an OUD, but presumably fired because only a single event (0)
	was called. This has now been changed to the proper formatting, and an
	additional event added for use later in the scene.
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, cp_man27_lieufce, k_pman_27_init01,
	k_pman_secur04, k_pman_secur09, k_pman_sith02.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 27)
		{
			object oWP = GetObjectByTag("POST_man27_sithdip", 0);
			object oLieu = GetObjectByTag("man27_sthlieu", 0);
			
			ActionMoveToObject(oWP, FALSE, 0.5);
			ActionDoCommand(SignalEvent(oLieu, EventUserDefined(100)));
		}
	else if (nUser == 28)
		{
			ActionEquipMostDamagingMelee();
			ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
		}
	else if (nUser == 1001) // HEARTBEAT
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
}
