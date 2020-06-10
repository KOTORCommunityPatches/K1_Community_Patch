//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by end_trask01.dlg in end_m01aa (Endar Spire Command Module).
	
	This script fires on the first node of the branch when Trask joins the party.
	Since the player's starting position can still result in party Trask spawning
	at a random position, jump the player back to the module entry point where they
	began the initial conversation after waking up. Given the positioning of the
	footlocker and the need to return to Trask, it's likely most people will end
	up close enough that the jump isn't too jarring without being covered by a
	fade-out. Replaces the original script k_pend_unready, just in case that is
	reused elsewhere.
	
	See also cp_end_trasksp_d, k_pend_traskdl29, k_pend_reset.
	
	Issue #86: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/86
	
	DP 2020-06-11																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oTrask = GetObjectByTag("end_trask");
	location lPC = Location(Vector(15.34,20.5,-1.27), 0.0);
	
	// The vanilla script is called "unready", so presumably it is intended to clear a
	// flourish animation the player might be performing if they happen to equip a weapon
	// right before they initiate the conversation.
	CancelCombat(oPC);
	
	AssignCommand(oTrask, SetFacing(DIRECTION_WEST));
	// Fire an animation to force the facing to take effect.
	AssignCommand(oTrask, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 1.0));
	
	CP_PartyJump(oPC, lPC);
	AssignCommand(oPC, DelayCommand(0.2, ActionDoCommand(SetFacing(DIRECTION_EAST))));
	// Fire an animation to force the facing to take effect.
	AssignCommand(oPC, DelayCommand(0.3, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0)));
}
