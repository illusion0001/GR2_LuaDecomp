import("math")
dofile("/Game/UXpdemo/pdemo_ux_common.lua")
effect_table = {
  [0] = {
    "tgs001_c01_eff",
    "tgs001_bg_anim"
  }
}
bg_table = {}
puppet_table = {}
puppetobj_table = {}
function main()
  local L0_0
  L0_0 = print
  L0_0("main start---------------------------")
  L0_0 = createGameObject2
  L0_0 = L0_0("PolyDemo")
  loadFileAsset("evd", "/pdemo/tgs001"):wait()
  polydemo_init_args = loadFileAsset("evd", "/pdemo/tgs001"):getRoot().pdemo
  L0_0:setDescription(loadFileAsset("evd", "/pdemo/tgs001"):getRoot())
  for _FORV_5_, _FORV_6_ in ipairs(bg_table) do
    bgobj_table[_FORV_6_.bgname] = createGameObject2("TerrainBg")
    bgobj_table[_FORV_6_.bgname]:loadModel(_FORV_6_.name)
    bgobj_table[_FORV_6_.bgname]:setName(_FORV_6_.bgname)
    bgobj_table[_FORV_6_.bgname]:setPos(_FORV_6_.pos)
    bgobj_table[_FORV_6_.bgname]:setRot(XYZRotQuaternionEular(0, _FORV_6_.rot, 0))
    while bgobj_table[_FORV_6_.bgname]:isLoading() do
      wait()
    end
  end
  initializeAllCutEffects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  for _FORV_5_, _FORV_6_ in ipairs(bg_table) do
    notswing_table = {}
    for _FORV_11_ = 1, #notswing_table do
    end
    if true == false then
      moveobj_swing(bgobj_table[_FORV_6_.bgname], 2, 0.03)
    end
    notturn_table = {"sky_ux_01", "sky_ux_02"}
    for _FORV_11_ = 1, #notturn_table do
    end
    if true == false then
      moveobj_turn(bgobj_table[_FORV_6_.bgname])
    end
  end
  invokeTask(function()
    local L1_1
    while true do
      L1_1 = 0
      while L0_0:isSetupDelay() do
        wait()
      end
      sceneParam_anim = {
        {
          0,
          0,
          199,
          0.1
        },
        {
          0,
          200,
          0.6
        }
      }
      wait(5)
      L0_0:play()
      while not L0_0:isDemoEnd() do
        L1_1 = L1_1 + 1
        playCutEffects(L0_0:getCurrentCutIndex())
        Debug:screenPrint(0, 500, {
          "CUT " .. L0_0:getCurrentCutIndex(),
          "Frame " .. L0_0:getCurrentCutFrame()
        })
        wait()
      end
      L0_0:stop()
      L0_0:reset()
      resetCutEffects()
    end
  end)
  while true do
    wait()
  end
end
