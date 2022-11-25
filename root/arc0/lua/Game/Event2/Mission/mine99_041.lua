dofile("/Game/Event2/Mission/mine99_base.lua")
_event_file_name = "floor_041"
_floor_num = 41
function InitializeBody()
  local L0_0, L1_1
end
function IngameBody()
  Fn_missionStart()
  Fn_showMineName()
  Fn_userCtrlOn()
  if Fn_getMine99FloorClear() then
    print("\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153")
  else
    missionTextVisible(true)
    repeat
      wait()
    until isLithographStart()
    setFirstHalfProcessEnd()
    Fn_missionView("ic_pi_monument_obj_00410", 0, nil, true)
    waitSeconds(5)
    waitSeconds(2)
    HUD:counter999SetVisible(false)
    Fn_missionInfoEnd()
    missionComplete()
    repeat
      wait()
    until isSecondHalfProcessWait()
    setSecondHalfProcessEnd()
    Fn_setMine99FloorClear()
  end
  Fn_setGravityGateActive(true)
end
function FinalizeBody()
  HUD:counter999SetVisible(false)
end
