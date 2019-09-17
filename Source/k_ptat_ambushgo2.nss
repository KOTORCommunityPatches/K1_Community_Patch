////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_12gurke_01.dlg in tat_m18aa (Tatooine Dune Sea).

	This is the script is fired at the start of the cutscene for the ambush
	by some Gamorreans in the Dune Sea using a recorded distress message to
	lure in saps to extort for credits. The vanilla version deals a flat 60
	damage to the player, with no chance for a Reflex save like real mines.
	Given that many people choose Tatooine as their first destination post-
	Dantooine, it is possible that particularly squishy characters, or just
	those that are sufficiently wounded from prior combat encounters, may be
	killed outright by the blast, which was presumably not the original design
	intent. This has been altered to include a check of the PC's current health
	and reduce the damage to a maximum of 50% if it is below 120HP. It should
	be noted that a Deadly Frag Mine only does 54 damage, with a chance for
	a Reflex save for half damage.
	
	Issue #216: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/216
	
	DP 2019-09-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oDroid = GetObjectByTag("kas18_ambush_drd", 0);
	effect eExplode = EffectVisualEffect(VFX_FNF_GRENADE_FRAGMENTATION, FALSE);
	int nCurHP = GetCurrentHitPoints(oPC);
	int nDamage;
	
	if (nCurHP < 120)
		{
			nDamage = (nCurHP / 2);
		}
		else
			{
				nDamage = 60;
			}
	
	effect eBlast = EffectDamage(nDamage, DAMAGE_TYPE_UNIVERSAL, DAMAGE_POWER_NORMAL);
	
	ActionPauseConversation();
	
	DestroyObject(oDroid, 1.5, TRUE, 0.0);
	
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oDroid));
	
	ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlast, oPC);
	
	DelayCommand(1.0, ActionResumeConversation());
}
