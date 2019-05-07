void main() {

	object oCand = GetObjectByTag("Carth");
	object oCalo = GetObjectByTag("calo081", 0);
	
	AssignCommand(oCand, ClearAllActions());
	AssignCommand(oCand, ActionDoCommand(SetCommandable(TRUE, oCand)));
	DelayCommand(0.2, AssignCommand(oCand, SetFacingPoint(GetPosition(oCalo))));
}