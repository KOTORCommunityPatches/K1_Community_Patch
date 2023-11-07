//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik082.dlg in tar_m08aa (Taris Davik's Estate).
	
	This script fires on the first node of the scene where the party enters the
	hangar in Davik's Estate to steal the Ebon Hawk. The vanilla script used the
	ActionLockObject function to lock the door, but that apparently doesn't work.
	That meant that the door could be re-opened after the scene finished, causing
	the whole scene to play again. The function has been switched to the SetLocked
	function instead, which is what is typically used with doors elsewhere. The
	party herding portion of the script has also been streamlined, since there was
	some unnecessary bloat.
	
	Issue #708: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/708
	
	DP 2023-11-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oCalo = GetObjectByTag("Calo082", 0);
	object oDoor = GetObjectByTag("tar08_hangardoor", 0);
	object oWP_Dav = GetObjectByTag("tar08_wpdavika", 0);
	object oWP_Cal = GetObjectByTag("tar08_wpcaloa", 0);
	object oExp;
	location lPC = GetLocation(GetObjectByTag("tar08_hangara", 0));
	location lPM1 = GetLocation(GetObjectByTag("tar08_hangarb", 0));
	location lPM2 = GetLocation(GetObjectByTag("tar08_hangarc", 0));
	int nCnt;
	
	ActionPauseConversation();
	
	nCnt = 1;
	
	while (GetIsObjectValid(oExp = GetNearestObjectByTag("tar08_wpexplosion", OBJECT_SELF, nCnt)) && nCnt < 4)
		{
			DelayCommand((nCnt - 1) * 2.0, SignalEvent(oExp, EventUserDefined(2000)));
			
			nCnt++;
		}
	
	AssignCommand(oDoor, ActionCloseDoor(oDoor));
	DelayCommand(1.0, SetLocked(oDoor, TRUE));
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	AssignCommand(oCalo, ActionMoveToObject(oWP_Cal, TRUE));
	ActionMoveToObject(oWP_Dav, TRUE);
	
	ActionResumeConversation();
}
