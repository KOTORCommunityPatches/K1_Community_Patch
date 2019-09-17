////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fires if the player chooses to kill Dia.
	Fixes an issue with her not equipping a weapon.
	
	JC 2019-04-25                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_debug"
#include "k_inc_generic"

void main() {

	ActionEquipMostDamagingMelee(OBJECT_INVALID, FALSE);
	DelayCommand(0.2,ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.3,GN_DetermineCombatRound());
}
