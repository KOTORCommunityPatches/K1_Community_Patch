////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Jedi Enclave).

	This script, in conjunction with cp_dan_traindone, adds a cutscene intro
	when approaching the Council after having told Zhar you dealt with Juhani.
	This revised version has now moved all of the party herding elements out
	to cp_dan_traindone, so this script only handles the camera setup and
	dialogue pause.
	
	Updated 2019-05-07 to now also include the contents of k_pdan_vandar04,
	since this script also needs to fire on Entry 6 in order to account for
	people speaking to Vandar before telling Zhar they dealt with Juhani,
	thus triggering the cinematic intro on this later node.
	
	Updated 2019-08-05 ensure the Council is facing the right way and add an
	additional condition for positioning the party if the player has talked
	to Vandar before Zhar and thus initiates the conversation manually. This
	is primarily for the killing Juhani route, since there are player responses
	in that instance.
	
	Issue #151: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/151

	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oVandar = GetObjectByTag("dan13_vandar", 0);

    if (GetLocalBoolean(oVandar, 53) == FALSE && GetGlobalNumber("DAN_JEDI_PLOT") == 7)
		{
			object oVandar = GetObjectByTag("dan13_vandar", 0);
			object oVrook = GetObjectByTag("dan13_vrook", 0);
			object oZhar = GetObjectByTag("dan13_zhar", 0);
			object oDorak = GetObjectByTag("dan13_dorak", 0);
			vector lPC = Vector(103.204,34.028,6.0);
			
			ActionPauseConversation();
			
			// Set a flag to avoid changing the camera angle when this script
			// is fired on subsequent entries
			SetLocalBoolean(oVandar, 53, TRUE);
			
			// Add global setting from k_pdan_vandar04
			SetGlobalBoolean("DAN_RUINS_GONE", 1);
			
			//Make the Council members face the PC'S destination
			AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
			DelayCommand(0.1, AssignCommand(oVandar, SetFacingPoint(lPC)));
			AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
			DelayCommand(0.1, AssignCommand(oVrook, SetFacingPoint(lPC)));
			AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
			DelayCommand(0.1, AssignCommand(oDorak, SetFacingPoint(lPC)));
			
			// Since the player may trigger the conversation before Zhar has walked back
			// to the Council, add a check to make sure he is close enough
			if (GetDistanceBetween(oVandar, oZhar) < 5.0)
				{
					AssignCommand(oZhar, SetCommandable(TRUE, OBJECT_SELF));
					DelayCommand(0.1, AssignCommand(oZhar, SetFacingPoint(lPC)));
				}
			
			SetDialogPlaceableCamera(37);
			
			DelayCommand(6.0, ActionResumeConversation());
		}
	
		else if (GetLocalBoolean(oVandar, 53) == FALSE && GetGlobalNumber("DAN_JEDI_PLOT") < 7)
			{
				object oPC = GetFirstPC();
				object oPM1 = CP_GetPartyMember(1);
				object oPM2 = CP_GetPartyMember(2);
				object oVandar = GetObjectByTag("dan13_vandar", 0);
				object oVrook = GetObjectByTag("dan13_vrook", 0);
				object oZhar = GetObjectByTag("dan13_zhar", 0);
				object oDorak = GetObjectByTag("dan13_dorak", 0);
				location lPC = Location(Vector(103.204,34.028,4.08), -47.0);
				location lPM1 = Location(Vector(101.164,34.08,4.04), -47.0);
				location lPM2 = Location(Vector(103.142,36.058,4.04), -47.0);
				
				SetGlobalFadeOut();
				
				SetDialogPlaceableCamera(8);
				
				CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
				
				AssignCommand(oPC, DelayCommand(0.1, ActionDoCommand(SetFacingPoint(GetPosition(oVandar)))));
				AssignCommand(oPM1, DelayCommand(0.1, ActionDoCommand(SetFacingPoint(GetPosition(oVandar)))));
				AssignCommand(oPM2, DelayCommand(0.1, ActionDoCommand(SetFacingPoint(GetPosition(oVandar)))));
				
				//Make the Council members face the PC'S destination. No Zhar since he is in a side room.
				AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
				DelayCommand(0.2, AssignCommand(oVandar, SetFacingPoint(GetPosition(oPC))));
				AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
				DelayCommand(0.2, AssignCommand(oVrook, SetFacingPoint(GetPosition(oPC))));
				AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
				DelayCommand(0.2, AssignCommand(oDorak, SetFacingPoint(GetPosition(oPC))));
				
				SetGlobalFadeIn(0.2, 0.75);
			}
}
