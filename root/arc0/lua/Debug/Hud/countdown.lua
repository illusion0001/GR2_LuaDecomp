L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = {}
function L0_0.count_down_start()
  HUD:countDownStart(HUD.kCountDownStart_Normal)
end
function L0_0.count_down_action()
  HUD:countDownStart(HUD.kCountDownStart_Action)
end
function L0_0.finish_start()
  HUD:countDownFinishStart()
end
function L0_0.finish_win()
  HUD:countDownFinishStart(HUD.kCountDownFinish_Win)
end
function L0_0.finish_lose()
  HUD:countDownFinishStart(HUD.kCountDownFinish_Lose)
end
function L0_0.finish_drawgame()
  HUD:countDownFinishStart(HUD.kCountDownFinish_Drawgame)
end
function L0_0.finish_order()
  HUD:countDownFinishStart(HUD.kCountDownFinish_Order)
end
function L0_0.courseout_start()
  HUD:courseOutStart()
end
function L0_0.count_down_fade_end()
  HUD:countDownEnd()
end
function L0_0.count_down_cut_end()
  HUD:countDownEnd(true)
end
L0_0.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.count_down_start,
    data_label = "COUNT_DOWN_START"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.count_down_action,
    data_label = "COUNT_DOWN_ACTION"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.finish_start,
    data_label = "FINISH_START"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.finish_win,
    data_label = "FINISH_WIN"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.finish_lose,
    data_label = "FINISH_LOSE"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.finish_drawgame,
    data_label = "FINISH_DRAWGAME"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.finish_order,
    data_label = "FINISH_ORDER"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.courseout_start,
    data_label = "COURSE_OUT_START"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.count_down_fade_end,
    data_label = "COUNT_DOWN_FADE_END"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.count_down_cut_end,
    data_label = "COUNT_DOWN_CUT_END"
  }
}
function L0_0.root.Execute(A0_1, A1_2)
  if A1_2.type == dbgCommon.kTypeFunction then
    dbgCommon.function_execute(A1_2)
  end
end
function test_countdown()
  dbgCommon.TreeExecute(L0_0.root)
end
