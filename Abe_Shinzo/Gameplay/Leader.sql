
 /*
	Leader
	Authors: Burkart
*/

-----------------------------------------------
-- Types
-----------------------------------------------

INSERT INTO	Types
		(Type,								Kind			)
VALUES	('LEADER_JP_ABE',					'KIND_LEADER'	),
		('TRAIT_LEADER_JP_ABE_UA',			'KIND_TRAIT'	);
		
-----------------------------------------------
-- Traits
-----------------------------------------------		

INSERT INTO	Traits
		(TraitType,							Name,										Description										)
VALUES	('TRAIT_LEADER_JP_ABE_UA',			'LOC_TRAIT_LEADER_JP_ABE_UA_NAME',			'LOC_TRAIT_LEADER_JP_ABE_UA_DESCRIPTION');

-----------------------------------------------
-- Leaders
-----------------------------------------------

INSERT INTO	Leaders
		(LeaderType,				Name,						InheritFrom,		SceneLayers		)
VALUES	('LEADER_JP_ABE',			'LOC_LEADER_JP_ABE_NAME',	'LEADER_DEFAULT', 	4				);

INSERT INTO LeaderTraits
		(LeaderType,				TraitType						)
VALUES	('LEADER_JP_ABE',			'TRAIT_LEADER_JP_ABE_UA'		);
		
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------

INSERT INTO	LeaderQuotes
		(LeaderType,				Quote										)
VALUES	('LEADER_JP_ABE',			'LOC_PEDIA_LEADERS_PAGE_JP_ABE_QUOTE'		);

-- DiplomacyInfo
INSERT INTO DiplomacyInfo
			(Type,					BackgroundImage					)
VALUES		('LEADER_JP_ABE',		'LEADER_JP_ABE_DIP_BACK'		);

-----------------------------------------------
-- LoadingInfo
-----------------------------------------------

INSERT INTO	LoadingInfo
		(LeaderType,				ForegroundImage,						BackgroundImage,						PlayDawnOfManAudio,    			LeaderText						    )
VALUES	('LEADER_JP_ABE',			'LEADER_JP_ABE_PORTRAIT',				'LEADER_T_ROOSEVELT_BACKGROUND',		0,					   			'LOC_LOADING_INFO_LEADER_JP_ABE'	);

-----------------------------------------------
-- FavoredReligions
-----------------------------------------------

INSERT INTO FavoredReligions
		(LeaderType,			ReligionType			)
VALUES	('LEADER_JP_ABE',		'RELIGION_SHINTO'		);
	
-- CivilizationLeaders
INSERT INTO	CivilizationLeaders
		(CivilizationType,					LeaderType,					    CapitalName				)
VALUES	('CIVILIZATION_JAPAN',	            'LEADER_JP_ABE',	            'LOC_CITY_NAME_TOKYO'	);