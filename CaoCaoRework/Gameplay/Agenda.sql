
-- Agendas
INSERT INTO Types
			(Type,								Kind			)
VALUES		('TRAIT_AGENDA_CN_CAO_CAO',			'KIND_TRAIT'	);

INSERT INTO Agendas	
			(AgendaType,						Name,									Description							)
VALUES 		('AGENDA_CN_CAO_CAO',				'LOC_AGENDA_CN_CAO_CAO_NAME',			'LOC_AGENDA_CN_CAO_CAO_DESCRIPTION'	);

INSERT INTO Traits				
			(TraitType,							Name,									Description							)	
VALUES		('TRAIT_AGENDA_CN_CAO_CAO',			'LOC_AGENDA_CN_CAO_CAO_NAME',			'LOC_AGENDA_CN_CAO_CAO_DESCRIPTION'	);

INSERT INTO AgendaTraits
			(AgendaType,						TraitType					)
VALUES 		('AGENDA_CN_CAO_CAO',				'TRAIT_AGENDA_CN_CAO_CAO'	);

INSERT INTO HistoricalAgendas
			(LeaderType,						AgendaType				)
VALUES 		('LEADER_CN_CAO_CAO',				'AGENDA_CN_CAO_CAO'		);

INSERT INTO TraitModifiers
			(TraitType,							ModifierId								)
VALUES		('TRAIT_AGENDA_CN_CAO_CAO',			'MODIFIER_AGENDA_CN_CAO_CAO_UNHAPPY'	),
			('TRAIT_AGENDA_CN_CAO_CAO',			'MODIFIER_AGENDA_CN_CAO_CAO_HAPPY'		);
			
-----------------------------------------------
-- Modifiers 固定写法
-----------------------------------------------
INSERT INTO Modifiers	
			(ModifierId,									ModifierType,									SubjectRequirementSetId			)
VALUES		('MODIFIER_AGENDA_CN_CAO_CAO_UNHAPPY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_CN_CAO_CAO_UNHAPPY'		),
			('MODIFIER_AGENDA_CN_CAO_CAO_HAPPY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_CN_CAO_CAO_HAPPY'		);
-- ModifierStrings 固定写法
INSERT INTO ModifierStrings
			(ModifierId,									Context,						Text								)
VALUES		('MODIFIER_AGENDA_CN_CAO_CAO_UNHAPPY',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	),
			('MODIFIER_AGENDA_CN_CAO_CAO_HAPPY',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	);
-- ModifierArguments 好感度的变化与文本
INSERT INTO ModifierArguments
			(ModifierId,									Name,							Value												)
VALUES		('MODIFIER_AGENDA_CN_CAO_CAO_UNHAPPY',			'InitialValue',					-6													),
			('MODIFIER_AGENDA_CN_CAO_CAO_UNHAPPY',			'StatementKey',					'LOC_DIPLO_WARNING_LEADER_CN_CAO_CAO_REASON_ANY'  	),
			('MODIFIER_AGENDA_CN_CAO_CAO_UNHAPPY',			'SimpleModifierDescription',	'LOC_DIPLO_WARNING_EXIT_LEADER_CN_CAO_CAO_ANY'		),
	
			('MODIFIER_AGENDA_CN_CAO_CAO_HAPPY',			'InitialValue',					12													),
			('MODIFIER_AGENDA_CN_CAO_CAO_HAPPY',			'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CN_CAO_CAO_REASON_ANY'	    ),
			('MODIFIER_AGENDA_CN_CAO_CAO_HAPPY',			'SimpleModifierDescription',	'LOC_DIPLO_KUDO_EXIT_LEADER_CN_CAO_CAO_ANY'			);
-- RequirementSets 集合，包含了影响好感度的事件合集
INSERT INTO RequirementSets
			(RequirementSetId,								RequirementSetType			)
VALUES		('REQSET_CN_CAO_CAO_HAPPY',						'REQUIREMENTSET_TEST_ALL'	),
			('REQSET_CN_CAO_CAO_UNHAPPY',					'REQUIREMENTSET_TEST_ALL'	);
			
-----------------------------------------------
-- RequirementSetRequirements（合集中的各个事件，事实上控制了哪些条件会引起好感变化。这里没写RequirementType是因为这些RequirementId都是调用的游戏已经写好的，当然你也可以自己写。）
-----------------------------------------------

INSERT INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId						)
VALUES	('REQSET_CN_CAO_CAO_UNHAPPY',	'REQUIRES_MAJOR_CIV_OPPONENT'		),
		('REQSET_CN_CAO_CAO_UNHAPPY',	'REQUIRES_MET_10_TURNS_AGO'			),
		('REQSET_CN_CAO_CAO_UNHAPPY',	'REQUIRES_HAS_LOW_POPULATION'		),
		('REQSET_CN_CAO_CAO_UNHAPPY',	'REQUIRES_HAS_HIGH_STANDING_ARMY'	),
		('REQSET_CN_CAO_CAO_HAPPY',		'REQUIRES_MAJOR_CIV_OPPONENT'		),
		('REQSET_CN_CAO_CAO_HAPPY',		'REQUIRES_MET_10_TURNS_AGO'			),
		('REQSET_CN_CAO_CAO_HAPPY',		'REQUIRES_HAS_HIGH_POPULATION'	    ),
		('REQSET_CN_CAO_CAO_HAPPY',		'REQUIRES_HAS_HIGH_STANDING_ARMY'	);

INSERT INTO AgendaPreferredLeaders
			(AgendaType,					LeaderType,							PercentageChance)
VALUES		('AGENDA_CIVILIZED',			'LEADER_CN_CAO_CAO',				20				);