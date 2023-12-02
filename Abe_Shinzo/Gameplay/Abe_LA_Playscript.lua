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
local cSagaTrait = "TRAIT_LEADER_JP_ABE_UA"
local tSagaPlayers = GetPlayersWithTrait(cSagaTrait)
if tSagaPlayers.numValid < 1 then print("No correct players active: aborting"); return end

-- CORE FUNCTIONS --

-- ChangePointsTotal
local merchantabe = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_WRITER'] --大商人
function iAbeMerchant(iPlayer)
	if not tSagaPlayers[iPlayer] then return end
	local pPlayer = Players[iPlayer]
	iPoint = 10 * GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier / 100
	pPlayer:GetGreatPeoplePoints():ChangePointsTotal(merchantabe.Index,iPoint)
end
Events.CivicBoostTriggered.Add(iAbeMerchant)
Events.TechBoostTriggered.Add(iAbeMerchant)