////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    Originally from Star Forge Door Fix by jc2.
	
	Prevents the door on the Star Forge that locks the player in with a bunch
	of endlessly spawning droids from being bashable.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() 
{
object oA = GetObjectByTag("k45_door_malak");
SetMinOneHP(oA, 1);

ActionLockObject(oA);
}