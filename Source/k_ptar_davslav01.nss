//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar08_davguest82.dlg in tar_m08aa (Taris Davik's Estate).
	
	Slave girl runs away when her date night is interrupted.
	
	Updated 2023-12-14 to run her to a position that should prevent her trying to
	pathfind through the middle of the party before continuing down the hallway.
	
	See also k_ptar_madhunter.
	
	Issue #728: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/728
	
	JC 2019-02-25 / DP 2023-12-14												*/
//////////////////////////////////////////////////////////////////////////////////

void CP_SlaveFlee() {
	location lRun1 = Location(Vector(80.52,98.47,0.00), 49.18);
	
	ActionForceMoveToLocation(lRun1, TRUE, 30.0);
	ActionForceMoveToObject(GetWaypointByTag("tar08_wpslaveesc"), TRUE, 1.0, 30.0);
    ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
    SetCommandable(FALSE, OBJECT_SELF);
}

void main() {
    
	object oSlave = GetObjectByTag("pc_DavikSlave083", 0);
	
	AssignCommand(oSlave, CP_SlaveFlee());
    DelayCommand(6.0, DestroyObject(oSlave, 0.0, TRUE));
}
