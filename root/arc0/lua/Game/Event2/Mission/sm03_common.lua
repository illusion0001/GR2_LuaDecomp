local L1_1
function L0_0(A0_2, A1_3, A2_4, A3_5)
  A0_2:setDrawModelName(A2_4)
  A0_2:try_init()
  A0_2:waitForReady()
  A0_2:try_start()
  Fn_attachJoint(A0_2, A1_3, A3_5)
end
holdObject = L0_0
