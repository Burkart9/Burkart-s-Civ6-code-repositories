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
local xSagaTrait = "TRAIT_LEADER_CN_XIAOYAN_UA"
local tSagaPlayers = GetPlayersWithTrait(xSagaTrait)
if tSagaPlayers.numValid < 1 then print("No correct players active: aborting"); return end

-- CORE FUNCTIONS --