//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnHeartbeat for invis.utp in unk_m44ac (Lehon Temple Summit).
	
	This is the OnHeartbeat script for an invisible placeable that fires a short
	conversation with Bastila once Jolee and Juhani are dead on the DS route. It's
	the same conversation that triggers if you try to open the door before turning
	off the disruptor field. It has been altered to ensure the player is no longer
	stuck in a combat stance, which could happen with the vanilla script. It also
	now destroys itself when taking the LS route, which - surprisingly, given the
	memory management requirements of the Xbox - was not the case with the vanilla
	script (leaving it constantly ticking in the background).
	
	See also cp_unk44_jjfcbas, cp_unk44_pcfcbas, k_punk_bast_ud2, k_punk_bastatt03,
	k_punk_bastatt05, k_punk_bastesc, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("bastila", 0);
	
	// If the player chooses the Dark Side route, fire her conversation about disabling the shield as soon as Jolee and Juhani are dead.
	if (GetGlobalNumber("G_FinalChoice") == 1 && GetIsObjectValid(GetObjectByTag("jolee", 0)) == FALSE && GetIsObjectValid(GetObjectByTag("juhani", 0)) == FALSE)
		{
			AssignCommand(oBastila, ClearAllActions());
			AssignCommand(oPC, ClearAllActions());
			CancelCombat(oBastila);
			CancelCombat(oPC);
			
			DelayCommand(0.5, AssignCommand(oBastila, ActionStartConversation(oPC, "unk44_exittrig", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			
			DelayCommand(1.0, DestroyObject(OBJECT_SELF));
		}
	
	// If the player chooses the Light Side route then destroy the placeable straight away.
	if (GetGlobalNumber("G_FinalChoice") == 2)
		{
			DestroyObject(OBJECT_SELF);
		}
}
