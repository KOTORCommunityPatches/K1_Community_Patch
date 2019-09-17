////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Script edit by Kexikus.
	
	Fixed an issue where the personal part of Juhanis conversation
	would be locked by progressing too fast in the history part by changing
	the G_JUHANIH_STATE check from "== 3" to ">= 3".
	
	After Juhani saying she lived on Taris (H3)

	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = ((GetGlobalNumber("G_JUHANIP_STATE") == 3) && (GetGlobalNumber("G_JUHANIH_STATE") >= 3));
    if (iResult)
    {
        SetGlobalNumber("G_JUHANIP_STATE", 4);
        SetGlobalNumber("T_LEVP", GetHitDice(GetFirstPC()));
    }

    return iResult;
}
