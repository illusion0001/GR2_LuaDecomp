dofile("/Game/Event2/Common/BgsetCommon.lua")
_evb_list = {
  "city_block_et2_a"
}
_et_day_hdl = nil
_et_ngt_hdl = nil
_palace = nil
function createArea()
  GameDatabase:set(ggd.GlobalSystemFlags__AreaDrift, false)
  _palace = createGameObject2("Area")
  _palace:setName("et2_a_root")
  _palace:setDriftEnable(false)
  setAreaRootHandle("palace", _palace)
  GameDatabase:set(ggd.Menu__MapName, "None")
end
function setAreaDetail()
  _et_day_hdl = findGameObject2("Area", "et2_a_day_root")
  _et_ngt_hdl = findGameObject2("Area", "et2_a_ngt_root")
  _et_ngt_hdl:setEffectiveness(false, true)
  _et_ngt_hdl:setSceneParameters("et2_a_root_night")
  _et_ngt_hdl:setEnableSceneParameters(false)
end
function switchDayAndNight(A0_0)
  if A0_0 then
    _et_day_hdl:setEffectiveness(true, true)
    _et_ngt_hdl:setEffectiveness(false, true)
    _palace:setEnableSceneParameters(true)
    _et_day_hdl:setEnableSceneParameters(true)
    _et_ngt_hdl:setEnableSceneParameters(false)
  else
    _et_day_hdl:setEffectiveness(false, true)
    _et_ngt_hdl:setEffectiveness(true, true)
    _palace:setEnableSceneParameters(false)
    _et_day_hdl:setEnableSceneParameters(false)
    _et_ngt_hdl:setEnableSceneParameters(true)
  end
end
