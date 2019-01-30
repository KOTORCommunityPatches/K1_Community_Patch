void main() {

	object oCarth = GetObjectByTag("Carth");
	object oKandon = GetObjectByTag("KandonArk101");
	
	AssignCommand(oCarth, ClearAllActions());
	AssignCommand(oCarth, ActionDoCommand(SetCommandable(TRUE, oCarth)));
	DelayCommand(0.2, AssignCommand(oCarth, SetFacingPoint(GetPosition(oKandon))));
}