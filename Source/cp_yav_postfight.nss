//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by yav47_suvam.dlg in liv_m99aa (Yavin Station).
	
	This is an added script that fires on the first node of Suvam's conversation
	once combat with the Trandos ends. The party and Suvam are now jumped into
	position for cleaner framing.
	
	Issue #528: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/528
	
	DP 2021-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_ClearNPC(object oNPC) {
	CancelCombat(oNPC);
	AssignCommand(oNPC, ClearAllEffects());
	AssignCommand(oNPC, ClearAllActions());
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSuvam = GetObjectByTag("yav47_suvam", 0);
	object oWP0 = GetObjectByTag("wp204", 0);
	object oWP1 = GetObjectByTag("wp205", 0);
	object oWP2 = GetObjectByTag("wp206", 0);
	location lSuvam = Location(Vector(7.07,90.66,7.23), 270.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(1.0, 1.5);	
	
	NoClicksFor(2.0);
	
	CP_ClearNPC(oPC);
	CP_ClearNPC(oPM1);
	CP_ClearNPC(oPM2);
	
	DelayCommand(0.2, UT_TeleportWholeParty(oWP0, oWP1, oWP2));
	
	DelayCommand(0.75, CP_FaceNPC(oPC, oSuvam));
	DelayCommand(0.75, CP_FaceNPC(oPM1, oSuvam));
	DelayCommand(0.75, CP_FaceNPC(oPM2, oSuvam));
	
	CP_PartyJump(oSuvam, lSuvam);
	DelayCommand(0.75, CP_FaceNPC(oSuvam, oPC));
}
