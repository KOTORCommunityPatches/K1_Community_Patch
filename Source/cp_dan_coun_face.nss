////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Jedi Enclave).
	
	This script forcibly sets the facing of the Council members towards the PC,
	and makes the PC face Vandar. This is an attempt to overcome their refusal
	to respect speaker/listener tags in the DLG during certain lines.
	
	DP 2019-04-29                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	object oVandar = GetObjectByTag("dan13_vandar", 0);
	object oVrook = GetObjectByTag("dan13_vrook", 0);
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	object oDorak = GetObjectByTag("dan13_dorak", 0);
	
	AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVandar, SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVrook, SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oZhar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oZhar, SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oDorak, SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oPC, SetFacingPoint(GetPosition(oVandar)));
}
