//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine script for tar10_vulkpool.utc / tar10_vulkpoo005.utc in tar_m10aa
	(Taris Black Vulkar Base (Upper)).
	
	This is the UserDefine script for the two lieutenants in the upper Vulkar base
	that carry the passcard quest item. It replaces the generic vanilla UserDefine.
	Since there's no reason to drop duplicate items, this script in conjunction
	with a custom OnDeath takes care of destroying the second passcard if the PC
	already picked one up, or if one lieutenant already died and dropped his.
	
	See also cp_tar10_vlkpl_d.
	
	Issue #364: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/364
	
	DP 2021-10-25																*/
//////////////////////////////////////////////////////////////////////////////////

void ReturnToBase(string sTag = "wp_homebase") {
	
	if (GetCommandable(OBJECT_SELF))
		{
			ClearAllActions();
			CancelCombat(OBJECT_SELF);
			ActionMoveToObject(GetNearestObjectByTag("wp_homebase"), TRUE, 3.0f);
			ActionDoCommand( SetCommandable(TRUE, OBJECT_SELF));
			SetCommandable(FALSE);
		}
}

void main()
{
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 100) // Custom Event - Destroy pass card
		{
			DestroyObject(GetItemPossessedBy(OBJECT_SELF, "tar10_mechid"));
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
	else if (nUser == 1011) // DIALOGUE END
		{
		
		}
	else if (nUser == 1100) // HOSTILE RETREAT
		{
			ReturnToBase();
		}
}
