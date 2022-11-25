import("GlobalGem")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon.lua")
mine_name = "sm90_mine"
enmgen2_pi_a_01_a = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_pi_a_01_01",
      name = "runner_01_01"
    },
    {
      type = "runner",
      locator = "locator_pi_a_01_02",
      name = "runner_01_02"
    },
    {
      type = "guardcore",
      locator = "locator_pi_a_01_03",
      name = "guardcore_01_01"
    },
    {
      type = "stalker",
      locator = "locator_pi_a_01_04",
      name = "stalker_01_01"
    },
    {
      type = "stalker",
      locator = "locator_pi_a_01_05",
      name = "stalker_01_02"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end
}
enmgen2_pi_a_02_a = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_pi_a_02_01",
      name = "guardcore_02_01"
    },
    {
      type = "guardcore",
      locator = "locator_pi_a_02_02",
      name = "guardcore_02_02"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
  end
}
enmgen2_pi_a_03_a = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_pi_a_03_01",
      name = "stalker_03_01"
    },
    {
      type = "stalker",
      locator = "locator_pi_a_03_02",
      name = "stalker_03_02"
    },
    {
      type = "gellyfish",
      locator = "locator_pi_a_03_03",
      name = "gellyfish_03_01"
    },
    {
      type = "gellyfish",
      locator = "locator_pi_a_03_04",
      name = "gellyfish_03_02"
    },
    {
      type = "gellyfish",
      locator = "locator_pi_a_03_05",
      name = "gellyfish_03_03"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end
}
enmgen2_pi_a_06_a = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_pi_a_06_01",
      name = "stalker_06_01"
    },
    {
      type = "guardcore",
      locator = "locator_pi_a_06_02",
      name = "guardcore_06_01"
    },
    {
      type = "guardcore",
      locator = "locator_pi_a_06_03",
      name = "guardcore_06_02"
    },
    {
      type = "gellyfish",
      locator = "locator_pi_a_06_04",
      name = "gellyfish_06_01"
    },
    {
      type = "gellyfish",
      locator = "locator_pi_a_06_05",
      name = "gellyfish_06_02"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onObjectDead = function(A0_30, A1_31)
  end
}
function Initialize()
  loadFileAsset("evb", "evx/mine01_enmgen"):wait()
  EventData:create("mine01_enmgen", nil, loadFileAsset("evb", "evx/mine01_enmgen"):getRoot())
  mineInitialize()
  HUD:enemymarkerSetRange(50)
  GlobalGem:SetOtherPreciousGemCountEnable(true)
  GlobalGem:SetOtherPreciousGemCountMaxNum(100)
end
function Ingame()
  local L0_32, L1_33
  L0_32 = Fn_craneShipToMine
  L0_32()
  L0_32 = mineIngame
  L0_32()
  L0_32 = Fn_missionStart
  L0_32()
  L0_32 = Fn_isCageMoveFinish
  L0_32()
  L0_32 = HUD
  L1_33 = L0_32
  L0_32 = L0_32.info
  L0_32(L1_33, "sm90_info_01", true, 15)
  L0_32 = wait
  L0_32()
  L0_32 = Fn_userCtrlOn
  L0_32()
  L0_32 = HUD
  L1_33 = L0_32
  L0_32 = L0_32.counter999SetVisible
  L0_32(L1_33, true)
  L0_32 = Fn_missionView
  L1_33 = "sm90_00200"
  L0_32(L1_33)
  L0_32 = 0
  while true do
    L1_33 = getGemCount
    L1_33 = L1_33()
    if L0_32 == 0 then
      if L1_33 >= 30 and Fn_isCaptionView() == false then
        Fn_captionView("sm90_00300")
        L0_32 = 1
      end
    elseif L0_32 == 1 and L1_33 >= 100 and Fn_isCaptionView() == false then
      Fn_captionView("sm90_00400")
      L0_32 = 2
      HUD:counter999SetNum(L1_33)
      break
    end
    HUD:counter999SetNum(L1_33)
    wait()
  end
  L1_33 = waitSeconds
  L1_33(1)
  L1_33 = HUD
  L1_33 = L1_33.counter999SetVisible
  L1_33(L1_33, false)
  L1_33 = findGameObject2
  L1_33 = L1_33("Node", "locator2_pc_goal_pos")
  Fn_naviSet(L1_33)
  Fn_craneShipCageOn()
  Fn_cageMoveEndClear()
  Fn_isCageMoveFinish()
  Fn_setBgmPoint("event", "missionend")
  if invokeTask(function()
    local L0_34, L1_35
    L0_34 = L1_33
    L1_35 = L0_34
    L0_34 = L0_34.getWorldPos
    L0_34 = L0_34(L1_35)
    while true do
      L1_35 = Fn_getPcPosRot
      L1_35 = L1_35()
      if Fn_get_distance(L1_35, L0_34) <= 5 then
        Fn_naviKill()
        break
      end
      wait()
    end
  end) ~= nil and invokeTask(function()
    local L0_36, L1_37
    L0_36 = L1_33
    L1_37 = L0_36
    L0_36 = L0_36.getWorldPos
    L0_36 = L0_36(L1_37)
    while true do
      L1_37 = Fn_getPcPosRot
      L1_37 = L1_37()
      if Fn_get_distance(L1_37, L0_36) <= 5 then
        Fn_naviKill()
        break
      end
      wait()
    end
  end):isRunning() == true then
    invokeTask(function()
      local L0_38, L1_39
      L0_38 = L1_33
      L1_39 = L0_38
      L0_38 = L0_38.getWorldPos
      L0_38 = L0_38(L1_39)
      while true do
        L1_39 = Fn_getPcPosRot
        L1_39 = L1_39()
        if Fn_get_distance(L1_39, L0_38) <= 5 then
          Fn_naviKill()
          break
        end
        wait()
      end
    end):abort()
    Fn_naviKill()
  end
  Fn_exitSandbox()
end
function Finalize()
  HUD:enemymarkerSetRange()
  Fn_setBgmPoint("event", "missionend")
  HUD:counter999SetVisible(false)
  mineFinalize()
end
