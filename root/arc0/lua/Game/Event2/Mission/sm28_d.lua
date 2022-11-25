import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
puppets = {}
puppet_task = {}
_sm28_area_03 = false
_sm28_area_03_out = false
_sm28_area_03_navi = false
_sm28_area_03_caption = false
_sm28_effect_area = false
_sm28_haze_eff = {}
_sm28_sdemo = nil
_sm28_obj_talk = {
  "sm28_00311k",
  "sm28_00312k",
  "sm28_00313k",
  "sm28_00314k",
  "sm28_00315k",
  "sm28_00316k"
}
_sm28_obj_checked = {}
_sm28_last_obj = nil
enmgen2_effect = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_effect_01",
      name = "effect_01"
    },
    {
      type = "stalker",
      locator = "locator_effect_02",
      name = "effect_02"
    },
    {
      type = "stalker",
      locator = "locator_effect_03",
      name = "effect_03"
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
  end,
  onSpawn = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end
}
function Initialize()
  puppets.man73 = Fn_findNpcPuppet("man73")
  Fn_setNpcActive("man73", false)
  _sm28_sdemo = SDemo.create("sm28_sdemo")
  Fn_findAreaHandle("wa_a_04"):setExpandedAabb(true)
end
function Ingame()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17
  L0_12 = Fn_setCrewActive
  L0_12(L1_13)
  L0_12 = Fn_setMineGravityStorm
  L0_12()
  L0_12 = Fn_warpCageMineArea
  L0_12()
  L0_12 = Fn_missionStart
  L0_12()
  L0_12 = Fn_kaiwaDemoView
  L0_12(L1_13)
  L0_12 = Fn_userCtrlOn
  L0_12()
  L0_12 = findGameObject2
  L0_12 = L0_12(L1_13, L2_14)
  if L1_13 == false then
    if L1_13 == false then
      L1_13(L2_14)
      while true do
        if L1_13 then
          if L1_13 then
            L4_16 = 0.2
            L1_13(L2_14, L3_15, L4_16)
            if L1_13 == 1 then
              L4_16 = "pc1_081"
              L1_13(L2_14, L3_15)
              L1_13(L2_14)
              break
            end
            L4_16 = "kit054b"
            L1_13(L2_14, L3_15)
            L1_13(L2_14)
            break
          end
        end
        L1_13()
        L1_13()
      end
    end
  end
  L1_13()
  L1_13(L2_14)
  L1_13(L2_14)
  while true do
    while true do
      while true do
        while true do
          L4_16 = true
          L5_17 = {}
          L5_17.near = 0
          L5_17.far = 10000
          while true do
            L4_16 = "Node"
            L5_17 = "locator2_camera01_"
            L5_17 = L5_17 .. string.format("%02d", L2_14 + 1)
            if L3_15 ~= nil then
              L4_16 = print
              L5_17 = "target="
              L5_17 = L5_17 .. L3_15:getName()
              L4_16(L5_17)
              L5_17 = L1_13
              L4_16 = L1_13.set
              L4_16(L5_17, L3_15)
            end
          end
          L4_16 = "\227\129\153\227\129\185\227\129\166\227\129\174\227\131\142\227\131\188\227\131\137\230\149\176......"
          L5_17 = L2_14
          L4_16 = L4_16 .. L5_17
          L3_15(L4_16)
          L4_16 = L1_13
          L3_15(L4_16)
          L4_16 = L3_15
          L5_17 = true
          L3_15(L4_16, L5_17)
          L4_16 = invokeTask
          function L5_17()
            print("\227\130\173\227\131\136\227\130\165\227\131\179\232\183\157\233\155\162\227\130\191\227\130\185\227\130\175\228\189\156\227\129\163\227\129\159\239\188\129")
            while true do
              L3_15 = false
              if Fn_getDistanceToPlayer("locator2_camera01_01") > 150 then
                L3_15 = true
              end
              wait()
            end
          end
          L4_16 = L4_16(L5_17)
          while true do
            L5_17 = L1_13.isRunning
            L5_17 = L5_17(L1_13)
            if L5_17 then
              L5_17 = ObjectTalk
              L5_17()
              L5_17 = wait
              L5_17()
            end
          end
          L5_17 = L1_13.getPhotoState
          L5_17 = L5_17(L1_13)
          if L5_17 ~= nil and type(L5_17) == "table" then
            for _FORV_10_, _FORV_11_ in ipairs(L5_17) do
              if _FORV_11_.state ~= kPHOTO_OK then
                ;({suc = 0, fail = 0}).fail = ({suc = 0, fail = 0}).fail + 1
                print("\229\164\177\230\149\151\227\130\171\227\130\166\227\131\179\227\131\136 " .. ({suc = 0, fail = 0}).fail)
              else
                ;({suc = 0, fail = 0}).suc = ({suc = 0, fail = 0}).suc + 1
                print("\230\136\144\229\138\159\227\130\171\227\130\166\227\131\179\227\131\136 " .. ({suc = 0, fail = 0}).suc)
              end
            end
          end
          L1_13:kill()
          print("\227\130\173\227\131\136\227\130\165\227\131\179\232\183\157\233\155\162\227\130\191\227\130\185\227\130\175\229\137\138\233\153\164\227\129\151\227\129\159\239\188\129")
          L4_16:abort()
          L4_16 = nil
          if ({suc = 0, fail = 0}).suc == L2_14 and L3_15 == false then
            Fn_missionViewEnd()
            break
          end
          HUD:enablePhotoMode(false)
          RAC_disablePhotoMode(0.5)
          if ({suc = 0, fail = 0}).suc == 0 and ({suc = 0, fail = 0}).fail == 0 then
            Player:playVoice({"kit_823"})
            Fn_captionViewWait("sm28_03005")
          end
        end
        if L3_15 then
          Fn_captionViewWait("sm28_03033")
        end
      end
      Player:playVoice({"kit_824"})
      Fn_captionViewWait("sm28_03006")
    end
  end
  L1_13(L2_14, L3_15)
  L1_13()
  L1_13()
  L1_13(L2_14)
  L1_13(L2_14, L3_15)
  L1_13(L2_14)
  while true do
    L4_16 = "locator2_effect_"
    L5_17 = string
    L5_17 = L5_17.format
    L5_17 = L5_17("%02d", L1_13)
    L4_16 = L4_16 .. L5_17
    if L2_14 ~= nil then
      L4_16 = RAC_createEffect
      L5_17 = {}
      L5_17.eff_name = "ef_ev_smk_bk"
      L5_17.parent_hdl = L2_14
      L5_17.loop = true
      L4_16 = L4_16(L5_17)
      L3_15[L1_13] = L4_16
    end
  end
  L4_16 = "locator2_effect_navi"
  L4_16 = 0.1
  L2_14(L3_15)
  while true do
    if L2_14 then
      if L1_13 ~= nil then
        if not L2_14 then
          L2_14(L3_15)
          L2_14(L3_15)
        end
      end
      L2_14()
    end
  end
  L1_13(L2_14)
  L4_16 = "locator2_effect_navi"
  L5_17 = L2_14(L3_15, L4_16)
  L1_13(L2_14, L3_15, L4_16, L5_17, L2_14(L3_15, L4_16))
  L1_13(L2_14, L3_15)
  L1_13()
  L1_13(L2_14)
  L1_13(L2_14)
  L1_13(L2_14)
  L1_13(L2_14)
  while true do
    if L1_13 ~= L2_14 then
      if not L1_13 then
        if L1_13 then
          _sm28_area_03_caption = true
        end
      end
      L4_16 = false
      L5_17 = true
      L1_13(L2_14)
      L1_13()
    end
  end
  L1_13()
  if not L1_13 then
    L1_13(L2_14)
  else
    L1_13(L2_14)
  end
  L1_13(L2_14, L3_15)
  L1_13()
  L1_13(L2_14)
  L2_14(L3_15)
  L4_16 = false
  L2_14(L3_15, L4_16)
  L4_16 = true
  L2_14(L3_15, L4_16)
  L4_16 = "pccubesensor2_battle_near"
  L5_17 = "pccubesensor2_battle_middle"
  L2_14(L3_15, L4_16, L5_17, "pccubesensor2_battle_long", "locator2_battle_center", "locator2_battle_center", "locator2_battle_center", "sm28_03013")
  L2_14(L3_15)
  L4_16 = "Puppet"
  L5_17 = "effect_01"
  L4_16 = 0
  L5_17 = 0.2
  L2_14(L3_15, L4_16, L5_17)
  L4_16 = nil
  L5_17 = "sm28_03015"
  L2_14(L3_15, L4_16, L5_17, 3, nil, 0, "kit020c")
  while true do
    if L2_14 ~= 0 then
      L2_14()
    end
  end
  L2_14()
  L2_14()
  while true do
    if L1_13 then
      L1_13()
    end
  end
  L1_13(L2_14)
  L1_13(L2_14, L3_15)
  L1_13(L2_14, L3_15)
  L1_13()
  L4_16 = 0.1
  L1_13(L2_14, L3_15, L4_16)
  for L4_16, L5_17 in L1_13(L2_14) do
    invokeTask(function()
      _sm28_haze_eff[L4_16].eff_task:setAlpha(false, 3, 10)
      _sm28_haze_eff[L4_16].eff_task:setVisible(false)
    end)
    break
  end
  L1_13(L2_14)
  L1_13(L2_14)
  L1_13()
  L1_13(L2_14, L3_15)
  L1_13(L2_14)
  L1_13(L2_14)
  _sm28_area_03_navi = false
  while true do
    L4_16 = true
    L5_17 = {}
    L5_17.near = 0
    L5_17.far = 10000
    while true do
      L4_16 = "Node"
      L5_17 = "locator2_camera03_"
      L5_17 = L5_17 .. string.format("%02d", L2_14 + 1)
      if L3_15 ~= nil then
        L4_16 = print
        L5_17 = "target="
        L5_17 = L5_17 .. L3_15:getName()
        L4_16(L5_17)
        L5_17 = L1_13
        L4_16 = L1_13.set
        L4_16(L5_17, L3_15)
      end
    end
    L4_16 = L1_13
    L3_15(L4_16)
    L4_16 = L3_15
    L5_17 = true
    L3_15(L4_16, L5_17)
    while true do
      L4_16 = L1_13
      if L3_15 then
        if not L3_15 then
          if L3_15 then
            L4_16 = "sm28_03017"
            L3_15(L4_16)
            L4_16 = findGameObject2
            L5_17 = "Node"
            L5_17 = L4_16(L5_17, "locator2_camera03_navi")
            L3_15(L4_16, L5_17, L4_16(L5_17, "locator2_camera03_navi"))
            _sm28_area_03_navi = true
          end
        elseif L3_15 then
          L3_15()
          _sm28_area_03_navi = false
        end
        L4_16 = {
          L5_17,
          false,
          true,
          true,
          true,
          true
        }
        L5_17 = true
        L3_15(L4_16)
        L3_15()
      end
    end
    L4_16 = L1_13
    L4_16 = false
    L5_17 = 0
    if L3_15 ~= nil then
      if type(L3_15) == "number" then
        print("results=" .. L3_15)
        L5_17 = L3_15
      elseif type(L3_15) == "table" then
        L4_16 = true
        for _FORV_9_ = 1, #L3_15 do
          if L3_15[_FORV_9_].state ~= kPHOTO_OK then
            L4_16 = false
            break
          end
        end
      end
    end
    _FOR_(_FOR_)
    if L4_16 then
      Fn_missionViewEnd()
      break
    end
    HUD:enablePhotoMode(false)
    RAC_disablePhotoMode(0.5)
    if L5_17 == kPHOTO_NO_TERGET or L5_17 == kPHOTO_OUT then
      Player:playVoice({"kit_823"})
      Fn_captionViewWait("sm28_03018")
    else
      Player:playVoice({"kit_824"})
      Fn_captionViewWait("sm28_03019")
    end
  end
  L1_13()
  L1_13()
  L1_13(L2_14, L3_15)
  L1_13(L2_14)
  L1_13()
  L1_13()
  L1_13()
  L1_13()
end
function Finalize()
  local L0_18, L1_19
end
function ObjectTalk(A0_20)
  local L1_21
  L1_21 = Fn_sendEventComSb
  L1_21 = L1_21("sm28_checkObjectTalk")
  if L1_21 ~= 0 and (A0_20 == nil or A0_20[L1_21]) and Player:getAction() == Player.kAction_Idle then
    Fn_kaiwaDemoView(_sm28_obj_talk[L1_21])
    Fn_sendEventComSb("sm28_setObjectTalked", L1_21)
  end
end
function pccubesensor2_camera03_OnEnter()
  local L0_22, L1_23
  _sm28_area_03 = true
end
function pccubesensor2_camera03_OnLeave()
  local L0_24, L1_25
  _sm28_area_03 = false
end
function pccubesensor2_camera03_out_OnEnter()
  local L0_26, L1_27
  _sm28_area_03_out = false
end
function pccubesensor2_camera03_out_OnLeave()
  local L0_28, L1_29
  _sm28_area_03_out = true
end
function pccubesensor2_effect_OnEnter()
  local L0_30, L1_31
  _sm28_effect_area = true
end
function pccubesensor2_effect_OnLeave()
  local L0_32, L1_33
  _sm28_effect_area = false
end
