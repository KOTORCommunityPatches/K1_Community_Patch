////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_redelder.dlg and unk42_redhistory.dlg in unk_m42aa (Unknown
	World Elder's Settlement).
	
	This script is fired when the player sides with The One and declares that
	they are attacking the Elders, turning the entire settlement hostile.
	Because the "attack with fists" issue afflicted a number of unarmed NPCs
	in this module, the script has been altered to force them to equip the weapon
	in their inventory before going hostile. The positions of the spawn in points
	for the summoned guards was also slightly changed to push them out of sight
	around the corners to mask them popping out of thin air.
	
	Issue #169: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/169
	
	DP 2019-06-21                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_unk"
#include "cp_inc_k1"

void main() {
	
	location lRakSp1A = Location(Vector(32.0,44.8,16.166), -90.0);
	location lRakSp2A = Location(Vector(73.0,44.8,16.166), 180.0);
	object oRakSp1 = GetObjectByTag("rakspawn1", 0);
	object oRakSp2 = GetObjectByTag("rakspawn2", 0);
	object oOrsaa = GetObjectByTag("unk42_Scholar", 0);
	object oLlawa = GetObjectByTag("unk42_rakbreed01", 0);
	object oResrc1 = GetObjectByTag("unk42_rakbreed02", 0);
	object oResrc2 = GetObjectByTag("unk42_rakbreed03", 0);
	object oElder1 = GetObjectByTag("unk42_redelder", 0);
	object oElder2 = GetObjectByTag("unk42_redelder2", 0);
	object oElder3 = GetObjectByTag("unk42_redelder3", 0);
	
	CP_EquipFirstWeapon(oOrsaa, TRUE);
	CP_EquipFirstWeapon(oLlawa, TRUE);
	CP_EquipFirstWeapon(oResrc1, TRUE);
	CP_EquipFirstWeapon(oResrc2, TRUE);
	CP_EquipFirstWeapon(oElder1, TRUE);
	CP_EquipFirstWeapon(oElder2, TRUE);
	CP_EquipFirstWeapon(oElder3, TRUE);
	
	DelayCommand(0.25, UNK_SetRedRakataHostile());
	
	CreateObject(OBJECT_TYPE_CREATURE, "g_rakatan04", lRakSp1A, FALSE);
	CreateObject(OBJECT_TYPE_CREATURE, "g_rakatan05", lRakSp2A, FALSE);
	DelayCommand(0.5, AssignCommand(GetObjectByTag("g_rakatan04"),ActionMoveToObject(oRakSp1, TRUE, 0.1)));
	DelayCommand(0.5, AssignCommand(GetObjectByTag("g_rakatan05"),ActionMoveToObject(oRakSp2, TRUE, 0.1)));
	
	DelayCommand(0.75, GN_DetermineCombatRound(OBJECT_INVALID));
}
