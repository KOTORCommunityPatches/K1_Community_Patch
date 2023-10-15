//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Steam vent trigger OnHeartbest in manm27aa (Manaan Sith Base).
	
	This is one of two OnHeartbeat scripts for the multiple triggers that line
	the corridor to the North Computer Room. The triggers damage anyone that
	enters them while their associated steam vent is active. The vanilla script
	applied universal damage. This has been changed to fire damage which seems
	more appropriate, and allows the party to take advantage of any fire damage
	mitigation items they may have.
	
	See also k_pman_steam01, k_pman_steam02.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_man"
 
 void main() {
 	
	if (GetGlobalBoolean("MAN_STEAM_OFF") == FALSE)
		{
			int nState = !GetIsVentActive(OBJECT_SELF);
			
			SetVentActive(nState, OBJECT_SELF);
			
			if (nState)
				{
					object oTarget = GetFirstInPersistentObject(OBJECT_SELF, OBJECT_TYPE_CREATURE, PERSISTENT_ZONE_ACTIVE);
					
					while (GetIsObjectValid(oTarget))
						{
							ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(STEAM_DAMAGE_AMOUNT, DAMAGE_TYPE_FIRE), oTarget);
							
							oTarget = GetNextInPersistentObject(OBJECT_SELF, OBJECT_TYPE_CREATURE, PERSISTENT_ZONE_ACTIVE);
						}
				}
		}
 }
