//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik082.dlg in tar_m08aa (Taris Davik's Estate).
	
	This script fires during the scene where the party enters the hangar in
	Davik's Estate to steal the Ebon Hawk. The vanilla script walked Calo and
	Davik forwards to their final positions. It now also runs the party forwards
	off-screen so that they are close enough post-scene for the combat AI to
	kick in.
	
	See also k_ptar_davatk.
	
	Issue #708: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/708
	
	DP 2023-11-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void WalkNPC(string sTarget) {
	ActionMoveToObject(GetObjectByTag(sTarget, 0), FALSE, 0.25);
	ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC())));
}

void main() {
	
	object oDavik = GetObjectByTag("Davik082", 0);
	object oCalo = GetObjectByTag("Calo082", 0);
	location lPC = Location(Vector(50.00,65.60,0.0), 0.0);
	location lPM1 = Location(Vector(49.32,67.35,0.0), 0.0);
	location lPM2 = Location(Vector(49.32,63.85,0.0), 0.0);
	
	AssignCommand(oDavik, WalkNPC("tar08_wpdavtour5"));
	AssignCommand(oCalo, WalkNPC("tar08_wpspcalo3"));
	
	// While the party is off-screen, run them further forwards.
	DelayCommand(3.0, CP_PartyHerder(lPC, lPM1, lPM2, FALSE, TRUE));
}
