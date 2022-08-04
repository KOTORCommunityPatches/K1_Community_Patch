//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas24_jolee_02.dlg in kas_m24aa (Kashyyyk Upper Shadowlands).

	This script is fired at the end of NPC Jolee's DLG when he joins the party.
	It opens up the party selection panel, adds Party Jolee and destroys NPC
	Jolee. In the vanilla game, you can visibly see the NPC Jolee fade out with
	Party Jolee standing next to you. It seems all script functions are paused
	while the party selection screen is active, so its not possible to destroy
	him in front of the player while the screen is masking it. The solution is
	to jump NPC Jolee behind some scenery before knocking him on the head, and
	adding in a brief fade out/in to hide the jump.
	
	Updated 2022-08-04 to now jump party Jolee into the position stunt Jolee
	was previously standing in for a bit more consistency.
	
	Issue #122: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/122

	DP 2019-05-20 / DP 2022-08-04												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_JoleeJump() {
	object oPC = GetFirstPC();
	object oJolee;
	int nCnt = 1;
	location lJmp = Location(Vector(147.3,140.8,7.0), 17.37);
	
	oJolee = GetNearestObjectByTag("jolee", oPC, nCnt);
	
	while (GetIsObjectValid(oJolee))
		{
			if (IsObjectPartyMember(oJolee))
				{
					CP_PartyJump(oJolee, lJmp);
					DelayCommand(0.25, CP_FaceNPC(oJolee, oPC));
				}
			
			if (!IsObjectPartyMember(oJolee))
				{
					DelayCommand(5.0, DestroyObject(oJolee));
				}
			
			nCnt++;
			
			oJolee = GetNearestObjectByTag("jolee", oPC, nCnt);
		}
}

void main() {
	
	location lWoodshed = Location(Vector(83.0,142.0,5.0), 0.0);
	
	SetGlobalFadeOut();
	
	// Take stunt Jolee out behind the wood shed.
	JumpToLocation(lWoodshed);
	
	SetGlobalBoolean("G_JoleeJoined", TRUE);
	
	AddAvailableNPCByTemplate(NPC_JOLEE, "p_jolee");
	
	// Force Jolee as a required party member. Fire an exit script that jumps the party
	// version of Jolee into the spot stunt Jolee was standing.
	ShowPartySelectionGUI("", NPC_JOLEE, -1);
	
	// Jump party Jolee to the place stunt Jolee was standing, give stunt Jolee the Old Yeller treatment.
	DelayCommand(0.5, CP_JoleeJump());
	
	DelayCommand(1.0, SetGlobalFadeIn(0.5, 0.5));
}
