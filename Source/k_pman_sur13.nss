////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pman_sur13
	
	Fires if the player chooses to kill the surviving scientists in the Hrakert
	rift. Has them equip their weapons, then executes the original script that
	makes them hostile.
	
	Issue #94: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/94
	
	JC 2019-05-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oKono = GetObjectByTag("man28_sur3", 0);
	object oSami = GetObjectByTag("man28_sur4", 0);
	
	AssignCommand(oKono, ActionEquipMostDamagingMelee(OBJECT_INVALID, FALSE));
	AssignCommand(oSami, ActionEquipMostDamagingRanged(OBJECT_INVALID));
	DelayCommand(0.1, ExecuteScript("cp_man_sur13", OBJECT_SELF, -1));

}
