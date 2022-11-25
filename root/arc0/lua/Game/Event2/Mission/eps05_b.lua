dofile("/Game/Event2/Common/EventCommon.lua")
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "eps05_cid01",
      type = "cid01",
      node = "locator2_cid01"
    }
  }
  Fn_setupNpc(L0_0)
end
function Ingame()
  local L0_1
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_captionViewWait
  L0_1("ep05_00000")
  L0_1 = Fn_captionView
  L0_1("ep05_00001")
  L0_1 = Sound
  L0_1 = L0_1.playSE
  L0_1(L0_1, "syd010", 1, "", Fn_findNpcPuppet("eps05_cid01"))
  L0_1 = waitSeconds
  L0_1(1)
  L0_1 = findGameObject2
  L0_1 = L0_1("Node", "locator2_cid01")
  Camera:lookTo(L0_1:getWorldPos(), 2, 2)
  Fn_playerTurn(L0_1)
  waitSeconds(2)
  Fn_kaiwaDemoView("eps05_00110k")
  HUD:info("eps05_info_01", false)
  Fn_playerTurnEnd()
  Fn_userCtrlOn()
  waitSeconds(0.5)
  Fn_captionViewWait("ep05_00003")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
