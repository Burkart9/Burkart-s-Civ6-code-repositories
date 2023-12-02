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
local sSagaTrait = "TRAIT_LEADER_WEI_POETIC_STYLE"
local tSagaPlayers = GetPlayersWithTrait(sSagaTrait)
if tSagaPlayers.numValid < 1 then print("No correct players active: aborting"); return end

-- CORE FUNCTIONS --

-- ChangeGoldBalance
function OnResearchCompleted(iPlayer,iTech)
	if not tSagaPlayers[iPlayer] then return end
    local pPlayer = Players[iPlayer]
	pPlayer:GetTreasury():ChangeGoldBalance(60)
end

-- ChangePlayerEraScore
function iChangeEraScore(iPlayer)
	if not tSagaPlayers[iPlayer] then return end
    local pPlayer = Players[iPlayer]
	if (Game.GetEras ~= nil) then
		Game.GetEras():ChangePlayerEraScore(iPlayer, 2);
	end
end

-- ChangeGovernorPoints不指定次数
function iChangeGovPoints(iPlayer)
	if not tSagaPlayers[iPlayer] then return end
    local pPlayer = Players[iPlayer]
	pPlayer:GetGovernors():ChangeGovernorPoints(1);
end

-- ChangeGovernorPoints指定次数
local nNum = 0
function iChangeGovPoints(iPlayer)
	if not tSagaPlayers[iPlayer] then return end
    local pPlayer = Players[iPlayer]
	if nNum < 2 then
		pPlayer:GetGovernors():ChangeGovernorPoints(1)
		nNum = nNum + 1
	end
end
Events.CivicCompleted.Add(iChangeGovPoints)

-- ChangePointsTotal
local admiral = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_PROPHET']
function iGreatAdmiral(iPlayer)
	if not tSagaPlayers[iPlayer] then return end
	local pPlayer = Players[iPlayer]
	iPoint = 10 * GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier / 100
	pPlayer:GetGreatPeoplePoints():ChangePointsTotal(admiral.Index,iPoint)
end
Events.ResearchCompleted.Add(iGreatAdmiral)

-- ChangeTokensToGive(+1Envoy)
Players[0]:GetInfluence():ChangeTokensToGive(1); 

-- ChangePopulation(是增加10而非改变到10)
pCity:ChangePopulation(10)

-- CreateBuildingMonument: CityBuilt
local bb = GameInfo.Buildings['BUILDING_MONUMENT']
function sCityBuiltMonument(iPlayer, cityID, iX, iY)
	local pPlayer = Players[iPlayer]
	local pCity = CityManager.GetCity(iPlayer, cityID)
	pCity:GetBuildQueue():CreateBuilding(bb.Index)
end
GameEvents.CityBuilt.Add(sCityBuiltMonument)

-- 学院建成时+1总督点
local dd = GameInfo.Districts['DISTRICT_CAMPUS'].Index
function bDistrictConstructed(iPlayer, districtID, iX, iY)
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iX, iY)
	local pDistrict = pPlot:GetDistrictType()
	if pDistrict == dd then
		pPlayer:GetGovernors():ChangeGovernorPoints(1)
	end
end
GameEvents.OnDistrictConstructed.Add(bDistrictConstructed)

-- 建立城市时赠送单位
function bCityBuiltUnit(playerID, cityID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer and pPlayer:IsAlive() and pPlayer:IsMajor() then 
		local pUnit = pPlayer:GetUnits()
		if pUnit then
			pPlayer:GetUnits():Create(GameInfo.Units['UNIT_TRADER'].Index, iX, iY)
			Game.AddWorldViewText(0, "{LOC_ZENGSONG_SHANGREN}", iX, iY)
			print('CityBuiltUnit Worked Correctly.')
		end
	end
end
GameEvents.CityBuilt.Add(bCityBuiltUnit)

-- 建立城市+1商路
function burkart(iPlayer, cityID, iX, iY)
	local pPlayer = Players[iPlayer]
	if pPlayer and pPlayer:IsAlive() and pPlayer:IsMajor() then 
		pPlayer:AttachModifierByID("MODIFIER_H1GBL2KR")
		Game.AddWorldViewText(0, "{LOC_ZENGSONG_SHANGLU}", iX, iY)
		print('CityBuiltTradeRoute was activated correctly.')
	end
end
GameEvents.CityBuilt.Add(burkart)

-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('MODIFIER_H1GBL2KR', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 1, 1, 0, NULL, NULL);

-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('MODIFIER_H1GBL2KR', 'Amount', '1');

-- 获得大商人+1商路
local pmerchant = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_MERCHANT']
function buMerchantRoutes(iPlayer, unitID, GreatPersonClassID, GreatPersonIndividualID)  
	local pPlayer = Players[iPlayer]
	if pmerchant.Index == GreatPersonClassID then
		pPlayer:AttachModifierByID("MODIFIER_H1GBL2KR")
	end
end
Events.UnitGreatPersonCreated.Add(buMerchantRoutes)



print("Solomon LA3 activated!");
function SolomonFindGreatPerson(playerId, unit, class, person)
    print("Great person activated!");
	local Player = Players[playerId];
	local playerConfig = PlayerConfigurations[playerId];

	if Player:IsMajor() and Player:IsAlive() then
		if playerConfig:GetLeaderTypeName() == "LEADER_ENT_SOLOMON" then
		    print("Solomon Great person activated!");
			local pPlayerTechs = Player:GetTechs()
			local iNumTechs = 0
			for row in GameInfo.Technologies() do
				if pPlayerTechs:HasTech(row.Index) then 
					iNumTechs = iNumTechs + 1
				end
			end
			local pPlayerCivics = Player:GetCulture()
			local iNumCivics = 0
			for row in GameInfo.Civics() do
				if pPlayerCivics:HasCivic(row.Index) then 
					iNumCivics = iNumCivics + 1
				end
			end
			local ScienceBoom = 12 * iNumTechs * GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier / 100;
			local CultureBoom = 12 * iNumCivics * GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier / 100;
			Players[playerId]:GetTechs():ChangeCurrentResearchProgress(ScienceBoom);
			Players[playerId]:GetCulture():ChangeCurrentCulturalProgress(CultureBoom);
		end
	end
end
Events.UnitGreatPersonActivated.Add(SolomonFindGreatPerson);

function CombatResult(result)
	for key,value in pairs(result) do
		print(key,':',value)
	end
end	
Events.Combat.Add(CombatResult)

local b = Game.GetRandNum(100)
local rate = 50
print('x:',b)
if b < rate then
	print('triggered')
end


-- 以中国为例，单位攻击时可以随机产生双倍伤害。

-- 暴击概率
local m_CriticalRate = 50;

function onCombat(pCombatResult)
    -- 施暴者信息
    local attacker = pCombatResult[CombatResultParameters.ATTACKER];
    local attInfo = attacker[CombatResultParameters.ID]
    local pPlayerConfig = PlayerConfigurations[attInfo.player]
    
    if (pPlayerConfig == nil)
    or (pPlayerConfig:GetCivilizationTypeName() ~= "CIVILIZATION_CHINA") then
        return
    end
    
    -- 受害者信息
    local defender = pCombatResult[CombatResultParameters.DEFENDER]
    local defInfo = defender[CombatResultParameters.ID]
	
    local bsuiji = Game.GetRandNum(100)
    if  (attInfo.type == ComponentType.UNIT)
    and (defInfo.type == ComponentType.UNIT)
    and (bsuiji < m_CriticalRate) then
        local location = pCombatResult[CombatResultParameters.LOCATION];
        local damage = defender[CombatResultParameters.DAMAGE_TO]        
        --local pAttUnit = UnitManager.GetUnit(attInfo.player, attInfo.id)
        local pDefUnit = UnitManager.GetUnit(defInfo.player, defInfo.id)
        
        pDefUnit:ChangeDamage(damage)
        Game.AddWorldViewText(0, "A Critical Hit!", location.x, location.y)
		print('CT!')
    end
    
end
Events.Combat.Add(onCombat)

-- LuaScript1: table: 000000003A3AB6A0(attacker)
-- LuaScript1: 126272016	:	0
-- LuaScript1: -746205821	:	100
-- LuaScript1: 853003252	:	-1
-- LuaScript1: -958805242	:	27
-- LuaScript1: -1522214634	:	0
-- LuaScript1: 1930175143	:	27
-- LuaScript1: -1263136305	:	0
-- LuaScript1: 236175385	:	-1
-- LuaScript1: 1472654640	:	table: 000000003A3AB740(attInfo)
-- LuaScript1: -1351684353	:	4
-- LuaScript1: -1779249298	:	table: 000000003A3AB7E0
-- LuaScript1: -1306278355	:	20
-- LuaScript1: 1838009406	:	0
-- LuaScript1: 1116922831	:	0

-- LuaScript1: table: 000000003A3AB740(attInfo)
-- LuaScript1: attInfo-	type	:	1
-- LuaScript1: attInfo-	id	:	131073(unitID)
-- LuaScript1: attInfo-	player	:	0(playerID)


--[[建成一座城市后，接下来4回合内首玩家每回合+1000金币。
该函数的实现结果：第一回合建立城市，第2、3、4、5回合各+1000金币。总共实现了4回合。少掉的实际上是第一回合，因为从第二回合才触发第二个函数。
该函数的效果不叠加，同时计时以先进行的为准，比如第1、2回合都建立城市，玩家将会于2、3、4、5回合各+1000金币，第6回合无收入，3、4、5回合也并非+2000金币。]]
local iremainingTurns = 5 --计时变量
function CityAddedToMapCapProduction(playerID, cityID, iX, iY)
	if not tSagaPlayers[playerID] then return end
	local pCity = CityManager.GetCity(playerID, cityID)
	if pCity and pCity:GetOriginalOwner() == playerID then
		local pPlayer = Players[playerID]
		local pCapitalCity = pPlayer:GetCities():GetOriginalCapitalCity()
		if pCapitalCity then
			local property = pPlayer:GetProperty("Timer")  
			print('property:',property)
			if property == nil or property == 0 then  
				--pPlayer:AttachModifierByID("MODIFIER_K5UQPJC6")
				pPlayer:SetProperty("Timer", Game.GetCurrentGameTurn() + iremainingTurns)  --设置计时属性Timer的值
				local itest = pPlayer:GetProperty("Timer") 
				print('new property:',itest)
			end
		end
	end
end

function PlayerTurnStartedi(playerID)
	if not tSagaPlayers[playerID] then return end
	print('PlayerTurnStartedi was activated')
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:IsMajor() then
		local _PlayerStatus = pPlayer:GetProperty("Timer")
		print('_PlayerStatus:',_PlayerStatus)
		if _PlayerStatus ~= nil  and _PlayerStatus ~= 0 then
			if _PlayerStatus == Game.GetCurrentGameTurn() then --当计时属性Timer的值等于当前回合数时
				print('This Turn is:',Game.GetCurrentGameTurn())
				pPlayer:SetProperty("Timer", 0)  --将计时属性的值归零，下回合不再触发此函数，直到再次建立城市在第一个函数中对其赋值。
			else
				pPlayer:GetTreasury():ChangeGoldBalance(1000)
			end
		end
	end
end
GameEvents.CityBuilt.Add(CityAddedToMapCapProduction)
GameEvents.PlayerTurnStarted.Add(PlayerTurnStartedi)


local aPlayers = PlayerManager.GetAlive()
for _, bPlayer in ipairs(aPlayers) do
	if bPlayer:IsBarbarian() then
		local pBarbarian = Players[bPlayer]
	end
end


-- UI环境,从格位坐标获取所属城市ID
function GetPlotCityByLocation(PlayerID:number,iX:number,iY:number)
	local pi = Map.GetPlotIndex(iX,iY)
	local pp = Players[PlayerID]
	local pcities = pp:GetCities()
	for i,pcity in pcities:Members() do
		local pcp = Map.GetCityPlots():GetPurchasedPlots(pcity)
		for _,iPlotIndex in pairs(pcp) do
			if pi == iPlotIndex then
				local owningcid = pcity:GetID()
				print(owningcid)
			end
		end	
	end	
	return owningcid
end


-- GP环境，区域完成时城市人口改变
local iDistrict = GameInfo.Districts['DISTRICT_CITY_CENTER'].Index
local iCanal = GameInfo.Districts['DISTRICT_CANAL'].Index
function CanalBuiltPopLess(playerID,districtID,iX,iY)
	local pCityID = ExposedMembers.BURKARTplotcity.GetPlotCityByLocation(playerID,iX,iY)
	local pCity = CityManager.GetCity(playerID,pCityID)
	if districtID ~= iDistrict and districtID == iCanal then
		pCity:ChangePopulation(10)
	end
end
GameEvents.OnDistrictConstructed.Add(CanalBuiltPopLess)