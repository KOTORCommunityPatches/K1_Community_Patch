//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_trask01.dlg in end_m01aa (Endar Spire Command Module).
	
	This script fires when Trask joins the party. It adds Party Trask, brings
	up the party selection screen, and destroys NPC Trask. This has now had
	a fade-out added, along with jumping NPC Trask out into the hallway to
	move him out of the way for Party Trask to stand in his place. Because
	the Party Trask would spawn in behind the player, it was desirable to jump
	him back to the position that NPC Trask was standing in for the sake of
	consistency. 
	
	See also cp_end01_pcjump, cp_end_trasksp_d, k_pend_reset.
	
	Issue #86: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/86
	
	DP 2019-05-20
	
	Edited to reduce the chance of button mashing breaking things.
	
	JC 2020-12-25															*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	location lHallway = Location(Vector(30.0,20.7,-1.27), 0.0);
	
	if ((IsAvailableCreature(0) == 0))
		{
			AddAvailableNPCByTemplate(0, "end_trask");
			SetAreaUnescapable(FALSE);
			
			SetGlobalFadeOut();
			
			NoClicksFor(0.3);
			DelayCommand(0.1, CP_PartyJump(OBJECT_SELF, lHallway));
			DelayCommand(0.3, ShowPartySelectionGUI("k_pend_reset", 0, -1));
			DelayCommand(0.3, NoClicksFor(0.2));
			DelayCommand(0.4, DestroyObject(OBJECT_SELF, 0.0, TRUE, 0.0));
		}
}