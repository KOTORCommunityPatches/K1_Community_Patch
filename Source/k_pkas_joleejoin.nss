////////////////////////////////////////////////////////////////////////////////
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

	Issue #122: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/122

	DP 2019-05-20                                                             */
////////////////////////////////////////////////////////////////////////////////


#include "cp_inc_k1"

void main() {
	
	location lWoodshed = Location(Vector(83.0,142.0,4.62), 0.0);
	
	SetGlobalFadeOut();
	
	SetGlobalBoolean("G_JoleeJoined", 1);
	AddAvailableNPCByTemplate(4, "p_jolee");
	ShowPartySelectionGUI("", 4, -1);
	
	SetGlobalFadeIn(0.5, 0.5);
	
	//Take NPC Jolee out behind the wood shed
	CP_PartyJump(OBJECT_SELF, lWoodshed);
	// Before giving him the Old Yella treatment
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
}
