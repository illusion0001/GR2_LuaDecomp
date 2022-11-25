dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_puppet_crow = nil
_brain_crow = nil
_move_wall_break = false
_move_wall_msg = false
_wall_damage = 0
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0(L1_1)
  L0_0(L1_1)
  repeat
    L0_0()
  until L0_0
  _puppet_crow = L0_0
  _brain_crow = L0_0
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  for L3_3 = 1, 4 do
    Fn_sendEventComSb("requestWarpRubble", string.format("shutter_stopobj_%02d", L3_3))
    repeat
      wait()
    until Fn_sendEventComSb("isRubbleWarpEnd")
  end
  L0_0()
  L0_0()
  L0_0(L1_1)
  _navi_task = L0_0
  while true do
    if L0_0 == false then
      L0_0()
    end
  end
  if L0_0 ~= nil then
    L0_0(L1_1)
  end
  if L0_0 ~= nil then
    L0_0(L1_1)
  end
  if L0_0 ~= nil then
    L0_0(L1_1)
  end
  L0_0()
  L0_0()
  L0_0(L1_1)
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0()
  L0_0()
  L0_0()
end
function pccubesensor2_fall_02_OnEnter()
  _fall02_task = invokeTask(object_fall, "aisle_07_01_01")
end
function pccubesensor2_fall_03_OnEnter()
  _fall03_task = invokeTask(object_fall, "aisle_07_01_02")
end
function pccubesensor2_fall_04_OnEnter()
  _fall04_task = invokeTask(object_fall, "aisle_07_01_03")
end
function object_fall(A0_4)
  local L1_5
  L1_5 = 0
  repeat
    Fn_sendEventComSb("requestObjFall", A0_4, 3, 9, 0, "ORDER")
    waitSeconds(20)
    L1_5 = L1_5 + 1
  until L1_5 < 6
end
function pccubesensor2_move_wall_OnEnter(A0_6)
  Fn_pcSensorOff("pccubesensor2_move_wall")
  invokeTask(function()
    Fn_captionView("ep12_07007")
    movieWallDmg()
  end)
end
function movieWallDmg()
  print("movieWallDmg check start")
  _crow_twingravkick = false
  function judge_callback(A0_7, A1_8, A2_9, A3_10)
    print("judge:" .. A1_8 .. "=" .. A2_9)
    if A3_10:getName() ~= nil then
      print("  sender:" .. A3_10:getName())
    else
      print("  sender: not named")
    end
    if not _move_wall_msg and A1_8 == "hardblow" then
      _wall_damage = _wall_damage + A2_9
      if A2_9 > 110 or _wall_damage > 500 then
        invokeTask(function()
          while Fn_isCaptionView() == true do
            wait()
          end
          Fn_captionViewWait("ep12_07004")
          if Fn_getDistanceToPlayerXZ(_puppet_crow) > 30 then
            Fn_sendEventComSb("requestCrowWarp", "locator2_crow_movie_pos", "air")
          end
          _brain_crow:setAbility(Supporter.Ability.Parallel.Jupiter, true)
          Fn_captionView("ep12_07005")
          waitSeconds(2)
          Fn_tutorialCaption("crow_jup_gravkick")
          _move_wall_msg = true
        end)
      end
      return 0
    elseif _move_wall_msg == true then
      if Player:getAction() == Player.kAction_JuptTwinGravKickFalling then
        if Player:getGravityKickChargeLv() == 100 then
          _move_wall_break = true
          return 2
        else
          invokeTask(function()
            if Fn_isCaptionView("ep12_07006") == false then
              Fn_captionViewWait("ep12_07006")
            end
          end)
          return 0
        end
      else
        invokeTask(function()
          if Fn_isCaptionView("ep12_07008") == false then
            Fn_captionViewWait("ep12_07008")
          end
          return 0
        end)
      end
    end
  end
  findGameObject2("GimmickBg", "bg2_stopobj_a"):setEventListener("judge", judge_callback)
end
function pccubesensor2_dead_and_OnEnter(A0_11, A1_12)
  Fn_pcSensorOff(A0_11)
  Fn_pcSensorOff("pccubesensor2_move_wall")
  invokeTask(function()
    Fn_captionViewWait("ep12_07003")
    Fn_captionViewWait("ep12_07009")
    Fn_pcSensorOn("pccubesensor2_move_wall")
  end)
end
function smokeEffect(A0_13, A1_14)
  local L2_15
  if A0_13 ~= nil then
    L2_15 = createGameObject2
    L2_15 = L2_15("Effect")
    L2_15:setModelName(A1_14)
    L2_15:loadModel(A1_14)
    L2_15:setName("ef" .. A0_13)
    L2_15:setLoop(true)
    L2_15:play()
    L2_15:try_init()
    L2_15:waitForReady()
    L2_15:try_start()
    if findGameObject2("Node", A0_13) ~= nil then
      findGameObject2("Node", A0_13):appendChild(L2_15)
    end
    L2_15:setVisible(false)
    return L2_15
  end
end
function Finalize()
  if _navi_task ~= nil then
    _navi_task:abort()
  end
end
