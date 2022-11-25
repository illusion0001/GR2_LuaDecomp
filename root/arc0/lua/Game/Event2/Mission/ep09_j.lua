dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep09_common.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Mars, true)
end
function Ingame()
  local L0_0, L1_1
  L0_0 = Fn_sendRequestResetGachaTable
  L0_0()
  L0_0 = {L1_1}
  L1_1 = Player
  L1_1 = L1_1.kAbility_RocketJump
  L1_1 = {}
  L1_1.rocket_jump_interlock = false
  Fn_lockPlayerAbility(L0_0, L1_1)
  Fn_setCatWarpCheckPoint("locator2_restart_pos_ep09_j")
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_missionView("ep09_10001")
  waitSeconds(1.3)
  Fn_naviSet(findGameObject2("Node", "locator2_litho_01"))
  waitSeconds(2.5)
  Fn_captionView("ep09_10000")
  waitPhase()
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
