//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_10czerk_01.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is an added script that fires on all the exit nodes of the Protocol
	Officer's conversation. It walks her back to her starting position if she
	has moved away from it to take Gaffi sticks from the player. It also forces
	her and the player to play an animation to prevent both of them freezing
	post-conversation apparently caused by the added initial jump.
	
	See also cp_tat17_crktlk.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2022-07-30																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	location lCzOff = Location(Vector(1.91,6.85,1.39), -50.00);
	location lSelf = GetLocation(OBJECT_SELF);
	
	NoClicksFor(0.2);
	
	if (GetDistanceBetweenLocations(lCzOff, lSelf) >= 0.5)
		{
			ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
			DelayCommand(5.0, SetFacing(130.0));
			DelayCommand(5.1, ActionMoveToLocation(lCzOff, FALSE));
			DelayCommand(5.2, ActionDoCommand(SetFacing(-50.0)));
		}
		else
			{
				ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
			}
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
}
