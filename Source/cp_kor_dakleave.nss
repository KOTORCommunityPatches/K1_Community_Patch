////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Makes Dak Vesser leave the cantina on Korriban.
	
	JC 2019-01-26                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

object oExit = GetObjectByTag("k33_way_yuthuraexit", 0);

ActionForceMoveToObject(oExit, FALSE);
ActionDoCommand(SetCommandable(TRUE));
ActionDoCommand(DestroyObject(OBJECT_SELF));
SetCommandable(FALSE);

}