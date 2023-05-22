//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for man28_shield.utc in manm28aa (Manaan Hrakert Station).
	
	This is the UserDefine for the shielded droid in the security room. It spawns
	with an active shield effect, which can be disabled by the computer terminal
	at the end of the main corridor. However, since it has an equipped droid shield,
	its AI forces it to enable it as soon as combat commences. While this shield is
	less powerful than the one it spawns in with, it doesn't make a lot of sense
	to the player after having apparently disabled it via the terminal. Applying
	the flag for having already used a shield prevents its AI from enabling it.
	The added aesthetic elements are taken from the OUD for the shielded droid
	in the Taris Sith Base (k_ptar_baddrd_ud in tar_m09aa), which has its shield
	deactivated by terminal in the same manner.
	
	Issue #681: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/681
	
	DP 2023-05-22																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nEvent = GetUserDefinedEventNumber();
	
	switch (nEvent)
		{
			case 10: // Remove the shield effect applied by the droid's OnSpawn script.
				{
					ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
					
					ClearAllActions();
					ClearAllEffects();
					PlaySound("gen_shieldredoff");
					
					// Doing the faction switch prevents it getting permanently locked into the spasm anim.
					ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 4.0);
					ActionDoCommand(ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
					
					// Since the droid has a shield item equipped, prevent it being activated when combat commences
					// by GN_DetermineCombatRound by flagging it as already used i.e. GN_SetSpawnInCondition(SW_FLAG_SHIELD_USED),
					// without the extraneous include guff.
					SetLocalBoolean(OBJECT_SELF, 65, TRUE);
					
					SetPlotFlag(OBJECT_SELF, FALSE);
				}
			
			 break;
		}
}
