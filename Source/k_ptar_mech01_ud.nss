//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for cp_tar10_vulkd02.utc/cp_tar10_vulkg02.utc/cp_tar10_vulkg03.utc/
	tar10_vulkgan001.utc/tar10_vulkgang.utc in tar_m10ac (Taris Black Vulkar Base
	Lower/Garage).
	
	This is the UserDefine script for the Vulkar mechanics that start unarmed so
	that they can pantomime working on swoops. This lead them attacking with their
	fists when they started off hostile, so they have been switched to neutral and
	now rely on a perception event to arm themselves and turn hostile, with two
	failsafes in a Heartbeat check and a pseudo shout from an adjacent mechanic.
	This was done since perception events seem to be extremely unreliable.
	
	Updated 2023-12-11 to add an event signalled from a door OnOpen, since the 
	OnPerception event was failing to fire far too often to be acceptable. This
	event turns them hostile but doesn't apply the GN_DetermineCombatRound just
	in case the door was opened via slicing the computer terminal.
	
	See also cp_tar10_vulmecd, k_ptar_mech01_sp.
	
	Issue #240: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/240
	
	DP 2023-11-26 / DP 2023-12-11												*/
//////////////////////////////////////////////////////////////////////////////////


#include "cp_inc_k1"

void CP_SendAlert() {
	
	string sTag = GetTag(OBJECT_SELF);
	string sTarget;
	
	if (sTag == "cp_tar10_vulkd02")
		{
			sTarget = "tar10_vulkgang";
		}
		else if (sTag == "tar10_vulkgang")
			{
				sTarget = "cp_tar10_vulkd02";
			}
			else if (sTag == "cp_tar10_vulkg02")
				{
					sTarget = "cp_tar10_vulkg03";
				}
				else if (sTag == "cp_tar10_vulkg03")
					{
						sTarget = "cp_tar10_vulkg02";
					}
					else
						{
							// For the one mook by himself, do nothing.
							return;
						}
	
	// For those in pairs, signal the one next to them to turn hostile.
	SignalEvent(GetObjectByTag(sTarget), EventUserDefined(999));
}

void CP_TurnHostile1() {
	SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_09, TRUE);
	SetLocalBoolean(OBJECT_SELF, 20, FALSE); // SW_FLAG_EVENT_ON_PERCEPTION
	SetLocalBoolean(OBJECT_SELF, 28, FALSE); // SW_FLAG_EVENT_ON_HEARTBEAT
	CP_SendAlert();
	ClearAllActions();
	DelayCommand(0.2, CP_EquipFirstWeapon(OBJECT_SELF, FALSE));
	DelayCommand(0.3, ActionDoCommand(ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1)));
	DelayCommand(0.5, ActionDoCommand(ExecuteScript("k_ai_master", OBJECT_SELF, 3001)));
}

void CP_TurnHostile2() {
	SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_09, TRUE);
	SetLocalBoolean(OBJECT_SELF, 20, FALSE); // SW_FLAG_EVENT_ON_PERCEPTION
	SetLocalBoolean(OBJECT_SELF, 28, FALSE); // SW_FLAG_EVENT_ON_HEARTBEAT
	ClearAllActions();
	DelayCommand(0.1, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	DelayCommand(0.2, ActionDoCommand(CP_EquipFirstWeapon(OBJECT_SELF, FALSE)));
	DelayCommand(0.3, ActionDoCommand(ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1)));
}

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 888) // CUSTOM EVENT - DOOR ONOPEN SIGNAL
		{
			if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_09))
				{
					CP_TurnHostile2();
				}
		}
	else if (nUser == 999) // CUSTOM EVENT - PSEUDO SHOUT
		{
			if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_09))
				{
					CP_TurnHostile1();
				}
		}
	else if (nUser == 1001) // HEARTBEAT
		{
			object oNearest;
			int nCnt = 1;
			
			// Do a check of the two nearest creatures every heartbeat tick (~3 seconds) in case the perception check failed to fire.
			// Checking two is required since the nearest in most cases is likely to be another of the neutral mooks.
			
			oNearest = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, nCnt);
			
			if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_09))
				{
					while (nCnt < 3)
						{
							if (GetIsPC(oNearest) || GetStandardFaction(oNearest) == STANDARD_FACTION_FRIENDLY_1 || GetStandardFaction(oNearest) == STANDARD_FACTION_FRIENDLY_2)
								{
									if (GetDistanceBetween(OBJECT_SELF, oNearest) <= 5.0)
										{
											CP_TurnHostile1();
										}
								}
							
							nCnt++;
							
							oNearest = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, nCnt);
						}
				}
		}
	else if (nUser == 1002) // PERCEIVE
		{
			object oPerceived = GetLastPerceived();
			
			if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_09))
				{
					// If you can perceive a party member or a friendly (like a reactivated patrolling droid).
					
					if (GetIsPC(oPerceived) || GetStandardFaction(oPerceived) == STANDARD_FACTION_FRIENDLY_1 || GetStandardFaction(oPerceived) == STANDARD_FACTION_FRIENDLY_2)
						{
							if (GetLastPerceptionSeen())
								{
									CP_TurnHostile1();
								}
								else if (GetLastPerceptionHeard() && GetDistanceBetween(OBJECT_SELF, oPerceived) < 5.0)
									{
										// Attempted fallback, but I have never seen this trigger in practice if the seen check fails.
										CP_TurnHostile1();
									}
						}
				}
		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
