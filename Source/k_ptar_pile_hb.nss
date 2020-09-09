//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnInvDisturbed for tar05_corpsepile.utp in tar_m05abc (Taris Upper Sewers).
	
	This fires when the player alters the inventory of the corpse pile in the
	Rancor's den. It triggers the cutscene once the synthetic odour item has been
	added. Since this placeable has now been switched to an invisible one that is
	destroyed at the end of the cutscene, the conversation has now been assigned
	to the player and an added static corpse placeable. The original was cleaned
	up a bit to remove unnecessary include guff.
	
	Issue #430: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/430
	
	DP 2020-09-09																*/
//////////////////////////////////////////////////////////////////////////////////

void RancorJump(object oNPC) {
	AssignCommand(oNPC, ClearAllActions());
	AssignCommand(oNPC, ActionJumpToObject(GetObjectByTag("tar05_wprancor", 0), 0));
}

void main() {
	
	object oStampy = GetObjectByTag("tar05_stampy", 0);
	object oPile = GetObjectByTag("cp_tar05_rncpile");
	int SW_PLOT_BOOLEAN_01 = 0;
	
	if (!GetGlobalBoolean("TAR_RANCOREATING") && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF, "tar05_synthodor")))
		{
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01, FALSE);
			
			SetGlobalBoolean("TAR_RANCOREATING", TRUE);
			
			SetGlobalFadeOut(0.0, 1.0);
			
			DelayCommand(1.0, RancorJump(oStampy));
			
			DelayCommand(1.1, AssignCommand(GetFirstPC(), ActionStartConversation(oPile, "tar05_pile_dlg", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
