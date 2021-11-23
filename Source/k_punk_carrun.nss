//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires at the end of the DS branch of Carth's conversation. The
	original script only returned his righthand weapon, so this has now been
	changed to everything. Neither option really makes any sense given that he
	escapes alive, but if you are going to give back one bit of gear then you
	might as well give it all back.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_finale01, k_punk_finale02, k_punk_finale05, k_punk_finale06,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeOut();
	
	NoClicksFor(0.4);
	
	// Have Carth return all his gear.
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_HEAD, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_BODY, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_HANDS, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_BELT, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTARM, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTARM, OBJECT_SELF), TRUE);
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_IMPLANT, OBJECT_SELF), TRUE);
	
	// Add tag masks for potentially missing NPCs to ensure forced DLG anim node fires correctly.
	DelayCommand(0.4, AssignCommand(GetObjectByTag("invish", 0), ActionStartConversation(GetFirstPC(), "unk41_mission", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "zaalbar", "hk47")));
	
	// Knock Carth on the head.
	DelayCommand(0.6, DestroyObject(OBJECT_SELF, 0.0, TRUE));
}
