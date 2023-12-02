--======================================================================
--	COLORS
--======================================================================
--	Colors
-------------------------------------
INSERT OR REPLACE INTO Colors
		(Type,								Color)
VALUES
		("COLOR_PLAYER_CN_XIAOYAN_1",		"190,168,16,255"),	--#BEA810
		("COLOR_PLAYER_CN_XIAOYAN_2",		"219,42,43,255");	--#DB2A2B
-------------------------------------
--	PlayerColors
-------------------------------------
INSERT OR REPLACE INTO PlayerColors
		(
			Type,
			Usage,

			PrimaryColor,
			SecondaryColor,

			Alt1PrimaryColor,
			Alt1SecondaryColor,

			Alt2PrimaryColor,
			Alt2SecondaryColor,

			Alt3PrimaryColor,
			Alt3SecondaryColor
		)
VALUES
		(
			"LEADER_CN_XIAOYAN",
			"Unique",

			"COLOR_PLAYER_CN_XIAOYAN_1",
			"COLOR_PLAYER_CN_XIAOYAN_2",

			"COLOR_STANDARD_RED_MD",
			"COLOR_STANDARD_YELLOW_MD",

			"COLOR_STANDARD_WHITE_LT",
			"COLOR_STANDARD_RED_DK",

			"COLOR_STANDARD_RED_DK",
			"COLOR_STANDARD_WHITE_LT"
		);
--======================================================================
--======================================================================
