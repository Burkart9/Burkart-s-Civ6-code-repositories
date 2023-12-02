-- UTILITY FUNCTIONS --
function GetPlayersWithTrait(sTrait)
	local tValid = {}
	tValid.numValid = 0

	for k, v in pairs(PlayerManager.GetWasEverAliveIDs()) do
		local leaderType = PlayerConfigurations[v]:GetLeaderTypeName()
		for trait in GameInfo.LeaderTraits() do
			if trait.LeaderType == leaderType and trait.TraitType == sTrait then 
				tValid[v] = true
				tValid.numValid = tValid.numValid + 1
			end
		end
		if not tValid[v] then
			local civType = PlayerConfigurations[v]:GetCivilizationTypeName()
			for trait in GameInfo.CivilizationTraits() do
				if trait.CivilizationType == civType and trait.TraitType == sTrait then 
					tValid[v] = true
					tValid.numValid = tValid.numValid + 1
				end
			end
		end
	end
	return tValid
end
-- TRAIT CHECK --
local cSagaTrait = "TRAIT_LEADER_CN_CAO_CAO_UA"
local tSagaPlayers = GetPlayersWithTrait(cSagaTrait)
if tSagaPlayers.numValid < 1 then print("No correct players active: aborting"); return end
-- CORE FUNCTIONS --
-- ChangePointsTotal
local admiral = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_WRITER']
function iGreatAdmiral(iPlayer)
	if not tSagaPlayers[iPlayer] then return end
	local pPlayer = Players[iPlayer]
	iPoint = 10 * GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier / 100
	pPlayer:GetGreatPeoplePoints():ChangePointsTotal(admiral.Index,iPoint)
end
Events.CivicBoostTriggered.Add(iGreatAdmiral)
Events.TechBoostTriggered.Add(iGreatAdmiral)