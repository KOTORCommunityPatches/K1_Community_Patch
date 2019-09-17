////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_kor39.utd in korr_m36aa (Korriban Valley of Dark Lords).

	This script is the OnUserDefine for the Tukata Queen. When teaming up with
	Lashowe to kill her, occasionally a placeable bench with no tag will spawn
	on top of her corpse. It seems likely that this is a bug caused by an
	invalid ResRef called by UT_CreateObject. Possibly this was cut content
	of some sort that wasn't excised from the vanilla script before shipping.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	int nEvent = GetUserDefinedEventNumber();
	
	if ((nEvent == 1001))
		{
		}
	else
		{
			if ((nEvent == 1002))
				{
				}
			else
				{
					if ((nEvent == 1003))
						{
						}
					else
						{
							if ((nEvent == 1004))
								{
								}
							else
								{
									if ((nEvent == 1005))
										{
										}
									else
										{
											if ((nEvent == 1006))
												{
												}
											else
												{
													if ((nEvent == 1007))
														{
															object oTukMook1 = GetObjectByTag("kor36_tukatahen1", 0);
															object oTukMook2 = GetObjectByTag("kor36_tukatahen2", 0);
															
															if ((GetIsDead(oTukMook1) && GetIsDead(oTukMook2)))
																{
																	object oPC = GetFirstPC();
																	//location lQuuen = GetLocation(OBJECT_SELF);
																	object oLashowe = GetObjectByTag("kor36_lashowe", 0);
																	
																	// Placeable ResRef doesn't exist, possibly causing issues, so null it out.
																	//UT_CreateObject(OBJECT_TYPE_PLACEABLE, "kor36_plc_queen", lQuuen);
																	
																	SetGlobalBoolean("KOR_TUKATA_GONE", TRUE);
																	
																	CancelCombat(oLashowe);
																	ChangeToStandardFaction(oLashowe, STANDARD_FACTION_NEUTRAL);
																	
																	UT_NPC_InitConversation("kor36_lashowe", "", OBJECT_INVALID);
																}
															
															SetGlobalBoolean("KOR_TUKATAQUEEN", TRUE);
														}
													else
														{
															if ((nEvent == 1008))
																{
																}
															else
																{
																	if ((nEvent == 1009))
																		{
																		}
																	else
																		{
																			if ((nEvent == 1010))
																				{
																				}
																		}
																}
														}
												}
										}
								}
						}
				}
		}
}
