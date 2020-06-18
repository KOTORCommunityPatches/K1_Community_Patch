//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnUserDefine for tar03_swoopie0.utc/tar03_swoopie1.utc/tar03_swoopie2.utc in
	tar_m03af (Taris Swoop Platform).
	
	This is the OUD for the three swoop fans that are spawned in to cheer for the
	player during the finale scene of the Taris swoop race. In the vanilla scene,
	they are destroyed off-screen on the very next node when the player is jumped
	forward. They have now also been jumped, so they get an added OUD event that
	has them flee the area along with the other civilians at the end of the scene.
	
	See also cp_tar03_brejeqp, cp_tar03_brejfce, k_ptar_brejikatk, k_ptar_brejik_sp,
	k_ptar_dieswoopy.
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	DP 2020-06-18																*/
//////////////////////////////////////////////////////////////////////////////////

void RunAway() {
	location lExit = Location(Vector(252.89,221.233,8.25), 0.0);
	
	ActionMoveToLocation(lExit, TRUE);
	ActionDoCommand(SetCommandable(TRUE));
	ActionDoCommand(DestroyObject(OBJECT_SELF));
	SetCommandable(FALSE);
}

void main() {
   
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 100) // CUSTOM
		{
			float fRand = (IntToFloat(Random(20)) / 20.0) + (IntToFloat(Random(5)) / 5.0);
			
			DelayCommand(fRand, RunAway());
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
			if (GetCommandable(OBJECT_SELF))
				{
					ClearAllActions();
					CancelCombat(OBJECT_SELF);
					ActionMoveToObject(GetNearestObjectByTag("wp_homebase"), TRUE, 3.0);
					ActionDoCommand( SetCommandable(TRUE, OBJECT_SELF));
					SetCommandable(FALSE);
				}
		}
	else if (nUser == 2000) // CUSTOM
		{
			float fRand1 = IntToFloat((Random(1) + 1));
			float fRand2 = IntToFloat((Random(3) + 1));
			float fRand3 = IntToFloat((Random(5) + 1));
			
			ClearAllActions();
			
			DelayCommand(fRand1, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0, 0.0));
			DelayCommand(fRand2, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0, 0.0));
			DelayCommand(fRand3, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0, 0.0));
		}
}
