////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10aa (Taris Black Vulkar Base Upper
	Level).

	This script is fired to move the player to the room where they spend the
	night before the swoop race. Just a minor change to set the facing of the
	PC so they aren't pointing in an odd direction and preventing the player
	from skipping the line, which can cause some cutscene screwiness.

	Issue #62: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/62
	
	DP 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////


// Prototypes
void RemoveParty();

void RemoveParty() {
	
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	location lNewJump = Location(Vector(184.297,132.0,2.25), -90.0);
	object oVulkSpwn = GetObjectByTag("tar11_wpcsvulkar", 0);
	
	int int1 = 0;
	
	while ((int1 <= 8))
		{
			RemovePartyMember(int1);
			(int1++);
		}
		
	DestroyObject(oPM1, 0.0, 1, 0.0);
	DestroyObject(oPM2, 0.0, 1, 0.0);
	ClearAllActions();
	ActionJumpToLocation(lNewJump);
	CreateObject(OBJECT_TYPE_CREATURE, "tar11_csvulkar", GetLocation(oVulkSpwn), FALSE);
}

void main() {

	object oPCSlp = GetObjectByTag("tar11_wppcsleep", 0);
	location lLookAt = Location(Vector(184.297,132.0,2.25), -90.0);
	
	NoClicksFor(15.0);
	SetGlobalFadeOut(6.0, 1.0, 0.0, 0.0, 0.0);
	DelayCommand(7.0, AssignCommand(GetFirstPC(), RemoveParty()));
	DelayCommand(7.25, AssignCommand(GetFirstPC(), ActionMoveToObject(oPCSlp, FALSE, 0.5)));
	DelayCommand(7.75, AssignCommand(GetFirstPC(), SetFacingPoint(GetPositionFromLocation(lLookAt))));
	ActionPauseConversation();
	ActionWait(8.0);
	ActionResumeConversation();
}
