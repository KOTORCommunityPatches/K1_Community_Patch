//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_matrik031.dlg in tar_m03ad (Taris Lower City Apartments B).
	
	This script fires after Matrik has set the permacrete charges, running he and
	the PC out into the corridor and triggering the explosion VFX. In the vanilla
	version, five explosions are triggered in three batches (one on each side and
	then three together in front). This has been changed to have two batches, one
	on each side to match the two charges Matrik is shown setting. The positions
	of the VFX have also been altered to cluster around the two positions of the
	charges, rather than the somewhat arbitrary original locations.
	
	See also k_ptar_matrikcs0.
	
	Issue #300: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/300
	
	DP 2019-11-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void BombExplode(location lWP) {
	
	effect eVFX = EffectVisualEffect(VFX_FNF_GRENADE_FRAGMENTATION);
	
	ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lWP);
}

void main() {
	
	object oPC = GetFirstPC();
	object oPCWP = GetWaypointByTag("tar03_wppcexp");
	object oMatWP = GetWaypointByTag("tar03_wpmatrikexp");
	object oLookWP = GetWaypointByTag("tar03_wpparty1");
	location lBomb1 = Location(Vector(138.412,91.052,0.0), 0.0);
	location lBomb2 = Location(Vector(139.728,89.622,0.0), 0.0);
	location lBomb3 = Location(Vector(141.674,89.491,0.0), 0.0);
	location lBomb4 = Location(Vector(133.721,84.756,0.0), 0.0);
	location lBomb5 = Location(Vector(135.686,84.919,0.0), 0.0);
	location lBomb6 = Location(Vector(136.812,83.223,0.0), 0.0);
	
	SetGlobalNumber("Tar_Matrik", 30);
	
	ActionPauseConversation();
	
	CP_PartyMoveObject(oPC, oPCWP, TRUE);
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oLookWP))));
	
	ActionMoveToObject(oMatWP, TRUE);
	ActionDoCommand(SetFacingPoint(GetPosition(oLookWP)));
	
	ActionWait(2.0);
	
	ActionDoCommand(BombExplode(lBomb1));
	ActionDoCommand(BombExplode(lBomb2));
	ActionDoCommand(BombExplode(lBomb3));
	
	ActionWait(2.0);
	
	ActionDoCommand(BombExplode(lBomb4));
	ActionDoCommand(BombExplode(lBomb5));
	ActionDoCommand(BombExplode(lBomb6));
	
	ActionDoCommand(SetGlobalFadeOut(0.0, 2.0));
	
	ActionWait(2.1);
	
	ActionDoCommand(AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oMatWP)))));
	ActionDoCommand(AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT)));
	
	ActionWait(2.0);
	
	ActionResumeConversation();
}
