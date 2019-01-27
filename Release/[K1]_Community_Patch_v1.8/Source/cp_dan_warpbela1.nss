void main() {
	location lBela = Location(Vector(223.0,83.0,12.64), 0.0);
	location lJedi = Location(Vector(223.0,68.0,12.64), 0.0);
	object oBela = GetObjectByTag("dan13_belaya", 0);
	object oJedi = GetObjectByTag("dan13_jedif", 0);
	
	AssignCommand(oBela, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.2, AssignCommand(oBela, ActionJumpToLocation(lBela)));
	AssignCommand(oJedi, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.2, AssignCommand(oJedi, ActionJumpToLocation(lJedi)));
}