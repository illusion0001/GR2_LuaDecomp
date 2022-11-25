import("math")
dofile("/Game/UXpdemo/pdemo_ux_common.lua")
effect_table = {
  [0] = "ux004_c01_eff"
}
bg_table = {
  {
    bgname = "building_md_01_01",
    name = "building_md_01",
    pos = Vector(62.75, -0.158, 59.127),
    rot = 104.028
  },
  {
    bgname = "building_md_01_02",
    name = "building_md_01",
    pos = Vector(27.121, -0.158, -72.603),
    rot = 45
  },
  {
    bgname = "building_md_01_03",
    name = "building_md_01",
    pos = Vector(71.798, 35.303, 142.365),
    rot = -6
  },
  {
    bgname = "building_md_01_04",
    name = "building_md_01",
    pos = Vector(-43.75, -130.375, 39.25),
    rot = 180
  },
  {
    bgname = "building_md_01_05",
    name = "building_md_01",
    pos = Vector(-117.47, -38.6, 39.723),
    rot = 173.888
  },
  {
    bgname = "building_md_02_01",
    name = "building_md_02",
    pos = Vector(-90.604, -23.998, -21.422),
    rot = -44.608
  },
  {
    bgname = "building_md_02_02",
    name = "building_md_02",
    pos = Vector(121.823, 20.555, 6.725),
    rot = 225.225
  },
  {
    bgname = "building_md_02_03",
    name = "building_md_02",
    pos = Vector(-43.125, 37.551, -385.087),
    rot = 225.225
  },
  {
    bgname = "building_md_02_04",
    name = "building_md_02",
    pos = Vector(43.201, -137.375, 42.727),
    rot = 225.225
  },
  {
    bgname = "building_md_02_05",
    name = "building_md_02",
    pos = Vector(-17.822, -3.072, 58.723),
    rot = 444.678
  },
  {
    bgname = "building_md_03_01",
    name = "building_md_03",
    pos = Vector(0, 0, 0),
    rot = 0
  },
  {
    bgname = "building_md_03_02",
    name = "building_md_03",
    pos = Vector(64.03, 60, -69.357),
    rot = 189.556
  },
  {
    bgname = "building_md_04_01",
    name = "building_md_04",
    pos = Vector(-17.75, -130.701, 60.5),
    rot = -45
  },
  {
    bgname = "building_md_04_02",
    name = "building_md_04",
    pos = Vector(112.055, 30.52, -302.545),
    rot = -45
  },
  {
    bgname = "building_md_04_03",
    name = "building_md_04",
    pos = Vector(-99.655, -93.085, 80.267),
    rot = -35.591
  },
  {
    bgname = "building_md_05_01",
    name = "building_md_05",
    pos = Vector(-17.5, -102.658, 219.142),
    rot = -45
  },
  {
    bgname = "building_md_05_02",
    name = "building_md_05",
    pos = Vector(-40.735, -50.175, -433.05),
    rot = -45
  },
  {
    bgname = "building_md_05_03",
    name = "building_md_05",
    pos = Vector(-116.485, -114.9, 185.005),
    rot = -45
  },
  {
    bgname = "building_md_05_04",
    name = "building_md_05",
    pos = Vector(41.87, -126.875, 129.375),
    rot = -45
  },
  {
    bgname = "building_md_06_01",
    name = "building_md_06",
    pos = Vector(-44, -18.5, 123.75),
    rot = 45
  },
  {
    bgname = "building_md_06_02",
    name = "building_md_06",
    pos = Vector(-61.624, -36.246, -391.821),
    rot = 45
  },
  {
    bgname = "building_md_06_03",
    name = "building_md_06",
    pos = Vector(-152.77, -152.173, 226.21),
    rot = 234
  },
  {
    bgname = "building_md_06_04",
    name = "building_md_06",
    pos = Vector(-77.125, -140.875, 42.625),
    rot = 180
  },
  {
    bgname = "building_md_07_01",
    name = "building_md_07",
    pos = Vector(68.438, -91.342, 236.885),
    rot = 156
  },
  {
    bgname = "building_md_07_02",
    name = "building_md_07",
    pos = Vector(4.515, 0.309, -400.875),
    rot = 45
  },
  {
    bgname = "building_md_07_03",
    name = "building_md_07",
    pos = Vector(33.295, -63.575, 191.085),
    rot = 45
  },
  {
    bgname = "building_md_07_04",
    name = "building_md_07",
    pos = Vector(-48.125, -146.179, 92.873),
    rot = -95.273
  },
  {
    bgname = "building_md_07_05",
    name = "building_md_07",
    pos = Vector(-312.453, -165.605, 261.48),
    rot = -95.273
  },
  {
    bgname = "building_md_08_01",
    name = "building_md_08",
    pos = Vector(-1, -80, -15.75),
    rot = 45
  },
  {
    bgname = "building_md_08_02",
    name = "building_md_08",
    pos = Vector(-25.545, -13.482, -305.965),
    rot = 240
  },
  {
    bgname = "building_md_08_03",
    name = "building_md_08",
    pos = Vector(-91.424, 19.15, -460.349),
    rot = 132
  },
  {
    bgname = "building_md_08_04",
    name = "building_md_08",
    pos = Vector(-44.5, -149.75, 14.375),
    rot = 135
  },
  {
    bgname = "building_md_08_05",
    name = "building_md_08",
    pos = Vector(-180.33, -152.263, 181.161),
    rot = 67.633
  },
  {
    bgname = "building_md_08_06",
    name = "building_md_08",
    pos = Vector(46.659, -220.864, 181.161),
    rot = 186.894
  },
  {
    bgname = "building_md_08_07",
    name = "building_md_08",
    pos = Vector(66.442, -220.864, 541.94),
    rot = 241.732
  },
  {
    bgname = "building_pd_01_01",
    name = "building_pd_01",
    pos = Vector(33, 2.134, 56.75),
    rot = 168
  },
  {
    bgname = "building_pd_01_02",
    name = "building_pd_01",
    pos = Vector(-73.118, 3.521, 49.72),
    rot = 240
  },
  {
    bgname = "building_pd_01_03",
    name = "building_pd_01",
    pos = Vector(19.875, -112.578, 60.875),
    rot = 438.484
  },
  {
    bgname = "building_pd_01_04",
    name = "building_pd_01",
    pos = Vector(91.733, 164.709, -217.954),
    rot = 336.835
  },
  {
    bgname = "building_pd_02_01",
    name = "building_pd_02",
    pos = Vector(9.556, 17.781, -205.185),
    rot = -52.11
  },
  {
    bgname = "building_pd_02_02",
    name = "building_pd_02",
    pos = Vector(18.81, 5.585, 76.72),
    rot = 90
  },
  {
    bgname = "building_pd_02_03",
    name = "building_pd_02",
    pos = Vector(124.907, 71.814, -109.806),
    rot = -90
  },
  {
    bgname = "building_pd_03_01",
    name = "building_pd_03",
    pos = Vector(-79.272, 40.912, -209.75),
    rot = 249.447
  },
  {
    bgname = "building_pd_03_02",
    name = "building_pd_03",
    pos = Vector(-98.355, -37.65, 313.94),
    rot = 249.447
  },
  {
    bgname = "building_pd_03_03",
    name = "building_pd_03",
    pos = Vector(-78.375, -119.481, -38.796),
    rot = 372.669
  },
  {
    bgname = "sky_ux_01",
    name = "sky_ux_01",
    pos = Vector(0, 0, 0),
    rot = 0
  },
  {
    bgname = "sky_ux_02",
    name = "sky_ux_02",
    pos = Vector(0, 0, 0),
    rot = 0
  }
}
bgobj_table = {}
function main()
  local L0_0
  L0_0 = print
  L0_0("main start---------------------------")
  L0_0 = createGameObject2
  L0_0 = L0_0("PolyDemo")
  loadFileAsset("evd", "/pdemo/ux004"):wait()
  polydemo_init_args = loadFileAsset("evd", "/pdemo/ux004"):getRoot().pdemo
  L0_0:setDescription(loadFileAsset("evd", "/pdemo/ux004"):getRoot())
  for _FORV_5_, _FORV_6_ in ipairs(bg_table) do
    bgobj_table[_FORV_6_.bgname] = createGameObject2("TerrainBg")
    bgobj_table[_FORV_6_.bgname]:setModelName(_FORV_6_.name)
    bgobj_table[_FORV_6_.bgname]:setPos(_FORV_6_.pos)
    bgobj_table[_FORV_6_.bgname]:setRot(XYZRotQuaternionEular(0, _FORV_6_.rot, 0))
  end
  initializeAllCutEffects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  for _FORV_5_, _FORV_6_ in ipairs(bg_table) do
    notswing_table = {
      "building_md_03_01",
      "building_pd_01_02",
      "sky_ux_01",
      "sky_ux_02"
    }
    for _FORV_11_ = 1, #notswing_table do
    end
    if true == false then
      moveobj_swing(bgobj_table[_FORV_6_.bgname], 2, 0.03)
    end
    notturn_table = {
      "building_md_03_01",
      "building_pd_01_02",
      "sky_ux_01",
      "sky_ux_02"
    }
    for _FORV_11_ = 1, #notturn_table do
    end
    if true == false then
      moveobj_turn(bgobj_table[_FORV_6_.bgname])
    end
  end
  moveobj_turn(bgobj_table.sky_ux_01, 0.02)
  invokeTask(function()
    local L0_1, L1_2, L2_3
    L0_1, L1_2, L2_3 = nil, nil, nil
    while true do
      if L0_1 ~= nil and L0_1:isRunning() then
        L0_1:abort()
        L0_1 = nil
      end
      if L1_2 ~= nil and L1_2:isRunning() then
        L1_2:abort()
        L1_2 = nil
      end
      if L2_3 ~= nil and L2_3:isRunning() then
        L2_3:abort()
        L2_3 = nil
      end
      bgobj_table.building_pd_01_02:setPos(Vector(-73.118, 3.521, 49.72))
      bgobj_table.building_pd_01_02:setRot(XYZRotQuaternionEular(0, 240, 0))
      L0_1 = moveobj_swing(bgobj_table.building_pd_01_02, 2, 0.03)
      L1_2 = moveobj_turn(bgobj_table.building_pd_01_02, 0.03)
      L0_0:play()
      while not L0_0:isDemoEnd() do
        playCutEffects(L0_0:getCurrentCutIndex())
        if L0_0:getCurrentCutIndex() ~= 0 or L0_0:getCurrentCutFrame() == 90 then
        end
        if L0_0:getCurrentCutIndex() == 0 and L0_0:getCurrentCutFrame() == 330 then
          if L1_2 ~= nil and L1_2:isRunning() then
            L1_2:abort()
            L1_2 = nil
          end
          wait()
          L1_2 = moveobj_turn(bgobj_table.building_pd_01_02, -1)
        end
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
