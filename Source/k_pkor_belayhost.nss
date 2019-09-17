////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor33b_belaya.dlg in korr_m33ab (Sith Academy Entrance).
	
	An edit of the vanilla script by AFP to force Belaya to equip a weapon
	before attacking, preventing her from attacking with her fists.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
  
	object oPC = GetFirstPC();
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	ActionEquipMostDamagingMelee();
	DelayCommand(0.5, ActionAttack(oPC, FALSE));
}
