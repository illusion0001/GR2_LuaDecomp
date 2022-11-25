dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Misc/area_controller.lua")
_area_ctrls = {}
function Initialize()
  GameDatabase:set(ggd.GlobalSystemFlags__Gauge, false)
  _area_ctrls.po_a_13_01 = AreaController.create("po_a_13_01")
  _area_ctrls.po_a_19_02 = AreaController.create("po_a_19_02")
  _area_ctrls.po_a_13_02 = AreaController.create("po_a_13_02")
  _area_ctrls.po_a_10_03 = AreaController.create("po_a_10_03")
  _area_ctrls.po_a_13_01:warp("locator2_1st_po_a_13_01")
  _area_ctrls.po_a_19_02:warp("locator2_2nd_po_a_19_02")
  _area_ctrls.po_a_13_02:warp("locator2_3rd_po_a_13_02")
  _area_ctrls.po_a_10_03:warp("locator2_last_po_a_10_03")
end
function Ingame()
  GameDatabase:set(ggd.GlobalSystemFlags__AreaReset, false)
  Mob:setStateValue(Mob.StateValue.kPlayerGravityCoeff, 0.35)
  while true do
    wait()
  end
end
function Finalize()
  Mob:setStateValue(Mob.StateValue.kPlayerGravityCoeff, 1)
  GameDatabase:set(ggd.GlobalSystemFlags__Gauge, true)
end
