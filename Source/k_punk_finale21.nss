//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires in the Zaalbar killing Mission branch. The original script
	simply moved Zaalbar towards Mission. Now he is also given a stunt sword,
	since the DLG has been changed to hide weapons and he could also be unarmed
	in the first place. 
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oMiss = GetObjectByTag("Mission", 0);
	object oEnd = GetObjectByTag("playermiss", 0);
	object oStuntSwd = CreateItemOnObject("cp_unk41_stntswd", oZaal, 1);
	
	NoClicksFor(2.5);
	
	AssignCommand(oMiss, SetFacingPoint(GetPosition(oEnd)));
	
	AssignCommand(oZaal, ActionMoveToObject(oEnd, FALSE, 0.2));
	
	// Give Zaalbar a stunt sword since the DLG has been set to hide weapons.
	AssignCommand(oZaal, ActionEquipItem(oStuntSwd, INVENTORY_SLOT_RIGHTWEAPON, FALSE));
}
