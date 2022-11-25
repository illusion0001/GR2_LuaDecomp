dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  Fn_setCageMoveSkip(true)
  Fn_setCraneOperationFunc()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm28_00200k")
  Fn_userCtrlOn()
  Fn_cageMove(true)
  HUD:menuSetCallback(HUD.kCallback_Retire, mission_retire)
  if Fn_waitGravityStormInOrCageMoveSkip() == 1 then
    Fn_setKeepPlayerPos()
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_2, L1_3
end
