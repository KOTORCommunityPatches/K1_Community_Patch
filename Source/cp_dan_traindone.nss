////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_dan_traindone

	Fired when the player goes to speak to the Council after completing their
	training.	
	
	JC 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////
string CP_NPCToTag(int nNPC) {

	string sTag = "";
	
		if( nNPC == 0 ) sTag = "Bastila";
		if( nNPC == 1 ) sTag = "Cand";
		if( nNPC == 2 ) sTag = "Carth";
		if( nNPC == 3 ) sTag = "HK47";
		if( nNPC == 4 ) sTag = "Jolee";
		if( nNPC == 5 ) sTag = "Juhani";
		if( nNPC == 6 ) sTag = "Mission";
		if( nNPC == 7 ) sTag = "T3M4";
		if( nNPC == 8 ) sTag = "Zaalbar";

	return sTag;
}

void CP_Jump(object oPM, location lLoc) {
 
	AssignCommand(oPM, ClearAllActions());
	AssignCommand(oPM, ActionDoCommand(SetCommandable(TRUE, oPM)));
	AssignCommand(oPM, ActionJumpToLocation(lLoc));	

}


void CP_PartyHerder(location lPC, location lPM1, location lPM2) {

object oPC = GetFirstPC();
int i = 0;
// Loop to get first party member
object oPM1 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM1) && i <= 8 ) {
	oPM1 = GetObjectByTag(CP_NPCToTag(i), 0);
	i++;
}
// Loop to get second party member
object oPM2 = OBJECT_INVALID;
while( !GetIsObjectValid(oPM2) && i <= 8 ) {
	oPM2 = GetObjectByTag(CP_NPCToTag(i), 0);
	i++;
}
// Move party into position
CP_Jump(oPC, lPC);
if( GetIsObjectValid(oPM1) ) CP_Jump(oPM1, lPM1);
if( GetIsObjectValid(oPM2) ) CP_Jump(oPM2, lPM2);

}


void main() {

if( GetIsPC(GetEnteringObject()) && GetGlobalNumber("DAN_JEDI_PLOT") == 7 ) {
	NoClicksFor(1.0);
	object oPC = GetFirstPC();
	location lPC = Location(Vector(103.0, 35.0, 4.0), -45.0);
	location lPM1 = Location(Vector(103.2, 37.0, 4.0), -45.0);
	location lPM2 = Location(Vector(101.2, 36.1, 4.0), -45.0);
	SetGlobalFadeOut(0.0, 0.75, 0.0, 0.0, 0.0);
	DelayCommand(0.75, AssignCommand(oPC, CP_PartyHerder(lPC, lPM1, lPM2)));
	DelayCommand(0.75, SetGlobalFadeIn(0.0, 1.5, 0.0, 0.0, 0.0));
	DelayCommand(0.75, AssignCommand(GetObjectByTag("dan13_vandar", 0), ActionStartConversation(oPC, "", 0, 0, 0, "", "", "", "", "", "")));
	DelayCommand(1.0, DestroyObject(OBJECT_SELF, 0.0, FALSE, 0.0));
	}

}