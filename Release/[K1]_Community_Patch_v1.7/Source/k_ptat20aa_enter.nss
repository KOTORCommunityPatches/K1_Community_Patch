void spawnGriff() {
  object oPC = GetFirstPC();
  object oEntering = GetEnteringObject();
  object oGriff = GetObjectByTag("tat20_griff");
 
  // If we've talked to the Czerka officer about Griff and Griff hasn't already spawned
  if((GetIsPC(oEntering)) && (GetGlobalNumber("Mis_MissionTalk") == 9) && (GetIsObjectValid(oGriff) == FALSE)) { 

    location lGriffSpawn = GetLocation(GetWaypointByTag("tat20_wp_griff"));
    location lGriffGuard1 = GetLocation(GetObjectByTag("tat20_griffguard", 0));
    location lGriffGuard2 = GetLocation(GetObjectByTag("tat20_griffguard", 1));
    location lGriffGuard3 = GetLocation(GetObjectByTag("tat20_griffguard", 2));
    location lGriffGuard4 = GetLocation(GetObjectByTag("tat20_griffguard", 3));
    

    CreateObject(OBJECT_TYPE_CREATURE, "tat20_griff", lGriffSpawn);
    CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard1);
    CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard2);
    CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard3);
    CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", lGriffGuard4);
  }
}

void main(){
  ExecuteScript("k_ptat20aa_old", OBJECT_SELF);

  DelayCommand(2.0, spawnGriff());
}