
 /*
	Leader
	Authors: Burkart
*/

-----------------------------------------------
-- Types
-----------------------------------------------

INSERT INTO	Types
		(Type,									Kind			)
VALUES	('LEADER_CN_CAO_CAO',					'KIND_LEADER'	),
		('TRAIT_LEADER_CN_CAO_CAO_UA',			'KIND_TRAIT'	);
		
-----------------------------------------------
-- Traits
-----------------------------------------------		

INSERT INTO	Traits
		(TraitType,								Name,											Description										)
VALUES	('TRAIT_LEADER_CN_CAO_CAO_UA',			'LOC_TRAIT_LEADER_CN_CAO_CAO_UA_NAME',			'LOC_TRAIT_LEADER_CN_CAO_CAO_UA_DESCRIPTION'	);

-----------------------------------------------
-- Leaders
-----------------------------------------------

INSERT INTO	Leaders
		(LeaderType,					Name,								InheritFrom,		SceneLayers		)
VALUES	('LEADER_CN_CAO_CAO',			'LOC_LEADER_CN_CAO_CAO_NAME',		'LEADER_DEFAULT', 	4				);

INSERT INTO LeaderTraits
		(LeaderType,					TraitType									)
VALUES	('LEADER_CN_CAO_CAO',			'TRAIT_LEADER_WEI_UNIT_TIGER_CAVALRY'		);
		
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------

INSERT INTO	LeaderQuotes
		(LeaderType,					Quote											)
VALUES	('LEADER_CN_CAO_CAO',			'LOC_PEDIA_LEADERS_PAGE_CN_CAO_CAO_QUOTE'		);

-- DiplomacyInfo
INSERT INTO DiplomacyInfo
			(Type,						BackgroundImage				)
VALUES		('LEADER_CN_CAO_CAO',		'LEADER_WEI_DIP_BACK'		);

-----------------------------------------------
-- LoadingInfo
-----------------------------------------------

INSERT INTO	LoadingInfo
		(LeaderType,					ForegroundImage,					BackgroundImage,						PlayDawnOfManAudio,    			LeaderText						        )
VALUES	('LEADER_CN_CAO_CAO',			'LEADER_WEI_PORTRAIT',				'LEADER_T_ROOSEVELT_BACKGROUND',		0,					   			'LOC_LOADING_INFO_LEADER_CN_CAO_CAO'	);

-----------------------------------------------
-- FavoredReligions
-----------------------------------------------

INSERT INTO FavoredReligions
		(LeaderType,				ReligionType			)
VALUES	('LEADER_CN_CAO_CAO',		'RELIGION_CONFUCIANISM'	);

-- CityNames
INSERT INTO	CityNames
		(CivilizationType,					LeaderType,								SortIndex,			CityName				)						
VALUES	('CIVILIZATION_CHINA',	            'LEADER_CN_CAO_CAO',					-1,					'LOC_CITY_NAME_YECHENG' );
		
-- CivilizationLeaders
INSERT INTO	CivilizationLeaders
		(CivilizationType,					LeaderType,					        CapitalName				)
VALUES	('CIVILIZATION_CHINA',	            'LEADER_CN_CAO_CAO',	            'LOC_CITY_NAME_XUDU'	);
