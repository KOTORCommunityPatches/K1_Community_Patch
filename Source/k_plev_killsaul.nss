////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script fires on Carth's "Damn you, Saul! Damn you!" line after Saul
	dies. The vanilla script applied a death effect to Saul, but that causes
	issues due to him standing up to do the death animation as well as uttering
	his soundset death cry right when Carth is speaking his line. To get around
	this, Saul's death is now faked with a new stunt animation on the previous
	line, and this script destroys him off-screen and spawns in a dummy corpse
	and invisible placeable to store his lootable items. 
	
	See also cp_lev_crthfacwt, k_plev_journal, k_plev_playpron2.
	
	Issue #131: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/131
	
	DP 2019-07-09                                                             */
////////////////////////////////////////////////////////////////////////////////

void SpawnCorpse() {
	
	object oSaulWP = GetObjectByTag("lev_saulend_wp", 0);
	location lSaulLoot = Location(Vector(275.698,54.415,9.0), 0.0);
	
	CreateObject(OBJECT_TYPE_CREATURE, "cp_m40ad_sauldmy", GetLocation(oSaulWP), FALSE);
	CreateObject(OBJECT_TYPE_PLACEABLE, "cp_m40ad_saulinv", lSaulLoot, FALSE);
}

void SpawnCreds() {
	
	object oSaulInv = GetObjectByTag("cp_m40ad_saulinv", 0);
	
	// Adding the same three credit items the vanilla Saul UTC has to the placeable
	// wasn't dropping as a single stack when looted, so add them separately after
	// it has been spawned
	
	CreateItemOnObject("g_i_credits001", oSaulInv, 3700);
}

void main() {
	
	object oCarth = GetObjectByTag("Carth", 0);
	object oSaul = GetObjectByTag("SaulKarath402", 0);
	
	AssignCommand(oCarth, ClearAllActions());
	
	DelayCommand(0.3, SetPlotFlag(oSaul, FALSE));
	DelayCommand(0.5, ActionDoCommand(DestroyObject(oSaul)));
	
	DelayCommand(1.0, SpawnCorpse());
	DelayCommand(1.5, SpawnCreds());
}
