-- Burkart
-- Agenda of Xiao Yan
INSERT INTO Types
			(Type,								Kind			)
VALUES		('TRAIT_AGENDA_CN_XIAOYAN',			'KIND_TRAIT'	);

INSERT INTO Agendas	
			(AgendaType,						Name,									Description							)
VALUES 		('AGENDA_CN_XIAOYAN',				'LOC_AGENDA_CN_XIAOYAN_NAME',			'LOC_AGENDA_CN_XIAOYAN_DESCRIPTION'	);

INSERT INTO Traits				
			(TraitType,							Name,									Description							)	
VALUES		('TRAIT_AGENDA_CN_XIAOYAN',			'LOC_AGENDA_CN_XIAOYAN_NAME',			'LOC_AGENDA_CN_XIAOYAN_DESCRIPTION'	);

INSERT INTO AgendaTraits
			(AgendaType,						TraitType					)
VALUES 		('AGENDA_CN_XIAOYAN',				'TRAIT_AGENDA_CN_XIAOYAN'	);

INSERT INTO HistoricalAgendas
			(LeaderType,						AgendaType				)
VALUES 		('LEADER_CN_XIAOYAN',				'AGENDA_CN_XIAOYAN'		);

INSERT INTO TraitModifiers
			(TraitType,							ModifierId								)
VALUES		('TRAIT_AGENDA_CN_XIAOYAN',			'MODIFIER_AGENDA_CN_XIAOYAN_UNHAPPY'	),
			('TRAIT_AGENDA_CN_XIAOYAN',			'MODIFIER_AGENDA_CN_XIAOYAN_HAPPY'		);
			
-----------------------------------------------
-- Modifiers 固定写法
-----------------------------------------------
INSERT INTO Modifiers	
			(ModifierId,									ModifierType,									SubjectRequirementSetId			)
VALUES		('MODIFIER_AGENDA_CN_XIAOYAN_UNHAPPY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_CN_XIAOYAN_UNHAPPY'		),
			('MODIFIER_AGENDA_CN_XIAOYAN_HAPPY',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',	'REQSET_CN_XIAOYAN_HAPPY'		);
-- ModifierStrings 固定写法
INSERT INTO ModifierStrings
			(ModifierId,									Context,						Text								)
VALUES		('MODIFIER_AGENDA_CN_XIAOYAN_UNHAPPY',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	),
			('MODIFIER_AGENDA_CN_XIAOYAN_HAPPY',			'Sample',						'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'	);
-- ModifierArguments 好感度的变化与文本
INSERT INTO ModifierArguments
			(ModifierId,									Name,							Value												)
VALUES		('MODIFIER_AGENDA_CN_XIAOYAN_UNHAPPY',			'InitialValue',					-12													),
			('MODIFIER_AGENDA_CN_XIAOYAN_UNHAPPY',			'StatementKey',					'LOC_DIPLO_WARNING_LEADER_CN_XIAOYAN_REASON_ANY'  	),
			('MODIFIER_AGENDA_CN_XIAOYAN_UNHAPPY',			'SimpleModifierDescription',	'LOC_DIPLO_WARNING_EXIT_LEADER_CN_XIAOYAN_ANY'		),
	
			('MODIFIER_AGENDA_CN_XIAOYAN_HAPPY',			'InitialValue',					12													),
			('MODIFIER_AGENDA_CN_XIAOYAN_HAPPY',			'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CN_XIAOYAN_REASON_ANY'	    ),
			('MODIFIER_AGENDA_CN_XIAOYAN_HAPPY',			'SimpleModifierDescription',	'LOC_DIPLO_KUDO_EXIT_LEADER_CN_XIAOYAN_ANY'			);
-- RequirementSets 集合，包含了影响好感度的事件合集
INSERT INTO RequirementSets
			(RequirementSetId,								RequirementSetType			)
VALUES		('REQSET_CN_XIAOYAN_HAPPY',						'REQUIREMENTSET_TEST_ALL'	),
			('REQSET_CN_XIAOYAN_UNHAPPY',					'REQUIREMENTSET_TEST_ALL'	);
			
-----------------------------------------------
-- RequirementSetRequirements（合集中的各个事件，事实上控制了哪些条件会引起好感变化。这里没写RequirementType是因为这些RequirementId都是调用的游戏已经写好的，当然你也可以自己写。）
-----------------------------------------------

INSERT INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId						)
VALUES	('REQSET_CN_XIAOYAN_UNHAPPY',	'REQUIRES_MAJOR_CIV_OPPONENT'		),
		('REQSET_CN_XIAOYAN_UNHAPPY',	'REQUIRES_MET_10_TURNS_AGO'			),
		('REQSET_CN_XIAOYAN_UNHAPPY',	'REQUIRES_HAS_LOW_FAITH'		    ),
		('REQSET_CN_XIAOYAN_UNHAPPY',	'REQUIRES_HAS_LOW_CULTURE'	        ),
		('REQSET_CN_XIAOYAN_HAPPY',		'REQUIRES_MAJOR_CIV_OPPONENT'		),
		('REQSET_CN_XIAOYAN_HAPPY',		'REQUIRES_MET_10_TURNS_AGO'			),
		('REQSET_CN_XIAOYAN_HAPPY',		'REQUIRES_HAS_HIGH_FAITH'	        ),
		('REQSET_CN_XIAOYAN_HAPPY',		'REQUIRES_HAS_HIGH_CULTURE'	        );

INSERT INTO AgendaPreferredLeaders
			(AgendaType,					LeaderType,							PercentageChance)
VALUES		('AGENDA_CIVILIZED',			'LEADER_CN_XIAOYAN',				10				);