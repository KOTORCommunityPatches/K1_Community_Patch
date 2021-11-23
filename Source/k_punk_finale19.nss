//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires in the Zaalbar killing Mission branch, on the node after she
	has been attacked. Zaalbar still uses a stunt animation in this shot, so he
	no longer needs the animation command of the original script. Instead, the
	player and Bastila are pre-faced in preparation for the subsequent line, and
	the stunt sword Zaalbar used in the previous shot is destroyed.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_DestroySword() {
	
	object oPC = GetFirstPC();
	object oSwd;
	
	oSwd = GetFirstItemInInventory(oPC);
	
	while (GetIsObjectValid(oSwd) == TRUE)
		{
			if (GetTag(oSwd) == "cp_unk41_stntswd")
				{
					DestroyObject(oSwd);
				}
			
			oSwd = GetNextItemInInventory(oPC);
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oStuntSwd = GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oZaal);
	
	ActionPauseConversation();
	
	NoClicksFor(6.0);
	
	SetGlobalFadeIn(0.5, 1.0);
	
	// Face Bastila and the PC toward each other in preparation for the next line.
	AssignCommand(oBast, SetFacingPoint(GetPosition(oPC)));
	AssignCommand(oBast, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1));
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oBast)));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
	
	// Kill Mission and leave a permanent corpse.
	DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oMiss));
	DelayCommand(1.0, AssignCommand(oMiss, SetIsDestroyable(FALSE, FALSE, FALSE)));
	
	AssignCommand(oZaal, ActionUnequipItem(oStuntSwd, TRUE));
	DelayCommand(0.5, CP_DestroySword());
	
	DelayCommand(6.0, ActionResumeConversation());
}
