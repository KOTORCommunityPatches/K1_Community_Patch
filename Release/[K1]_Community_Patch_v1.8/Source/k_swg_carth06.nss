//:: k_swg_carth06
/*
    If Carth's personal dialogue is on sixth branch
    and first starmap uncovered
*/
//:: Created By: David Gaider
//:: Copyright (c) 2002 Bioware Corp.

////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Edited to fix an issue with this dialogue being triggered too early. Carth
	would complain about being "left out of the loop" if the player talked to
	him before talking to the Jedi Council.
	
	JC 2019-01-25                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_debug"

int StartingConditional() {

int iResult = GetGlobalNumber("K_SWG_CARTH");
int nLevel = GetHitDice(GetFirstPC());
int nLastLevel = GetGlobalNumber("K_SWG_CARTH_LEVEL");
int nPlot = GetGlobalNumber("DAN_PLANET_PLOT");

if( iResult == 5 && nPlot >= 2 && nLevel > nLastLevel ) {
	return TRUE;
	}
return FALSE;

}
