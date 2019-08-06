////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This is the Sandral Estate module's OnEnter script. By default, this
	script will destroy the Sandral protocol droid after having entered
	the estate. This will cause the Casus quest to be orphaned if the
	player failed to inform Nurik of his death and handed over the diary.
	The script has been altered so the protocol droid is no longer removed.
	It will only be destroyed during the DS resolution of the Sandral-Matale
	Feud quest. Otherwise, it will remain outside the estate, allowing the
	player to complete the Casus quest even after the Feud quest has been
	resolved.
	
	The latest revision also adds checks for whether the front door of the
	estate is opened and/or unlocked, closing/locking as appropriate.
	
	Updated further to prevent a potential (literal) lockout if the player
	upsets Rahasia and exits the estate.
	
	Updated 2019-05-19 to streamline code using vanilla includes.
	
	DP 2019-02-18                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_dan"

void main() {
	
	int nFlag = UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_02);
	object oEntering = GetEnteringObject();
	object oSanDoor = GetObjectByTag("dan14ad_door01", 0);
	
	// Adding a check for the front door being open, and closing it if so
	if (GetIsOpen(oSanDoor))
		{
			AssignCommand(oSanDoor,ActionCloseDoor(oSanDoor));
		}
		
	// Locking the front door if the player has previously entered and spoken to Nurik, didn't piss off Rahasia, and it is currently unlocked
	if ((GetGlobalBoolean("DAN_SAND_REFUSE") == TRUE) && (GetGlobalBoolean("DAN_HATE_DONE") == FALSE) && (GetLocked(oSanDoor) == FALSE))
		{
			AssignCommand(oSanDoor, SetLocked(oSanDoor, TRUE));
		}
	
	if ((GetIsPC(oEntering) && (GetLoadFromSaveGame() == FALSE)))
		{
			int nCount = (2 - GetNumberOfWanderingKathHounds());
			
			if ((GetGlobalBoolean("DAN_LEAVE_DONE") && (nFlag == FALSE)))
				{
					UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_02, TRUE);
					
					CreateObject(OBJECT_TYPE_CREATURE, "dan14_shen", GetLocation(GetObjectByTag("POST_dan14_shen", 0)), 0);
					CreateObject(OBJECT_TYPE_CREATURE, "dan14_rahasia", GetLocation(GetObjectByTag("POST_dan14_rahasia", 0)), 0);
					
					int nDroid;
					object oDroid = GetObjectByTag("pdan_swdroid", nDroid);
					
					while (GetIsObjectValid(oDroid))
						{
							DestroyObject(oDroid);
							(nDroid++);
							oDroid = GetObjectByTag("pdan_swdroid", nDroid);
						}
				}
			if (ElisePlotStarted())
				{
					PlaceNPC("dan14_c869", "");
					
					if ((UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_08) == FALSE))
						{
							UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_08, TRUE);
							
							SetEncounterActive(TRUE, GetObjectByTag("dan14ad_c869hound", 0));
						}
				}
				else
					{
						DestroyObject(GetObjectByTag("dan14_c869", 0));
					}
			
			/*
			 Commenting out the original section that destroys the Sandral protocol droid if the player has entered and spoken to Nurik 
			
			if (GetGlobalBoolean("DAN_SAND_REFUSE"))
				{
					DestroyObject(GetObjectByTag("dan14_sdroid", 0), 0.0, 1, 0.0);
				}
			*/
			
			if ((nCount > 0))
				{
					SpawnWanderingKathHound(nCount);
				}
		}
}
