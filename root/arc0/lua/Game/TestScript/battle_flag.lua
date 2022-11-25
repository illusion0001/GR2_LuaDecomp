import("Font")
import("Player")
import("Camera")
import("Debug")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Misc/sdemo.lua")
dofile("/Game/Event2/Common/GemCommon.lua")
flag_tbl = {
  [1] = {
    locator2_Flag_1_01 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_02 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_03 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_04 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_05 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_06 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_07 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_08 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_09 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_10 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_11 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_12 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_13 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_14 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_15 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_16 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    }
  },
  [2] = {
    locator2_Flag_1_02 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_04 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_06 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_08 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_10 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_12 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_14 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_16 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_01 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_02 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_03 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_04 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_05 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_06 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_01 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_02 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_03 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_04 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_05 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_06 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    }
  },
  [3] = {
    locator2_Flag_1_01 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_03 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_05 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_07 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_09 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_11 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_13 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_1_15 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_01 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_02 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_03 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_04 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_05 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_2_06 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_01 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_02 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_03 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_04 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_05 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    },
    locator2_Flag_3_06 = {
      flag_state = 0,
      target = 0,
      owner = nil,
      mnavi = nil,
      gem = nil,
      score = 100,
      hdl = {}
    }
  }
}
route_link_state_table = {
  {name = "a1", state = true},
  {name = "a2", state = true},
  {name = "a3", state = false}
}
phi_table = {
  {
    name = "npc_phi",
    type = "phi01",
    node = "locator2_npc_start_pos"
  }
}
MAX_FLAG = 11
PHASE = 1
MAX_PHASE = 3
score = {}
flag = {}
timer = {}
comment = {}
puppet_phi = nil
phi_spd = 0
roop_cnt = 0
pc_win = 0
pc_lose = 0
ScoreClass = {}
function ScoreClass.new()
  local L0_0, L1_1
  L0_0 = {}
  L1_1 = {
    1000,
    1000,
    1000,
    1000,
    1000
  }
  L0_0.max = L1_1
  L1_1 = L0_0.max
  L1_1 = L1_1[1]
  L1_1 = L1_1 / 2
  L0_0.pc = L1_1
  L1_1 = L0_0.max
  L1_1 = L1_1[1]
  L1_1 = L1_1 / 2
  L0_0.npc = L1_1
  L0_0.visible = true
  L0_0.ex = 1
  function L1_1(A0_2)
    local L1_3
    L1_3 = L0_0.max
    L1_3 = L1_3[A0_2]
    L1_3 = L1_3 / 2
    L0_0.pc = L1_3
    L1_3 = L0_0.max
    L1_3 = L1_3[A0_2]
    L1_3 = L1_3 / 2
    L0_0.npc = L1_3
  end
  L0_0.reset = L1_1
  function L1_1()
    while true do
      if L0_0.visible == true then
        Font:testPrint(700, 100, "\227\130\173\227\131\136\227\130\165\227\131\179\239\188\154" .. string.format("%02d", score.pc) .. " / " .. string.format("%02d", score.npc) .. "\239\188\154\227\131\149\227\130\163\227\131\188")
      end
      wait()
    end
  end
  L0_0.view = L1_1
  function L1_1()
    local L0_4, L1_5
    L0_0.visible = false
  end
  L0_0.off = L1_1
  function L1_1()
    local L0_6, L1_7
    L0_0.visible = true
  end
  L0_0.on = L1_1
  function L1_1(A0_8)
    local L1_9, L2_10
    L1_9 = L0_0.pc
    L2_10 = L0_0.ex
    L2_10 = A0_8 * L2_10
    L1_9 = L1_9 + L2_10
    L0_0.pc = L1_9
    L1_9 = L0_0.pc
    L2_10 = L0_0.max
    L2_10 = L2_10[PHASE]
    if L1_9 > L2_10 then
      L1_9 = L0_0.max
      L2_10 = PHASE
      L1_9 = L1_9[L2_10]
      L0_0.pc = L1_9
    end
    L1_9 = L0_0.pc
    if L1_9 < 0 then
      L0_0.pc = 0
    end
  end
  L0_0.updatepc = L1_1
  function L1_1(A0_11)
    local L1_12, L2_13
    L1_12 = L0_0.npc
    L2_13 = L0_0.ex
    L2_13 = A0_11 * L2_13
    L1_12 = L1_12 + L2_13
    L0_0.npc = L1_12
    L1_12 = L0_0.npc
    L2_13 = L0_0.max
    L2_13 = L2_13[PHASE]
    if L1_12 > L2_13 then
      L1_12 = L0_0.max
      L2_13 = PHASE
      L1_12 = L1_12[L2_13]
      L0_0.npc = L1_12
    end
    L1_12 = L0_0.npc
    if L1_12 < 0 then
      L0_0.npc = 0
    end
  end
  L0_0.updatenpc = L1_1
  function L1_1(A0_14)
    local L1_15, L2_16
    L1_15 = L0_0.max
    L1_15 = L1_15[A0_14]
    L2_16 = L0_0.pc
    if not (L1_15 <= L2_16) then
      L1_15 = L0_0.max
      L1_15 = L1_15[A0_14]
      L2_16 = L0_0.npc
    else
      if L1_15 <= L2_16 then
        L1_15 = false
        return L1_15
    end
    else
      L1_15 = true
      return L1_15
    end
  end
  L0_0.check = L1_1
  return L0_0
end
FlagClass = {}
function FlagClass.new()
  local L0_17, L1_18
  L0_17 = {}
  L0_17.cnt = 0
  L0_17.max = 0
  L0_17.create = 0
  L0_17.visible = true
  L0_17.counter = false
  function L1_18()
    local L0_19, L1_20
    L0_17.counter = false
  end
  L0_17.stop = L1_18
  function L1_18()
    local L0_21, L1_22
    L0_17.counter = true
  end
  L0_17.start = L1_18
  function L1_18()
    while true do
      if L0_17.visible == true then
        Font:asciiPrint(810, 150, "Flag:" .. L0_17.cnt .. " / " .. L0_17.max)
      end
      wait()
    end
  end
  L0_17.view = L1_18
  function L1_18()
    local L0_23, L1_24
    L0_17.visible = false
  end
  L0_17.off = L1_18
  function L1_18()
    local L0_25, L1_26
    L0_17.visible = true
  end
  L0_17.on = L1_18
  function L1_18(A0_27)
    L0_17.cnt = L0_17.cnt + A0_27
  end
  L0_17.update = L1_18
  function L1_18(A0_28)
    local L1_29
    L1_29 = L0_17.cnt
    L1_29 = L1_29 + A0_28
    L0_17.cnt = L1_29
    L1_29 = L0_17.max
    L1_29 = L1_29 + A0_28
    L0_17.max = L1_29
    L1_29 = L0_17.create
    L1_29 = L1_29 + A0_28
    L0_17.create = L1_29
  end
  L0_17.allupdate = L1_18
  function L1_18()
    L0_17.stop()
    L0_17.cnt = 0
    L0_17.max = 0
    L0_17.create = 0
  end
  L0_17.reset = L1_18
  function L1_18()
    local L0_30, L1_31
    L0_30 = L0_17.counter
    if L0_30 == true then
      L0_30 = L0_17.cnt
      if L0_30 > 0 then
        L0_30 = true
        return L0_30
      else
        L0_30 = false
        return L0_30
      end
    else
      L0_30 = true
      return L0_30
    end
  end
  L0_17.check = L1_18
  return L0_17
end
TimerClass = {}
function TimerClass.new()
  local L0_32, L1_33
  L0_32 = {}
  L0_32.visible = true
  L0_32.counter = false
  L0_32.cnt = 0
  L1_33 = {
    1200,
    1200,
    600,
    600,
    1200
  }
  L0_32.max = L1_33
  function L1_33()
    L0_32.cnt = L0_32.max[PHASE]
  end
  L0_32.reset = L1_33
  function L1_33()
    L0_32.reset()
    while true do
      if L0_32.visible == true then
        Font:asciiPrint(810, 50, "Time:" .. string.format("%02d", L0_32.cnt / 30) .. " / " .. L0_32.max[PHASE] / 30 .. "s")
      end
      wait()
    end
  end
  L0_32.view = L1_33
  function L1_33()
    local L0_34, L1_35
    L0_32.counter = false
  end
  L0_32.stop = L1_33
  function L1_33()
    local L0_36, L1_37
    L0_32.counter = true
  end
  L0_32.start = L1_33
  function L1_33()
    local L0_38, L1_39
    L0_32.visible = false
  end
  L0_32.off = L1_33
  function L1_33()
    local L0_40, L1_41
    L0_32.visible = true
  end
  L0_32.on = L1_33
  function L1_33()
    local L0_42, L1_43
    L0_42 = L0_32.visible
    return L0_42
  end
  L0_32.isActive = L1_33
  function L1_33(A0_44)
    L0_32.cnt = L0_32.cnt + A0_44
  end
  L0_32.update = L1_33
  function L1_33(A0_45)
    if L0_32.counter == true then
      if L0_32.cnt > 0 then
        L0_32.update(-1)
        return true
      else
        return false
      end
    else
      return true
    end
  end
  L0_32.check = L1_33
  return L0_32
end
CommentClass = {}
function CommentClass.new()
  local L0_46, L1_47, L2_48
  L0_46 = {}
  L1_47 = {}
  L2_48 = {"test", "test2"}
  L1_47[1] = L2_48
  L2_48 = {"test", "test2"}
  L1_47[2] = L2_48
  L2_48 = {"test", "test2"}
  L1_47[3] = L2_48
  L0_46.text = L1_47
  L0_46.visible = true
  function L1_47()
    while true do
      if L0_46.visible == true then
        Fn_captionView(L0_46.text[PHASE][1], 0, false)
      end
      wait()
    end
  end
  L0_46.view = L1_47
  function L1_47()
    local L0_49, L1_50
    L0_46.visible = false
  end
  L0_46.off = L1_47
  function L1_47()
    local L0_51, L1_52
    L0_46.visible = true
  end
  L0_46.on = L1_47
  return L0_46
end
function GemGetCallback(A0_53)
  Sound:pulse("stone_get")
end
enmgen2_area_01 = {
  spawnOnStart = true,
  autoPrepare = false,
  spawnSet = {
    {
      type = "fi",
      locator = "locator_01_01",
      name = "fi_00"
    }
  },
  onUpdate = function(A0_54)
    local L1_55
  end,
  onEnter = function(A0_56)
    local L1_57
  end,
  onLeave = function(A0_58)
    local L1_59
  end,
  onObjectDead = function(A0_60, A1_61)
  end,
  onObjectAsh = function(A0_62, A1_63)
    local L3_64
    L3_64 = enmgen2_area_01
    L3_64.enemyDeadNum = enmgen2_area_01.enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function()
    local L0_65, L1_66
    L0_65 = enmgen2_area_01
    L0_65 = L0_65.spawnSet
    L0_65 = #L0_65
    return L0_65
  end,
  getEnemyDeadNum = function()
    local L1_67
    L1_67 = enmgen2_area_01
    L1_67 = L1_67.enemyDeadNum
    return L1_67
  end,
  getEnemyName = function(A0_68)
    local L1_69
    L1_69 = enmgen2_area_01
    L1_69 = L1_69.spawnSet
    L1_69 = L1_69[A0_68]
    L1_69 = L1_69.name
    return L1_69
  end
}
function Initialize()
  Fn_userCtrlAllOff()
  score = ScoreClass.new()
  flag = FlagClass.new()
  timer = TimerClass.new()
  comment = CommentClass.new()
  GlobalGem:SetPreciousGemAddCallback("GemGetCallback")
  Player:setEnergy(Player.kEnergy_Life, Player:getEnergyMax(Player.kEnergy_Life))
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Player:setEnergy(Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  Player:setEnergyInfinite(Player.kEnergy_Gravity, true)
  Player:setEnergyInfinite(Player.kEnergy_Life, true)
  debugTextUnder()
end
function Ingame()
  local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79, L10_80, L11_81, L12_82, L13_83, L14_84, L15_85
  L0_70 = mother2
  L1_71 = L0_70
  L0_70 = L0_70.sendEvent
  L2_72 = "getBackgroundElement2Handle"
  L3_73 = "scree"
  L0_70 = L0_70(L1_71, L2_72, L3_73)
  L2_72 = L0_70
  L1_71 = L0_70.setExpandedAabb
  L3_73 = true
  L1_71(L2_72, L3_73)
  L1_71 = mother2
  L2_72 = L1_71
  L1_71 = L1_71.sendEvent
  L3_73 = "getBackgroundElement2Handle"
  L4_74 = "bungua"
  L1_71 = L1_71(L2_72, L3_73, L4_74)
  L3_73 = L1_71
  L2_72 = L1_71.setExpandedAabb
  L4_74 = true
  L2_72(L3_73, L4_74)
  L2_72 = false
  L3_73 = Fn_setCatWarp
  L4_74 = false
  L3_73(L4_74)
  L3_73 = Fn_setCatWarpCheckPoint
  L4_74 = nil
  L3_73(L4_74)
  L3_73 = mother2
  L4_74 = L3_73
  L3_73 = L3_73.sendEvent
  L5_75 = "getBackgroundElement2Handle"
  L6_76 = "ship"
  L3_73 = L3_73(L4_74, L5_75, L6_76)
  L4_74 = findGameObject2
  L5_75 = "EventData"
  L6_76 = "evarea2_ve_crane_root"
  L4_74 = L4_74(L5_75, L6_76)
  L5_75 = findGameObject2
  L6_76 = "Node"
  L7_77 = "locator2_ship_pos"
  L5_75 = L5_75(L6_76, L7_77)
  L7_77 = L5_75
  L6_76 = L5_75.getWorldPos
  L6_76 = L6_76(L7_77)
  L8_78 = L5_75
  L7_77 = L5_75.getWorldRot
  L7_77 = L7_77(L8_78)
  L9_79 = L3_73
  L8_78 = L3_73.setWorldTransform
  L11_81 = L5_75
  L10_80 = L5_75.getWorldTransform
  L15_85 = L10_80(L11_81)
  L8_78(L9_79, L10_80, L11_81, L12_82, L13_83, L14_84, L15_85, L10_80(L11_81))
  L9_79 = L3_73
  L8_78 = L3_73.setForceMove
  L8_78(L9_79)
  L8_78 = wait
  L8_78()
  L8_78 = invokeTask
  function L9_79()
    timer.view()
  end
  L8_78(L9_79)
  L8_78 = invokeTask
  function L9_79()
    while true do
      if timer.check() then
      else
        delete_flag()
        flag.reset()
        L2_72 = true
        timer.reset()
        setup_flag()
      end
      wait()
    end
  end
  L8_78(L9_79)
  L8_78 = invokeTask
  function L9_79()
    score.view()
  end
  L8_78(L9_79)
  L8_78 = invokeTask
  function L9_79()
    flag.view()
  end
  L8_78(L9_79)
  L8_78 = invokeTask
  function L9_79()
    while true do
      if flag.check() then
      else
        delete_flag()
        flag.reset()
        L2_72 = true
        timer.reset()
        setup_flag()
      end
      wait()
    end
  end
  L8_78(L9_79)
  function L8_78()
    local L0_86, L1_87, L2_88, L3_89
    for L3_89, _FORV_4_ in L0_86(L1_87) do
      if flag_tbl[PHASE][L3_89].mnavi ~= nil then
        mnavi_off(L3_89)
      end
      if flag_tbl[PHASE][L3_89].gem ~= nil then
        delete_gem(L3_89)
      end
      for _FORV_8_, _FORV_9_ in pairs(_FORV_4_.hdl) do
        _FORV_9_:try_term()
      end
      flag_tbl[PHASE][L3_89].hdl = {}
      flag_tbl[PHASE][L3_89].owner = nil
    end
  end
  delete_flag = L8_78
  function L8_78(A0_90)
    local L1_91, L2_92
    L2_92 = A0_90
    L1_91 = A0_90.getParent
    L1_91 = L1_91(L2_92)
    if L1_91 ~= nil then
      L2_92 = PHASE
      if L2_92 <= MAX_PHASE then
        L2_92 = L1_91.getName
        L2_92 = L2_92(L1_91)
        flag_tbl[PHASE][L2_92].flag_state = 0
        invokeTask(function()
          waitSeconds(0.1)
          if flag_tbl[PHASE][L2_92].mnavi ~= nil then
            mnavi_off(L2_92)
          end
          if flag.counter == true and flag.cnt > 0 then
            flag.update(-1)
          end
          if flag_tbl[PHASE][L2_92].owner == nil then
            flag_tbl[PHASE][L2_92].owner = "kitten"
            gauge_extention(flag_tbl[PHASE][L2_92].owner)
            score.updatepc(flag_tbl[PHASE][L2_92].score)
            score.updatenpc(-1 * flag_tbl[PHASE][L2_92].score)
          elseif flag_tbl[PHASE][L2_92].owner == "kitten" then
            gauge_extention(flag_tbl[PHASE][L2_92].owner)
            score.updatepc(flag_tbl[PHASE][L2_92].score)
            score.updatenpc(-1 * flag_tbl[PHASE][L2_92].score)
          else
            gauge_extention(flag_tbl[PHASE][L2_92].owner)
            score.updatepc(-1 * flag_tbl[PHASE][L2_92].score)
            score.updatenpc(flag_tbl[PHASE][L2_92].score)
          end
          if score.check(PHASE) then
          else
          end
        end)
      end
    else
    end
  end
  function L9_79()
    local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102
    L0_93 = {}
    L1_94 = 1
    L2_95 = nil
    L3_96 = 1
    for L7_100, L8_101 in L4_97(L5_98) do
      L0_93[L1_94] = L7_100
      L1_94 = L1_94 + 1
    end
    L0_93 = L4_97
    for L7_100, L8_101 in L4_97(L5_98) do
      L9_102 = findGameObject2
      L9_102 = L9_102("Node", L7_100)
      if L9_102 ~= nil and L2_72 == true then
        if vogo_jamming(L9_102) == nil then
          L9_102 = vogo_jamming(L9_102)
        elseif L2_95 == nil or L2_95 > vogo_jamming(L9_102) then
          L2_95 = vogo_jamming(L9_102)
          L3_96 = L7_100
        end
      end
      if L9_102 ~= nil and 1 > flag_tbl[PHASE][L7_100].flag_state and flag.create < MAX_FLAG then
        flag_tbl[PHASE][L7_100].hdl[1] = create_flag(L9_102, 1)
        flag_tbl[PHASE][L7_100].mnavi = HUD:mnaviNew({
          name = "mnavi_" .. L7_100
        })
        flag_tbl[PHASE][L7_100].gem = create_gem(L9_102)
        flag_tbl[PHASE][L7_100].flag_state = 1
        flag_tbl[PHASE][L7_100].target = 0
        if L2_72 then
          mnavi_on(L7_100)
        end
        flag.allupdate(1)
      else
        flag_tbl[PHASE][L7_100].flag_state = 0
      end
    end
    if L2_95 ~= nil then
      L4_97.target = 1
    end
    roop_cnt = L4_97
    L4_97()
  end
  setup_flag = L9_79
  function L9_79(A0_103, A1_104)
    local L2_105, L3_106
    L3_106 = A0_103
    L2_105 = A0_103.getName
    L2_105 = L2_105(L3_106)
    L3_106 = createGameObject2
    L3_106 = L3_106("GimmickBg")
    if flag_tbl[PHASE][L2_105].score == 100 then
      L3_106:setDrawModelName("barrel_kk_01")
      L3_106:setCollisionName("barrel_kk_01")
      L3_106:setAttributeName("chimny_kk_03")
      L3_106:setFloaterParams()
      L3_106:setIgnoreGrab(true)
    else
      L3_106:setDrawModelName("chimny_kk_03")
      L3_106:setCollisionName("chimny_kk_03")
      L3_106:setAttributeName("chimny_kk_03")
    end
    L3_106:setPos(Vector(0, 0, 0))
    L3_106:setEventListener("broken", L8_78)
    L3_106:try_init()
    L3_106:waitForReady()
    L3_106:try_start()
    L3_106:setVisibleBlockEnable(false)
    L3_106:setCollidableBlockEnable(false)
    L3_106:setLockonPermission(true)
    A0_103:appendChild(L3_106)
    return L3_106
  end
  create_flag = L9_79
  function L9_79(A0_107)
    local L1_108, L2_109, L3_110
    L2_109 = A0_107
    L1_108 = A0_107.getName
    L1_108 = L1_108(L2_109)
    L2_109 = createGameObject2
    L3_110 = "Gem"
    L2_109 = L2_109(L3_110)
    L3_110 = L2_109.setGemModelNo
    L3_110(L2_109, 4)
    L3_110 = A0_107.getWorldPos
    L3_110 = L3_110(A0_107)
    L3_110 = L3_110 + Vector(0, 3, 0)
    L2_109:setWorldPos(L3_110)
    L2_109:setForceMove()
    L2_109:setVisible(true)
    L2_109:try_init()
    L2_109:waitForReadyAsync(function()
      L2_109:try_start()
    end)
    return L2_109
  end
  create_gem = L9_79
  function L9_79(A0_111)
    flag_tbl[PHASE][A0_111].gem:try_term()
    flag_tbl[PHASE][A0_111].gem = nil
  end
  delete_gem = L9_79
  function L9_79(A0_112)
    local L1_113, L2_114, L3_115
    L1_113 = 1
    L2_114 = roop_cnt
    if L2_114 < 5 then
      L2_114 = roop_cnt
      if L2_114 >= 3 then
        L1_113 = 1.5
      end
    end
    L2_114 = roop_cnt
    if L2_114 >= 5 then
      L1_113 = 2
    end
    L2_114 = PHASE
    if L2_114 == 1 then
      if A0_112 == "kitten" then
        L2_114 = score
        L2_114 = L2_114.pc
        L3_115 = score
        L3_115 = L3_115.npc
        if L2_114 > L3_115 then
          L1_113 = L1_113 - 0.5
        end
      elseif A0_112 == "phi" then
        L2_114 = score
        L2_114 = L2_114.pc
        L2_114 = L2_114 * 2
        L3_115 = score
        L3_115 = L3_115.npc
        if L2_114 > L3_115 then
          L1_113 = L1_113 + 0.5
        end
      end
    end
    L2_114 = PHASE
    if L2_114 == 2 then
      L2_114 = pc_win
      L3_115 = pc_lose
      if L2_114 >= L3_115 then
        if A0_112 == "kitten" then
          L2_114 = score
          L2_114 = L2_114.pc
          L3_115 = score
          L3_115 = L3_115.npc
          if L2_114 > L3_115 then
            L1_113 = L1_113 - 0.5
          end
        elseif A0_112 == "phi" then
          L2_114 = score
          L2_114 = L2_114.pc
          L2_114 = L2_114 * 3
          L3_115 = score
          L3_115 = L3_115.npc
          if L2_114 > L3_115 then
            L1_113 = L1_113 + 0.5
          end
        end
      elseif A0_112 == "kitten" then
        L2_114 = score
        L2_114 = L2_114.pc
        L3_115 = score
        L3_115 = L3_115.npc
        L3_115 = L3_115 * 3
        if L2_114 < L3_115 then
          L1_113 = L1_113 + 0.5
        end
      elseif A0_112 == "phi" then
        L2_114 = score
        L2_114 = L2_114.pc
        L3_115 = score
        L3_115 = L3_115.npc
        if L2_114 < L3_115 then
          L1_113 = L1_113 - 0.5
        end
      end
    end
    L2_114 = PHASE
    if L2_114 == 3 then
      L2_114 = pc_win
      L3_115 = pc_lose
      if L2_114 >= L3_115 then
        if A0_112 == "kitten" then
          L2_114 = score
          L2_114 = L2_114.pc
          L3_115 = score
          L3_115 = L3_115.npc
          if L2_114 > L3_115 then
            L1_113 = L1_113 - 0.5
          end
        elseif A0_112 == "phi" then
          L2_114 = score
          L2_114 = L2_114.pc
          L2_114 = L2_114 * 3
          L3_115 = score
          L3_115 = L3_115.npc
          if L2_114 > L3_115 then
            L1_113 = L1_113 + 0.5
          end
        end
      end
    end
    L2_114 = score
    L2_114.ex = L1_113
  end
  gauge_extention = L9_79
  function L9_79(A0_116)
    local L1_117, L2_118
    L1_117 = flag
    L1_117 = L1_117.check
    L1_117 = L1_117()
    if L1_117 then
    else
      A0_116.is_flag_Relocation = true
    end
    L1_117 = flag_tbl
    L2_118 = PHASE
    L1_117 = L1_117[L2_118]
    A0_116.flag_state_tbl = L1_117
    L1_117 = route_link_state_table
    A0_116.route_link_state_tbl = L1_117
    L1_117 = timer
    L1_117 = L1_117.isActive
    L1_117 = L1_117()
    if L1_117 then
      A0_116.fi_ai_pause_flag = false
    else
      A0_116.fi_ai_pause_flag = true
    end
    L1_117 = false
    L2_118 = false
    for _FORV_6_, _FORV_7_ in pairs(A0_116.flag_hit_tbl) do
      L1_117 = true
      L2_118 = _FORV_6_
    end
    if L1_117 == true then
      if flag_tbl[PHASE][L2_118].owner == nil then
        flag_tbl[PHASE][L2_118].owner = "phi"
      end
      L1_117 = false
      L2_118 = false
    end
    return A0_116
  end
  L10_80, L11_81 = nil, nil
  L10_80 = L12_82
  L11_81 = L12_82
  L15_85 = L9_79
  L12_82(L13_83, L14_84, L15_85)
  vogo_jamming = L12_82
  setup_phi = L12_82
  set_navi = L12_82
  mnavi_on = L12_82
  mnavi_off = L12_82
  L12_82()
  L12_82()
  L12_82()
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  for L15_85, _FORV_16_ in L12_82(L13_83) do
    if flag_tbl[PHASE][L15_85].mnavi ~= nil then
      mnavi_on(L15_85)
    end
  end
  while true do
    L12_82()
  end
  L12_82()
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L2_72 = false
  L12_82(L13_83)
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  for L15_85, _FORV_16_ in L12_82(L13_83) do
    if flag_tbl[PHASE][L15_85].mnavi ~= nil then
      mnavi_on(L15_85)
    end
  end
  while true do
    if L12_82 == 2 then
      L12_82()
    end
  end
  L12_82()
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L2_72 = false
  L12_82(L13_83)
  if L12_82 == 0 then
    L12_82(L13_83)
    L15_85 = nil
    L12_82(L13_83, L14_84, L15_85, Font.kLayerFront)
    L12_82()
  end
  L12_82(L13_83)
  L15_85 = 1
  L12_82(L13_83, L14_84, L15_85, "0.0.0.0", 1, "0.0.0.255")
  L12_82()
  while true do
    if L12_82 == "running" then
      L12_82()
    end
  end
  L12_82(L13_83, L14_84)
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  for L15_85, _FORV_16_ in L12_82(L13_83) do
    if flag_tbl[PHASE][L15_85].mnavi ~= nil then
      mnavi_on(L15_85)
    end
  end
  while true do
    if L12_82 == 3 then
      L12_82()
    end
  end
  L12_82()
  if L12_82 > L13_83 then
    pc_win = L12_82
  else
    pc_lose = L12_82
  end
  L12_82()
  L12_82()
  L12_82()
  L12_82()
  L2_72 = false
  L12_82()
  L12_82()
  score_visible = false
  L12_82(L13_83)
  L15_85 = 1
  L12_82(L13_83, L14_84, L15_85, "0.0.0.0", 1, "0.0.0.255")
  L12_82()
  while true do
    if L12_82 == "running" then
      L12_82()
    end
  end
  L12_82(L13_83, L14_84)
  L12_82(L13_83)
  L12_82(L13_83)
  L12_82()
  L12_82()
  L12_82()
end
function phi_dummy_ai(A0_119)
  local L1_120
  L1_120 = A0_119
  invokeTask(function()
    local L0_121, L1_122, L2_123, L3_124, L4_125, L5_126, L6_127, L7_128, L8_129, L9_130, L10_131, L11_132, L12_133, L13_134, L14_135, L15_136, L16_137, L17_138
    L0_121 = 1
    while true do
      L1_122 = A0_119
      L2_123 = L1_120
      if L1_122 == L2_123 then
        L1_122 = {}
        L2_123 = 1
        for L6_127, L7_128 in L3_124(L4_125) do
          L1_122[L2_123] = L6_127
          L2_123 = L2_123 + 1
        end
        L1_122 = L3_124
        for L6_127, L7_128 in L3_124(L4_125) do
          L8_129 = A0_119
          L9_130 = L1_120
          if L8_129 == L9_130 then
            L8_129 = flag_tbl
            L9_130 = L1_120
            L8_129 = L8_129[L9_130]
            L8_129 = L8_129[L7_128]
            L8_129 = L8_129.mnavi
            if L8_129 ~= nil then
              L8_129 = puppet_phi
              L9_130 = L8_129
              L8_129 = L8_129.getWorldTransform
              L9_130 = L8_129(L9_130)
              L10_131 = get_gameobj_node
              L11_132 = L7_128
              L10_131 = L10_131(L11_132)
              L11_132 = puppet_phi
              L12_133 = L11_132
              L11_132 = L11_132.setWorldRot
              L13_134 = XYZRotQuaternionEular
              L14_135 = 0
              L15_136 = Fn_get_distance_angle
              L17_138 = L10_131
              L16_137 = L10_131.getWorldTransform
              L17_138 = L16_137(L17_138)
              L15_136 = L15_136(L16_137, L17_138, L16_137(L17_138))
              L16_137 = 0
              L17_138 = L13_134(L14_135, L15_136, L16_137)
              L11_132(L12_133, L13_134, L14_135, L15_136, L16_137, L17_138, L13_134(L14_135, L15_136, L16_137))
              L11_132 = puppet_phi
              L12_133 = L11_132
              L11_132 = L11_132.playPoseAnimation
              L13_134 = "run"
              L11_132(L12_133, L13_134)
              L12_133 = L10_131
              L11_132 = L10_131.getWorldPos
              L11_132 = L11_132(L12_133)
              L13_134 = L10_131
              L12_133 = L10_131.getWorldRot
              L12_133 = L12_133(L13_134)
              L13_134 = Fn_get_distance
              L14_135 = L8_129
              L15_136 = L11_132
              L13_134 = L13_134(L14_135, L15_136)
              L14_135 = get_ceil
              L15_136 = RandI
              L16_137 = 4
              L17_138 = 7
              L15_136 = L15_136(L16_137, L17_138)
              L16_137 = phi_spd
              L15_136 = L15_136 / L16_137
              L14_135 = L14_135(L15_136)
              L15_136 = L13_134 * L14_135
              L16_137 = get_move_pos
              L17_138 = L8_129
              L16_137 = L16_137(L17_138, L11_132, L15_136)
              L17_138 = get_move_rot
              L17_138 = L17_138(L9_130, L12_133, L15_136)
              while A0_119 == L1_120 and flag_tbl[L1_120][L7_128].owner ~= "kitten" and flag_tbl[L1_120][L7_128].mnavi ~= nil do
                L8_129 = puppet_phi:getWorldPos()
                L9_130 = puppet_phi:getWorldRot()
                if L15_136 < 0 then
                  puppet_phi:setWorldTransform(L11_132, L12_133)
                else
                  puppet_phi:setWorldTransform(L8_129 + L16_137, (Fn_add_rot(L9_130, L17_138.x, L17_138.y, L17_138.z)))
                end
                puppet_phi:setForceMove()
                if not (Fn_get_distance(L8_129, L11_132) <= 2) then
                  if 0 % 30 == 0 then
                    L11_132 = L10_131:getWorldPos()
                    L12_133 = L10_131:getWorldRot()
                    L13_134 = Fn_get_distance(L8_129, L11_132)
                    L15_136 = L13_134 * L14_135
                    L16_137 = get_move_pos(L8_129, L11_132, L15_136)
                    L17_138 = get_move_rot(L9_130, L12_133, L15_136)
                  end
                  wait()
                end
              end
              if flag_tbl[L1_120][L7_128].owner ~= "kitten" then
                if A0_119 == L1_120 and flag_tbl[L1_120][L7_128].owner ~= "kitten" and flag_tbl[L1_120][L7_128].mnavi ~= nil then
                  puppet_phi:playPoseAnimation("attack")
                  waitSeconds(1)
                  if 1 <= #flag_tbl[L1_120][L7_128].hdl then
                    if flag_tbl[L1_120][L7_128].owner == nil then
                      flag_tbl[L1_120][L7_128].owner = "phi"
                    end
                    for _FORV_22_, _FORV_23_ in pairs(flag_tbl[L1_120][L7_128].hdl) do
                      flag_tbl[L1_120][L7_128].hdl[_FORV_22_]:requestBreak(L8_129, 1)
                    end
                  end
                end
              end
            end
          end
        end
        L3_124()
      end
    end
  end)
end
function Finalize()
  puppet_phi = nil
  score = nil
  flag = nil
  timer = nil
  comment = nil
  debugTextUnder(false)
  Player:setEnergyInfinite(Player.kEnergy_Life, false)
end
