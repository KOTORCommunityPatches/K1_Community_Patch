////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_ptar_davslav01
	
	Fired by tar08_davguest82.dlg in tar_m08aa (Taris Davik's Estate).
	
	Slave girl runs away when her date night is interrupted.
	
	Issue # N/A
	
	JC 2019-02-25                                                             */
////////////////////////////////////////////////////////////////////////////////

void CP_SlaveFlee() {
    ActionForceMoveToObject(GetWaypointByTag("tar08_wpslaveesc"), TRUE, 1.0, 30.0);
    ActionDoCommand(SetCommandable(1, OBJECT_SELF));
    SetCommandable(0, OBJECT_SELF);
}

void main() {
    AssignCommand(GetObjectByTag("pc_DavikSlave083", 0), CP_SlaveFlee());
    DelayCommand(6.0, DestroyObject(GetObjectByTag("pc_DavikSlave083", 0), 0.0, 0, 0.0));
}
