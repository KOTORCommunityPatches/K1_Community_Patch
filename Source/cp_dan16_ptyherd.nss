////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan16_nurik.dlg on Entry 33
	
	This script is triggered at the start of the conversation in the foyer of
	the Sandral estate (danm16), where the player first meets Nurik and Rehasia.
	It's purpose is to herd the party, as by default they tend to be scattered
	all over the place, making for some messy interactions/camera angles.
	
	This is a slightly altered version of a script JC originally made for one
	of DP's mods (Taris Dueling Ring).
	
	DP 2019-02-06                                                             */
////////////////////////////////////////////////////////////////////////////////


void subMove(object oPM, location lLoc) {

	AssignCommand(oPM, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM))));
	DelayCommand(0.2, AssignCommand(oPM, ActionJumpToLocation(lLoc)));
}

void main() {

	location lPC = Location(Vector(45.4,32.5,7.5), 90.0);
	location lPM1 = Location(Vector(46.5,31.25,7.5), 90.0);
	location lPM2 = Location(Vector(44.3,31.25,7.5), 90.0);

	object oPC = GetFirstPC();
	object oPM1 = OBJECT_INVALID;
	object oPM2 = OBJECT_INVALID;
	int i = 1;
	int j = 0;

	ActionPauseConversation();
	
	while( i > j ) {
		object oCreature = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, i);
		if( GetIsObjectValid(oCreature) ){
			if( IsObjectPartyMember(oCreature) ) {
				if( oPM1 == OBJECT_INVALID ) {
					oPM1 = oCreature;
					}
				else {
					oPM2 = oCreature;
					j = i + 1;
					}
			}
		i++;
		}
		else j = i + 1;
	}

	subMove(oPM1, lPM1);
	subMove(oPM2, lPM2);
	
	ActionResumeConversation();
}