-----------------------------------------------
-- LeaderTraits£¨∞Û∂®¡Ï–‰”Îtrait
-----------------------------------------------
INSERT INTO	LeaderTraits
		(LeaderType,				TraitType							)
VALUES	('LEADER_CN_CAO_CAO',		'TRAIT_LEADER_CN_CAO_CAO_UA'		);

CREATE TEMPORARY TABLE "CaocaoData"(
	"BuildingType" TEXT NOT NULL,
	"YieldType" TEXT NOT NULL,
	"YieldChange" INTEGER NOT NULL
);

INSERT INTO CaocaoData			
		(BuildingType,				YieldType,				YieldChange)
SELECT	BuildingType,				YieldType,				YieldChange
FROM Building_YieldChanges WHERE BuildingType IN(
	SELECT BuildingType FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_ENCAMPMENT', 'DISTRICT_THEATER', 'DISTRICT_COMMERCIAL_HUB')
	AND BuildingType NOT IN (SELECT CivUniqueBuildingType FROM BuildingReplaces)
);

----------------------------------------------------------------------------------------------------------------------------
-- MODIFIERS
----------------------------------------------------------------------------------------------------------------------------
-- TraitModifiers		
-------------------------------------			
INSERT INTO TraitModifiers			
		(TraitType,								ModifierId)
SELECT DISTINCT 'TRAIT_LEADER_CN_CAO_CAO_UA', 			'CAO_GREEKLING_' || BuildingType
FROM CaocaoData;
--------------------------------------------------------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Modifiers	
		(ModifierId,								ModifierType)
SELECT DISTINCT	'CAO_GREEKLING_' || BuildingType,			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'
FROM CaocaoData;
-------------------------------------
-- ModifierArguments
-------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,								Name,				Value)
SELECT DISTINCT	'CAO_GREEKLING_' || BuildingType,			'Amount',			50
FROM CaocaoData;

INSERT INTO ModifierArguments
		(ModifierId,								Name,				Value)
SELECT DISTINCT	'CAO_GREEKLING_' || BuildingType,			'BuildingType',		BuildingType
FROM CaocaoData;


--MODIFIER_TRAIT_LEADER_CN_LIU_YU_UA_TRADE_CULTURE
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_CN_CAO_CAO_UA', 'MODIFIER_TRAIT_LEADER_CN_LIU_YU_UA_TRADE_CULTURE');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_TRAIT_LEADER_CN_LIU_YU_UA_TRADE_CULTURE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_SPECIALTY_DISTRICT_FOR_DOMESTIC', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_TRAIT_LEADER_CN_LIU_YU_UA_TRADE_CULTURE', 'Amount', '1'), 
('MODIFIER_TRAIT_LEADER_CN_LIU_YU_UA_TRADE_CULTURE', 'YieldType', 'YIELD_CULTURE');
