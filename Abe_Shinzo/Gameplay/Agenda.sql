
-- Abe Shinzo
-- Agendas
INSERT INTO Types
			(Type,							Kind			)
VALUES		('TRAIT_AGENDA_JP_ABE',			'KIND_TRAIT'	);

INSERT INTO Agendas	
			(AgendaType,					Name,								Description						)
VALUES 		('AGENDA_JP_ABE',				'LOC_AGENDA_JP_ABE_NAME',			'LOC_AGENDA_JP_ABE_DESCRIPTION'	);

INSERT INTO Traits				
			(TraitType,						Name,								Description						)	
VALUES		('TRAIT_AGENDA_JP_ABE',			'LOC_AGENDA_JP_ABE_NAME',			'LOC_AGENDA_JP_ABE_DESCRIPTION'	);

INSERT INTO AgendaTraits
			(AgendaType,					TraitType				)
VALUES 		('AGENDA_JP_ABE',				'TRAIT_AGENDA_JP_ABE'	);

INSERT INTO HistoricalAgendas
			(LeaderType,					AgendaType			)
VALUES 		('LEADER_JP_ABE',				'AGENDA_JP_ABE'		);

INSERT INTO TraitModifiers
			(TraitType,						ModifierId							)
VALUES		('TRAIT_AGENDA_JP_ABE',			'MODIFIER_AGENDA_JP_ABE_UNHAPPY'	),
			('TRAIT_AGENDA_JP_ABE',			'MODIFIER_AGENDA_JP_ABE_HAPPY'		);
			
-----------------------------------------------
-- Modifiers 固定写法
-----------------------------------------------
INSERT INTO Modifiers	
			(ModifierId,								ModifierType,									SubjectRequirementSetId		)
VALUES		('MODIFIER_AGENDA_JP_ABE_UNHAPPY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_JP_ABE_UNHAPPY'		),
			('MODIFIER_AGENDA_JP_ABE_HAPPY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_JP_ABE_HAPPY'		);
-- ModifierStrings 固定写法
INSERT INTO ModifierStrings
			(ModifierId,								Context,						Text								)
VALUES		('MODIFIER_AGENDA_JP_ABE_UNHAPPY',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	),
			('MODIFIER_AGENDA_JP_ABE_HAPPY',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	);
-- ModifierArguments 好感度的变化与文本
INSERT INTO ModifierArguments
			(ModifierId,								Name,							Value											)
VALUES		('MODIFIER_AGENDA_JP_ABE_UNHAPPY',			'InitialValue',					-12												),
			('MODIFIER_AGENDA_JP_ABE_UNHAPPY',			'StatementKey',					'LOC_DIPLO_WARNING_LEADER_JP_ABE_REASON_ANY'  	),
			('MODIFIER_AGENDA_JP_ABE_UNHAPPY',			'SimpleModifierDescription',	'LOC_DIPLO_WARNING_EXIT_LEADER_JP_ABE_ANY'		),
	
			('MODIFIER_AGENDA_JP_ABE_HAPPY',			'InitialValue',					12												),
			('MODIFIER_AGENDA_JP_ABE_HAPPY',			'StatementKey',					'LOC_DIPLO_KUDO_LEADER_JP_ABE_REASON_ANY'	    ),
			('MODIFIER_AGENDA_JP_ABE_HAPPY',			'SimpleModifierDescription',	'LOC_DIPLO_KUDO_EXIT_LEADER_JP_ABE_ANY'			);
-- RequirementSets 集合，包含了影响好感度的事件合集
INSERT INTO RequirementSets
			(RequirementSetId,							RequirementSetType			)
VALUES		('REQSET_JP_ABE_HAPPY',						'REQUIREMENTSET_TEST_ALL'	),
			('REQSET_JP_ABE_UNHAPPY',					'REQUIREMENTSET_TEST_ALL'	);
			
-----------------------------------------------
-- RequirementSetRequirements（合集中的各个事件，事实上控制了哪些条件会引起好感变化。这里没写RequirementType是因为这些RequirementId都是调用的游戏已经写好的，当然你也可以自己写。）
-----------------------------------------------

INSERT INTO RequirementSetRequirements
		(RequirementSetId,			RequirementId						)
VALUES	('REQSET_JP_ABE_UNHAPPY',	'REQUIRES_MAJOR_CIV_OPPONENT'		),
		('REQSET_JP_ABE_UNHAPPY',	'REQUIRES_MET_10_TURNS_AGO'			),
		('REQSET_JP_ABE_UNHAPPY',	'REQUIRES_HAS_LOW_POPULATION'		), --金币
		('REQSET_JP_ABE_UNHAPPY',	'REQUIRES_HAS_LOW_STANDING_ARMY'	),
		('REQSET_JP_ABE_HAPPY',		'REQUIRES_MAJOR_CIV_OPPONENT'		),
		('REQSET_JP_ABE_HAPPY',		'REQUIRES_MET_10_TURNS_AGO'			),
		('REQSET_JP_ABE_HAPPY',		'REQUIRES_HAS_HIGH_POPULATION'	    ),
		('REQSET_JP_ABE_HAPPY',		'REQUIRES_HAS_HIGH_STANDING_ARMY'	);

INSERT INTO AgendaPreferredLeaders
			(AgendaType,					LeaderType,						PercentageChance)
VALUES		('AGENDA_CIVILIZED',			'LEADER_JP_ABE',				20				);