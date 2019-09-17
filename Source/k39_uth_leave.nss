////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor39_utharwynn.dlg in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This script is fired on the exit node if Uthar is non-hostile. It walks him
	out and destroys him. However, since the door on the other side of the acid
	river was closed and locked to stop the player going very far during the
	previous fight, it has to be opened for him to get to his destination. There
	tends to be a momentary pathing issue while the door is still opening, causing
	him to rotate in place. In order to smooth this out, he is now commanded to
	move to the door and open it before proceeding to the exit.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-10                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oTrap = GetObjectByTag("G_T_TRAP002", 0);
	object oDoorExit = GetObjectByTag("kor39_kor36", 0);
	object oDoorAcid = GetObjectByTag("kor39_dooracid", 0);
	object oDoorStarMap = GetObjectByTag("k39_door_starmap", 0);
	object oWP_Exit = GetObjectByTag("k39_way_yuthexit", 0);
	
	SetGlobalNumber("KOR_FINAL_TEST", 6);
	
	SetLocked(oDoorExit, FALSE);
	SetLocked(oDoorAcid, FALSE);
	SetLocked(oDoorStarMap, FALSE);
	
	if (GetIsObjectValid(oTrap))
		{
			DestroyObject(oTrap, 0.0, TRUE);
		}
	
	ActionMoveToObject(oDoorAcid);
	ActionPlayAnimation(ANIMATION_FIREFORGET_PERSUADE);
	ActionDoCommand(DoDoorAction(oDoorAcid, DOOR_ACTION_OPEN));
	ActionWait(1.5);
	ActionMoveToObject(oWP_Exit);
	ActionDoCommand(DestroyObject(OBJECT_SELF));
	SetCommandable(FALSE, OBJECT_SELF);
}
