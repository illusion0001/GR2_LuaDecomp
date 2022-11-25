dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_043"
_floor_num = 43
_gen_01 = nil
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "stalker_high_01",
      type = "stalker_high",
      locator = "locator_01"
    },
    {
      name = "stalker_high_02",
      type = "stalker_high",
      locator = "locator_02"
    },
    {
      name = "stalker_high_03",
      type = "stalker_high",
      locator = "locator_03"
    }
  },
  enemyNum = 0,
  onObjectAsh = function(A0_0, A1_1)
    A0_0:getSpecTable().enemyNum = A0_0:getSpecTable().enemyNum - 1
  end,
  onSpawn = function(A0_2, A1_3)
    A0_2:getSpecTable().enemyNum = A0_2:getSpecTable().enemyNum + 1
  end,
  isAllDead = function(A0_4)
    if A0_4.enemyNum == 0 then
      return true
    end
    return false
  end
}
function InitializeBody()
  local L0_5, L1_6
end
function IngameBody()
  local L0_7
  L0_7 = Fn_missionStart
  L0_7()
  L0_7 = Fn_showMineName
  L0_7()
  L0_7 = Fn_userCtrlOn
  L0_7()
  L0_7 = Fn_getMine99FloorClear
  L0_7 = L0_7()
  if L0_7 then
    L0_7 = print
    L0_7("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    L0_7 = missionTextVisible
    L0_7(true)
    repeat
      L0_7 = wait
      L0_7()
      L0_7 = isLithographStart
      L0_7 = L0_7()
    until L0_7
    L0_7 = Fn_whiteout
    L0_7()
    L0_7 = Fn_getCostume
    L0_7 = L0_7()
    print("Fn_getCostume", L0_7)
    setFirstHalfProcessEnd()
    Fn_userCtrlAllOff()
    Fn_missionView("ic_pi_monument_obj_00430", 0, nil, true)
    Fn_setCostume("cro01", false)
    repeat
      wait()
    until Fn_getCostume() == "cro01" and Time:getGameWorldTimeStamp() - Time:getGameWorldTimeStamp() > 30
    playChangeCosEffect()
    Fn_fadein()
    Fn_userCtrlOn()
    _gen_01 = findGameObject2("EnemyGenerator", "enmgen2_01")
    _gen_01:requestSpawn()
    repeat
      wait()
    until isEnemyAllDead()
    HUD:counter999SetVisible(false)
    waitSeconds(2)
    Fn_missionInfoEnd()
    missionComplete()
    repeat
      wait()
    until isSecondHalfProcessWait()
    Fn_setCostume(L0_7, false)
    while Fn_getCostume() ~= L0_7 do
      wait()
    end
    playChangeCosEffect()
    setSecondHalfProcessEnd()
    Fn_setMine99FloorClear()
  end
  L0_7 = Fn_setGravityGateActive
  L0_7(true)
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
function isEnemyAllDead()
  if _gen_01 ~= nil and _gen_01:getEnemyCount() == 0 then
    return true
  end
  return false
end
function playChangeCosEffect()
  invokeTask(function()
    local L0_8, L1_9
    L0_8 = waitSeconds
    L1_9 = 0.7
    L0_8(L1_9)
    L0_8 = Player
    L1_9 = L0_8
    L0_8 = L0_8.getPuppet
    L0_8 = L0_8(L1_9)
    while true do
      L1_9 = L0_8.getVisible
      L1_9 = L1_9(L0_8)
      if not L1_9 then
        L1_9 = L0_8.getActive
        L1_9 = L1_9(L0_8)
      end
      if not L1_9 then
        L1_9 = wait
        L1_9()
      end
    end
    L1_9 = createGameObject2
    L1_9 = L1_9("Effect")
    L1_9:setName("ef_ui_par_01")
    L1_9:setModelName("ef_ui_par_01")
    Player:getPuppet():appendChild(L1_9)
    L1_9:try_init()
    L1_9:waitForReadyAsync(function()
      L1_9:try_start()
      L1_9:play()
      wait()
      while not L1_9:isEnd() do
        wait()
      end
      L1_9:try_term()
    end)
  end)
end
