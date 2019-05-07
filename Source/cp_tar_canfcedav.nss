void main() {

	object oCand = GetObjectByTag("Carth");
	object oDavik = GetObjectByTag("Davik081", 0);
	
	AssignCommand(oCand, ClearAllActions());
	AssignCommand(oCand, ActionDoCommand(SetCommandable(TRUE, oCand)));
	DelayCommand(0.2, AssignCommand(oCand, SetFacingPoint(GetPosition(oDavik))));
}