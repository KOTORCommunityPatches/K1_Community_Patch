//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Party selection screen exit script for ebo_m12aa (Ebon Hawk).
	
	This is the exit script fired from the party selection screen when the player
	disembarks the Ebon Hawk. If the player entered the Hawk previously controlling
	one of the party members, then selects that party member again when leaving,
	they'll be back in control of that party member instead of the player character
	in the new module. A simple check has been added to always make the player the
	party leader.
	
	Updated 2022-10-10 to add in the setting of the global boolean that flags if
	the party is on the Ebon Hawk or not. There is what appears to be a module
	OnExit script that was intended to do this, k_pebn_hawkgo, but it is unused.
	Since we already edit this script for all Hawk modules, it was easier to add
	it here.
	
	Issue #466: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/466
	
	Issue #673: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/673
	
	DP 2021-05-23 / DP 2022-10-10												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nGlobal = GetGlobalNumber("K_CURRENT_PLANET");
	int nSize = GetPartyMemberCount();
	
	SetGlobalBoolean("K_AT_EBON_HAWK", FALSE);
	
	if (nSize > 1)
		{
			SetPartyLeader(NPC_PLAYER);
		}
	
	if (nGlobal == 5) // ENDAR SPIRE
		{
			StartNewModule("", "k_end_ebon_hawk_transition");
		}
		else if (nGlobal == 10) // TARIS
			{
				StartNewModule("tar_m02aa", "k_tar_ebon_hawk_transition");
			}
			else if (nGlobal == 15) // DANTOOINE
				{
					StartNewModule("danm13", "k_dan_ebon_hawk_transition");
				}
				else if (nGlobal == 20) // KASHYYYK
					{
						StartNewModule("kas_m22aa", "k_kas_ebon_hawk_transition");
					}
					else if (nGlobal == 25) // MANAAN
						{
							StartNewModule("manm26ad", "k_man_ebon_hawk_transition");
						}
						else if (nGlobal == 30) // KORRIBAN
							{
								StartNewModule("korr_m33aa", "k_kor_ebon_hawk_transition");
							}
							else if (nGlobal == 35) // TATOOINE
								{
									StartNewModule("tat_m17ab", "k_tat_ebon_hawk_transition");
								}
								else if (nGlobal == 40) // LEVIATHAN
									{
										StartNewModule("lev_40ac", "k_lev_ebon_hawk_transition");
									}
									else if (nGlobal == 45) // UNKNOWN WORLD
										{
											StartNewModule("unk_m41aa", "k_unk_ebon_hawk_transition");
										}
										else if (nGlobal == 50) // STAR FORGE
											{
												StartNewModule("sta_m45aa", "k_sta_ebon_hawk_transition");
											}
											else if (nGlobal == 55) // YAVIN STATION
												{
													StartNewModule("liv_m99aa", "k_live1_ebon_hawk_transition");
												}
												else if (nGlobal == 60) // UNUSED DLC SLOT 2
													{
														StartNewModule("liv_m99ab", "k_live2_ebon_hawk_transition");
													}
													else if (nGlobal == 65) // UNUSED DLC SLOT 3
														{
															StartNewModule("liv_m99ac", "k_live3_ebon_hawk_transition");
														}
														else if (nGlobal == 70) // UNUSED DLC SLOT 4
															{
																StartNewModule("liv_m99ad", "k_live4_ebon_hawk_transition");
															}
															else if (nGlobal == 75) // UNUSED DLC SLOT 5
																{
																	StartNewModule("liv_m99ae", "k_live5_ebon_hawk_transition");
																}
																else if (nGlobal == 80) // UNUSED DLC SLOT 6
																	{
																		StartNewModule("liv_m99af", "k_live6_ebon_hawk_transition");
																	}
}

