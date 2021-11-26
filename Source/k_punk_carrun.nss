//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires at the end of the DS branch of Carth's conversation. The
	original script only returned his righthand weapon, so this has now been
	changed to everything. Neither option really makes any sense given that he
	escapes alive, but if you are going to give back one bit of gear then you
	might as well give it all back.
	
	Updated 2021-11-26 to revise the gear return method, since the original
	implementation wasn't working correctly.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_finale01, k_punk_finale02, k_punk_finale05, k_punk_finale06,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23 / DP 2021-11-26												*/
//////////////////////////////////////////////////////////////////////////////////

void CP_GiveEquipment(object oNPC) {
	object oItem;
	int nSlot = 10;
	
	while (nSlot >= 0)
		{
			oItem = GetItemInSlot(nSlot, oNPC);
			if (GetIsObjectValid(oItem))
				{
					GiveItem(oItem, GetFirstPC());
				}
			
			// Go in reverse inventory slot order to grab the offhand weapon first.
			nSlot--;
		}
}

void main() {
	
	SetGlobalFadeOut();
	
	NoClicksFor(0.6);
	
	// Have Carth return all his gear.
	CP_GiveEquipment(OBJECT_SELF);
	
	// Add tag masks for potentially missing NPCs to ensure forced DLG anim node fires correctly.
	DelayCommand(0.4, AssignCommand(GetObjectByTag("invish", 0), ActionStartConversation(GetFirstPC(), "unk41_mission", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "zaalbar", "hk47")));
	
	// Knock Carth on the head.
	DelayCommand(0.6, DestroyObject(OBJECT_SELF, 0.0, TRUE));
}
