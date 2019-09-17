////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg on Reply 73.
	
	This script forces the Sandral protocol droid to go hostile and attack the
	player during the DS resolution to Sandral-Matale feud quest. This is
	required as the droid is no longer destroyed by the module's OnEnter in
	order to allow resolution of the Casus quest after the Feud quest has been
	completed. In the DS "kill everyone" outcome of the Feud, the droid is
	destroyed and the Casus quest is set to a new closed state (see cp_dan_casus_ds).
	
	Issue #27: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/27
	
	DP 2019-02-04                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oProtDrd = GetObjectByTag("dan14_sdroid", 0);
	object oPC = GetFirstPC();
	location lPC = GetLocation(GetFirstPC());
	
	AssignCommand(oProtDrd, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oProtDrd, ActionDoCommand(SetCommandable(TRUE, oProtDrd))));
	DelayCommand(0.2, AssignCommand(oProtDrd, ActionMoveToLocation(lPC)));
	DelayCommand(2.0, ChangeToStandardFaction(oProtDrd, STANDARD_FACTION_HOSTILE_2));
	DelayCommand(0.2, AssignCommand(oProtDrd, ActionAttack(oPC)));
}
