//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_calo031.dlg in tar_m03ae (Taris Lower City Javyar's Cantina).
	
	This script fires during the scene of Calo Nord killing three Black Vulkars
	in the Lower City cantina. The original version of the script only ended up
	equipping Calo with a single blaster during the scene, even though the intent
	was clearly to have him dual wield.
	
	See also k_ptar_kill.
	
	Issue #359: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/359
	
	DP 2020-06-15																*/
////////////////////////////////////////////////////////////////////////////////// 

void EquipOffhand() {
	
	object oCalo = GetObjectByTag("calo031", 0);
	object oBlaster = GetItemPossessedBy(oCalo, "G_W_HVYBLSTR01");
	
	AssignCommand(oCalo, ActionEquipItem(oBlaster, INVENTORY_SLOT_LEFTWEAPON, FALSE));
}

void main() {
	
	object oTwilek1 = GetObjectByTag("taproomvic032", 0);
	object oGren = GetObjectByTag("flash_gren", 0);
	location lGren = GetLocation(GetObjectByTag("GRENADE_WP", 0));
	object oCalo = GetObjectByTag("calo031", 0);
	object oBlaster = GetItemPossessedBy(oCalo, "G_W_HVYBLSTR01");
	
	ActionPauseConversation();
	
	AssignCommand(oCalo, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTWEAPON, FALSE));
	
	DelayCommand(0.5, EquipOffhand());
	
	DelayCommand(0.5, PlaySound("cs_grenbeep"));
	DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GRENADE_ION), lGren));
	
	DelayCommand(1.2, DestroyObject(oGren));
	
	DelayCommand(1.2, AssignCommand(oTwilek1, PlaySound("n_swoopgang_hit1")));
	
	DelayCommand(1.2, ActionResumeConversation());
}
