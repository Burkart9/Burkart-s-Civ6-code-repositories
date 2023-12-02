
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES 
('ABILITY_HUBAO', 'MODIFIER_ABILITY_HUBAO');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('MODIFIER_ABILITY_HUBAO', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, 0, NULL, 'REQSET_MODIFIER_ABILITY_HUBAO');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('MODIFIER_ABILITY_HUBAO', 'Amount', '5');

-- RequirementSets

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQSET_MODIFIER_ABILITY_HUBAO', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQSET_MODIFIER_ABILITY_HUBAO', 'REQ_MODIFIER_ABILITY_HUBAO');

-- Requirements

INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQ_MODIFIER_ABILITY_HUBAO', 'REQUIREMENT_OPPONENT_IS_WOUNDED');


INSERT INTO MomentIllustrations
		(MomentIllustrationType, 					MomentDataType,				GameDataType,					Texture							)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT', 		'MOMENT_DATA_UNIT',			'UNIT_TIGER_CAVALRY',			'MOMENT_UNIT_TIGER_CAVALRY.dds'	);
