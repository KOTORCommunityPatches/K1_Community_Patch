////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_bolook.dlg on Entry 262.
	
	This script is fired during the intro of the Murder Mystery quest, spawning
	in Handon, Rickard, the protocol droid, and the placeable corpse. This has
	been altered in order additionally spawn in the new creature-based corpse,
	with the original placeable having been swapped to an invisible one. This
	was done to replace the low quality placeable corpse model with something
	of higher quality.
	
	Updated 2019-04-28 to add a custom spawn position for the creature-based
	corpse, thanks to JC, to fix an issue with it floating off the ground.
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////

// Globals
	int intGLOB_1 = 1;
	int intGLOB_2 = 2;
	int intGLOB_3 = 3;
	int intGLOB_4 = 4;
	int intGLOB_5 = 5;
	int intGLOB_6 = 6;
	int intGLOB_7 = 3;
	int intGLOB_8 = 4;
	int intGLOB_9 = 5;
	int intGLOB_10 = 6;
	int intGLOB_11 = 7;
	int intGLOB_12 = 1;
	int intGLOB_13 = 2;
	int intGLOB_14 = 3;
	int intGLOB_15 = 4;
	int intGLOB_16 = 5;
	int intGLOB_17 = 6;
	int intGLOB_18 = 7;
	int intGLOB_19 = 8;
	int intGLOB_20 = 9;
	int intGLOB_21 = 10;
	int intGLOB_22 = 11;
	int intGLOB_23 = 12;
	int intGLOB_24 = 13;
	int intGLOB_25 = 14;
	int intGLOB_26 = 15;
	int intGLOB_27 = 16;
	int intGLOB_28 = 17;
	int intGLOB_29 = 18;
	int intGLOB_30 = 19;
	int intGLOB_31 = 20;
	int intGLOB_32 = 21;
	int intGLOB_33 = 22;
	int intGLOB_34 = 23;
	int intGLOB_35 = 24;
	int intGLOB_36 = 25;
	int intGLOB_37 = 26;
	int intGLOB_38 = 27;
	int intGLOB_39 = 28;
	int intGLOB_40 = 29;
	int intGLOB_41 = 30;
	int intGLOB_42 = 59;
	int intGLOB_43 = 0;
	int intGLOB_44 = 1;
	int intGLOB_45 = 2;
	int intGLOB_46 = 29;
	int intGLOB_47 = 30;
	int intGLOB_48 = 34;
	int intGLOB_49 = 35;
	int intGLOB_50 = 36;
	int intGLOB_51 = 37;
	int intGLOB_52 = 38;
	int intGLOB_53 = 39;
	int intGLOB_54 = 41;
	int intGLOB_55 = 42;
	int intGLOB_56 = 46;
	int intGLOB_57 = 47;
	int intGLOB_58 = 15;
	int intGLOB_59 = 10;
	int intGLOB_60 = 5;
	int intGLOB_61 = 2;
	int intGLOB_62;
	int intGLOB_63;
	int intGLOB_64;
	object objectGLOB_1;
	int intGLOB_65;
	int intGLOB_66;
	int intGLOB_67;
	int intGLOB_68;
	int intGLOB_69;
	int intGLOB_70;
	int intGLOB_71 = 1;
	int intGLOB_72 = 2;
	int intGLOB_73 = 3;
	int intGLOB_74 = 20;
	int intGLOB_75 = 21;
	int intGLOB_76 = 22;
	int intGLOB_77 = 23;
	int intGLOB_78 = 24;
	int intGLOB_79 = 25;
	int intGLOB_80 = 26;
	int intGLOB_81 = 27;
	int intGLOB_82 = 28;
	int intGLOB_83 = 31;
	int intGLOB_84 = 32;
	int intGLOB_85 = 33;
	int intGLOB_86 = 40;
	int intGLOB_87 = 43;
	int intGLOB_88 = 44;
	int intGLOB_89 = 45;
	int intGLOB_90 = 48;
	int intGLOB_91 = 49;
	int intGLOB_92 = 50;
	int intGLOB_93 = 51;
	int intGLOB_94 = 52;
	int intGLOB_95 = 53;
	int intGLOB_96 = 54;
	int intGLOB_97 = 55;
	int intGLOB_98 = 56;
	int intGLOB_99 = 57;
	int intGLOB_100 = 58;
	int intGLOB_101 = 60;
	int intGLOB_102 = 61;
	int intGLOB_103 = 62;
	int intGLOB_104 = 63;
	int intGLOB_105 = 64;
	int intGLOB_106 = 65;
	int intGLOB_107 = 66;
	int intGLOB_108 = 67;
	int intGLOB_109 = 68;
	int intGLOB_110 = 69;
	int intGLOB_111 = 70;
	int intGLOB_112 = 71;
	int intGLOB_113 = 72;
	int intGLOB_114 = 1;
	int intGLOB_115 = 2;
	int intGLOB_116 = 3;
	int intGLOB_117 = 4;
	int intGLOB_118 = 0;
	int intGLOB_119 = 1;
	int intGLOB_120 = 2;
	int intGLOB_121 = 3;
	int intGLOB_122 = 4;
	int intGLOB_123 = 5;
	int intGLOB_124 = 6;
	int intGLOB_125 = 7;
	int intGLOB_126 = 8;
	int intGLOB_127 = 9;
	int intGLOB_128 = 10;
	int intGLOB_129 = 11;
	int intGLOB_130 = 12;
	int intGLOB_131 = 13;
	int intGLOB_132 = 14;
	int intGLOB_133 = 15;
	int intGLOB_134 = 16;
	int intGLOB_135 = 17;
	int intGLOB_136 = 18;
	int intGLOB_137 = 19;
	int intGLOB_138 = 1100;
	int intGLOB_139 = (-6);
	int intGLOB_140 = (-5);
	int intGLOB_141 = (-4);
	int intGLOB_142 = (-2);
	int intGLOB_143 = (-1);
	int intGLOB_144 = 0;
	int intGLOB_145 = 4;
	int intGLOB_146 = 1;
	int intGLOB_147 = 7;
	int intGLOB_148 = 1;
	int intGLOB_149 = 2;
	int intGLOB_150 = 3;
	int intGLOB_151 = 1;
	int intGLOB_152 = 2;
	int intGLOB_153 = 3;
	int intGLOB_154 = 4;
	int intGLOB_155 = 5;
	int intGLOB_156 = 6;
	string stringGLOB_1 = "bastila";
	string stringGLOB_2 = "carth";
	string stringGLOB_3 = "dan13_WP_council";
	string stringGLOB_4 = "g_w_lghtsbr01";
	string stringGLOB_5 = "g_w_lghtsbr03";
	string stringGLOB_6 = "g_w_lghtsbr04";
	string stringGLOB_7 = "dan_wanderhound";

// Prototypes
void PlaceNPC(string sTag, string sLocation = "");

void PlaceNPC(string sTag, string sLocation = "")
{
    if(!GetIsObjectValid(GetObjectByTag(sTag)))
    {
        CreateObject(OBJECT_TYPE_CREATURE,sTag,GetLocation(GetObjectByTag("POST_" + sTag + sLocation)));
    }
}

void main() {
	
	location lCorpse = GetLocation(GetObjectByTag("POST_dan14_corpse", 0));
	location lSpawn = Location(Vector(326.6, 423.9, 61.3), 230.0);

	PlaceNPC("dan14_handon", "");
	PlaceNPC("dan14_rickard", "");
	PlaceNPC("dan14_idroid", "");
	
	CreateObject(OBJECT_TYPE_PLACEABLE, "dan14_corpse", lCorpse, FALSE);
	CreateObject(OBJECT_TYPE_CREATURE, "cp_dan14ac_cpse", lSpawn, FALSE);
}