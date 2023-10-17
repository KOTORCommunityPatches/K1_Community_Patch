//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_droid17b.dlg in lev_m40ab (Leviathan Command Deck).
	
	This script fires on the exit node of the branch commanding the decomissioned
	droid to ram the locked door to the bridge storage room. The vanilla script
	walked the droid to a waypoint about 10 feet away from the door and then
	applied lethal damage to it. It unlocked and was supposed to open the door,
	although the open command was incorrect so the door didn't actually open. Now
	the droid is commanded to run to a point further away from the door, then turn
	and run right up to the door before exploding with a much bigger added explosion
	VFX. The door now also opens as originally intended.
	
	Issue #414: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/414
	
	DP 2023-10-17																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDoor = GetObjectByTag("lev40_storage", 0);
	object oWP = GetObjectByTag("lev40_sw40ab21", 0);
	effect eExplode = EffectVisualEffect(VFX_FNF_GRENADE_FRAGMENTATION);
	location lDoor = Location(Vector(123.06,74.27,3.00), 90.00);
	
	SetGlobalBoolean("lev_ramdroid", TRUE);
	SetGlobalBoolean("Lev_storage", TRUE);
	
	ActionMoveToObject(oWP, TRUE, 0.5);
	ActionForceMoveToLocation(lDoor, TRUE, 10.0);
	
	ActionDoCommand(SetLocked(oDoor, FALSE));
	ActionDoCommand(AssignCommand(oDoor, DelayCommand(0.2, ActionOpenDoor(oDoor))));
	
	ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(OBJECT_SELF)));
	ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(100, DAMAGE_TYPE_UNIVERSAL), OBJECT_SELF));
}
