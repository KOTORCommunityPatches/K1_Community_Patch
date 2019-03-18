////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	An edited OnDeath script for Jagi.
	
	Original script edit by LiliArch.
	
	Adds an event signal to Jagi's OnUserDefine (k_ptat_jagi02) in order to
	update the quest once he dies.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_switch"
#include "k_inc_debug"

void main()
{
    ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DEATH);
    SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    /*
    if(!GN_GetSpawnInCondition(SW_FLAG_AI_OFF))
    {
        SpeakString("GEN_I_AM_DEAD", TALKVOLUME_SILENT_TALK);
        //Shout Attack my target, only works with the On Spawn In setup
        SpeakString("GEN_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
    }
    if(GN_GetSpawnInCondition(SW_FLAG_EVENT_ON_DEATH))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    */
}