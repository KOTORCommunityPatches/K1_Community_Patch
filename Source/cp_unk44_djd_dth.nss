//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnDeath for unk44_darkjed441.utc/unk44_darkjed441.utc in unk_m44aa (Unknown
	World Temple Main Floor).
	
	This is the OnDeath script for the two Dark Jedi on the northern side of the
	temple, next to the room with the Sith Master. Because it was possible for
	impatient players to trigger the scene with the Master by opening the door
	while still in the middle of combat with the Dark Jedi (thus probably party
	wiping), that door has been set to start locked and only unlock after the
	two Dark Jedi are dead. Each will set a boolean on the other to true when
	they die, and whichever dies last will then command the door to unlock. A
	"safety" boolean is also set on the door itself, which it checks before
	beginning the cutscene. This was done because it appears that there	are edge
	cases where clicking on the door while it is still locked may result in the
	Master's cutscene immediately triggering once the combat with the Dark Jedi
	finishes, even though it shouldn't do so until the door actually opens.
	
	See also k_punk_masktk_en.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2019-11-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oDarkJedi1 = GetObjectByTag("darkjedi441");
	object oDarkJedi2 = GetObjectByTag("darkjedi442");
	object oDoor = GetObjectByTag("unk44_lockdoor");
	
	if (GetTag(OBJECT_SELF) == "darkjedi441")
		{
			SetLocalBoolean(oDarkJedi2, SW_PLOT_BOOLEAN_06, TRUE);
		}
		
	if (GetTag(OBJECT_SELF) == "darkjedi442")
		{
			SetLocalBoolean(oDarkJedi1, SW_PLOT_BOOLEAN_06, TRUE);
		}
	
	if (GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_06))
		{
			SetLocked(oDoor, FALSE);
			SetLocalBoolean(oDoor, SW_PLOT_BOOLEAN_10, TRUE);
		}
	
	ExecuteScript("k_ai_master", OBJECT_SELF, 1007);  // KOTOR_DEFAULT_EVENT_ON_DEATH
}
