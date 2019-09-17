////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k_kor_uthar_move.utt in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This script is fired by a trigger in the Star Map room after the player
	has looted the lightsaber from the Sith statue. It jumps Yuthura and
	Uthar into place on the frozen acid river, in preparation for the final
	showdown. Since they inherit the rotation of the waypoints they jump to,
	they start facing each other. However the conversation forces Uthar to
	face the player, leaving Yuthura facing Uthar which looks a little odd.
	This now sets them both facing the player's direction from the start.
	
	See also k_pkor_utharcut.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-10                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int GetFlag() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oUthar = GetObjectByTag("kor39_utharwynn", 0);
	object oYuthura = GetObjectByTag("kor39_yuthura", 0);
	object oSaber = GetItemPossessedBy(oPC, "k39_itm_cersaber");
	object oWP_Uthar = GetObjectByTag("k39_way_utharjmp", 0);
	object oWP_Yuthura = GetObjectByTag("k39_way_yuthjump", 0);
	vector vPC = Vector(93.75,107.7755,15.12);
	
	if ((GetIsPC(oEntering)) && (GetIsObjectValid(oSaber)) && (!GetFlag()))
		{
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			AssignCommand(oUthar, ActionJumpToObject(oWP_Uthar));
			AssignCommand(oYuthura, ActionJumpToObject(oWP_Yuthura));
			
			AssignCommand(oUthar, ActionDoCommand(SetFacingPoint(vPC)));
			AssignCommand(oYuthura, ActionDoCommand(SetFacingPoint(vPC)));
		}
}
