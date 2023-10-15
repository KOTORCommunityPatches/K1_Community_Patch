//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Steam vent trigger OnEnter in manm27aa (Manaan Sith Base).
	
	This is the OnEnter script for the multiple triggers that line the corridor
	to the North Computer Room. The triggers damage anyone that enters them while
	their associated steam vent is active. The vanilla script applied universal
	damage. This has been changed to fire damage which seems more appropriate,
	and allows the party to take advantage of any fire damage mitigation items
	they may have.
	
	See also k_pman_steam02, k_pman_steam03.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"
 
 void main() {
 	
	object oTarget = GetEnteringObject();
 	
	if (GetIsVentActive(OBJECT_SELF))
		{
			if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
				{
					ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(STEAM_DAMAGE_AMOUNT, DAMAGE_TYPE_FIRE), oTarget);
				}
		}
 }
