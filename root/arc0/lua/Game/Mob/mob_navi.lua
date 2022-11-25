import("HUD")
import("GameDatabase")
function debugShowArgs(A0_0)
  local L1_1, L2_2, L3_3, L4_4, L5_5
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    dbg_print(string.format("Mob.navigationCallback args: %q = %q", L4_4, tostring(L5_5)))
  end
end
g_lastReplyId = -1
function default_navigationCallback(A0_6, A1_7)
end
Mob.navigationCallback = nil
