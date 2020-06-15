//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	This is a replacement for the generic script k_act_atkonend, which is intended
	to be fired on the exit node of a DLG, turning the owner hostile and attacking
	the player. This has been amended to first have them equip a weapon, since by
	default an issue with the AI forces unarmed NPCs to attack with their fists for
	a round before equipping a weapon. There are two versions for either ranged or
	melee weapons.
	
	See also cp_act_atkrngend.
	
	DP 2020-06-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	ActionEquipMostDamagingMelee();
	
	DelayCommand(0.2, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.3, GN_DetermineCombatRound());
}
