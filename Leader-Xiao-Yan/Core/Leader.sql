
 /*
	Leader: Xiao Yan
	Author: Burkart
*/

-----------------------------------------------
-- Types
-----------------------------------------------

INSERT INTO	Types
		(Type,								    Kind			)
VALUES	('LEADER_CN_XIAOYAN',					'KIND_LEADER'	),
		('TRAIT_LEADER_CN_XIAOYAN_UA',			'KIND_TRAIT'	);
		
-----------------------------------------------
-- Traits
-----------------------------------------------		

INSERT INTO	Traits
		(TraitType,							    Name,										Description										)
VALUES	('TRAIT_LEADER_CN_XIAOYAN_UA',			'LOC_TRAIT_LEADER_CN_XIAOYAN_UA_NAME',		'LOC_TRAIT_LEADER_CN_XIAOYAN_UA_DESCRIPTION');

-----------------------------------------------
-- Leaders
-----------------------------------------------

INSERT INTO	Leaders
		(LeaderType,				    Name,						    InheritFrom,		SceneLayers		)
VALUES	('LEADER_CN_XIAOYAN',			'LOC_LEADER_CN_XIAOYAN_NAME',	'LEADER_DEFAULT', 	4				);

INSERT INTO LeaderTraits
		(LeaderType,				    TraitType						    )
VALUES	('LEADER_CN_XIAOYAN',			'TRAIT_LEADER_CN_XIAOYAN_UA'		);
		
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------

INSERT INTO	LeaderQuotes
		(LeaderType,				        Quote										)
VALUES	('LEADER_CN_XIAOYAN',			    'LOC_PEDIA_LEADERS_PAGE_CN_XIAOYAN_QUOTE'	);

-- DiplomacyInfo
INSERT INTO DiplomacyInfo
			(Type,					        BackgroundImage				)
VALUES		('LEADER_CN_XIAOYAN',		    'LEADER_CN_XIAOYAN_DIP_BACK');

-----------------------------------------------
-- LoadingInfo
-----------------------------------------------

INSERT INTO	LoadingInfo
		(LeaderType,				    ForegroundImage,						    BackgroundImage,						PlayDawnOfManAudio,    			LeaderText						    )
VALUES	('LEADER_CN_XIAOYAN',			'LEADER_CN_XIAOYAN_PORTRAIT',				'LEADER_T_ROOSEVELT_BACKGROUND',		0,					   			'LOC_LOADING_INFO_LEADER_CN_XIAOYAN'	);

-----------------------------------------------
-- FavoredReligions
-----------------------------------------------

INSERT INTO FavoredReligions
		(LeaderType,			            ReligionType		)
VALUES	('LEADER_CN_XIAOYAN',		        'RELIGION_BUDDHISM'	);

-- CityNames
INSERT OR REPLACE INTO	CityNames
		(CivilizationType,					LeaderType,						SortIndex,			CityName				  )						
VALUES	('CIVILIZATION_CHINA',	            'LEADER_CN_XIAOYAN',			0,					'LOC_CITY_NAME_JIANKANG'  );
	
-- CivilizationLeaders
INSERT INTO	CivilizationLeaders
		(CivilizationType,					LeaderType,					    CapitalName				)
VALUES	('CIVILIZATION_CHINA',	            'LEADER_CN_XIAOYAN',	        'LOC_CITY_NAME_JIANKANG');