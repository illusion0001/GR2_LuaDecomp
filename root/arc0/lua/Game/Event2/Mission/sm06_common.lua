local L1_1
function L0_0(A0_2, A1_3)
  if A0_2:isGrabbed() == false then
    Fn_naviSet(A0_2)
    A1_3:setActive(true)
  end
  while A0_2:isGrabbed() == false do
    wait()
  end
  Fn_naviKill()
  A1_3:setActive(false)
  Fn_captionViewEnd()
  Fn_tutorialCaptionKill()
  _tutorial_flag_first = true
end
grabWait = L0_0
