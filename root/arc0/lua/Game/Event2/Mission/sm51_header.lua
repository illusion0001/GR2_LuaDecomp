dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  Fn_loadEventData("evx/sm51_common", {
    "evarea2_mi_a_09_02"
  }, true)
  findGameObject2("GimmickBg", "bg2_box_01"):setIgnoreGrab(true)
  findGameObject2("GimmickBg", "bg2_box_01"):setMoveThreshold(0)
  findGameObject2("GimmickBg", "bg2_box_01"):setEventListener("judge", judge_callback)
  findGameObject2("GimmickBg", "bg2_box_01"):setEventListener("damage", damage_callback)
  findGameObject2("GimmickBg", "bg2_box_01"):setEventListener("dynamic", function(A0_0)
    A0_0:getDynamicObject():setEventListener("judge", judege_callback)
  end)
  print("box\231\160\180\229\163\138\227\129\167\227\129\141\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171\232\168\173\229\174\154\227\129\151\227\129\159")
end
function Ingame()
  local L0_1, L1_2
end
function Finalize()
  findGameObject2("GimmickBg", "bg2_box_01"):setActive(false)
end
function judge_callback(A0_3, A1_4, A2_5, A3_6)
  print("judge:" .. A1_4 .. "=" .. A2_5)
  if A3_6:getName() ~= nil then
    print("  sender:" .. A3_6:getName())
  else
    print("  sender: not named")
  end
  return 0
end
function damage_callback(A0_7, A1_8)
  print("judge:" .. A1_8)
end
