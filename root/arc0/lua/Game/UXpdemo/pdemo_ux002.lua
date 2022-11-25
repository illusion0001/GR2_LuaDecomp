import("math")
dofile("/Game/UXpdemo/pdemo_ux_common.lua")
restore_task = nil
function task_restore_bkobj(A0_0)
  A0_0:requestRestore()
  restore_task = nil
end
effect_table = {
  [0] = "ux002_c91_eff",
  [1] = "ux002_c92_eff",
  [2] = "ux002_c93_eff",
  [3] = "ux002_c01_eff"
}
bg_table = {
  {
    bgname = "building_md_01_01",
    name = "building_md_01",
    pos = Vector(112.933, -1.053, 31.837),
    rot = 59.937
  },
  {
    bgname = "building_md_01_02",
    name = "building_md_01",
    pos = Vector(-66.312, -5.05, 3.712),
    rot = 124.775
  },
  {
    bgname = "building_md_02_01",
    name = "building_md_02",
    pos = Vector(67.004, 25.444, -146.896),
    rot = 18.326
  },
  {
    bgname = "building_md_02_02",
    name = "building_md_02",
    pos = Vector(-49.539, -8.893, -52.457),
    rot = 66.371
  },
  {
    bgname = "building_md_03_01",
    name = "building_md_03",
    pos = Vector(85.193, -27.281, -31.396),
    rot = 42.571
  },
  {
    bgname = "building_md_06_01",
    name = "building_md_06",
    pos = Vector(61.55, -2.1, -205.559),
    rot = -88.079
  },
  {
    bgname = "building_pd_01_01",
    name = "building_pd_01",
    pos = Vector(16.023, -23.203, -131.819),
    rot = -64.824
  },
  {
    bgname = "building_pd_02_01",
    name = "building_pd_02",
    pos = Vector(46.074, -29.39, -92.206),
    rot = -108.744
  },
  {
    bgname = "building_pd_02_02",
    name = "building_pd_02",
    pos = Vector(-9.63, -14.286, 20.837),
    rot = 142.663
  },
  {
    bgname = "building_pd_03_01",
    name = "building_pd_03",
    pos = Vector(128.062, -2.1, -90),
    rot = 45
  },
  {
    bgname = "building_md_09_01",
    name = "building_md_09",
    pos = Vector(0, 0, 0),
    rot = 0
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
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = print
  L1_2 = "main start---------------------------"
  L0_1(L1_2)
  L0_1 = createGameObject2
  L1_2 = "PolyDemo"
  L0_1 = L0_1(L1_2)
  L1_2 = loadFileAsset
  L1_2 = L1_2(L2_3, L3_4)
  L2_3(L3_4)
  polydemo_init_args = L2_3
  L2_3(L3_4, L1_2:getRoot())
  for _FORV_5_, _FORV_6_ in L2_3(L3_4) do
    bgobj_table[_FORV_6_.bgname] = createGameObject2("TerrainBg")
    bgobj_table[_FORV_6_.bgname]:setModelName(_FORV_6_.name)
    bgobj_table[_FORV_6_.bgname]:setPos(_FORV_6_.pos)
    bgobj_table[_FORV_6_.bgname]:setRot(XYZRotQuaternionEular(0, _FORV_6_.rot, 0))
  end
  L3_4:setDrawModelName("tower_md_01")
  L3_4:setCollisionName("tower_md_01")
  L3_4:setAttributeName("tower_md_01")
  L3_4:setPos(Vector(24.5, -4.469, -0.375))
  print("init all")
  initializeAllGameObjects()
  print("wait ready all")
  waitForReadyAllGameObjects()
  print("start all")
  startAllGameObjects()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  initializeAllCutEffects()
  for _FORV_7_, _FORV_8_ in ipairs(bg_table) do
    notswing_table = {
      "building_pd_02_02",
      "building_pd_03_03",
      "building_md_09_01",
      "sky_ux_01",
      "sky_ux_02"
    }
    for _FORV_13_ = 1, #notswing_table do
    end
    if true == false then
      moveobj_swing(bgobj_table[_FORV_8_.bgname], 2, 0.03)
    end
  end
  moveobj_turn(bgobj_table.sky_ux_01, 0.01)
  hato01 = hatoSetup()
  hato02 = hatoSetup()
  hato03 = hatoSetup()
  hato07 = hatoSetup()
  hato08 = hatoSetup()
  hato09 = hatoSetup()
  hato10 = hatoSetup()
  hato11 = hatoSetup()
  hato12 = hatoSetup()
  hato13 = hatoSetup()
  hato14 = hatoSetup()
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  invokeTask(function()
    while true do
      if restore_task == nil and L3_4:isBroken() then
        restore_task = invokeTask(task_restore_bkobj, L3_4)
      end
      hatoReset(hato01, Vector(19.79, 7.24, 0.777), XYZRotQuaternionEular(0, -73.04, 0))
      hatoReset(hato02, Vector(19.79, 7.24, 1.877), XYZRotQuaternionEular(0, -73.92, 0))
      hatoReset(hato03, Vector(19.79, 7.24, 2.977), XYZRotQuaternionEular(0, -73.516, 0))
      hatoReset(hato07, Vector(39.60093171, 5.2550074266, 10.27885859), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato08, Vector(39.64739222, 6.478490775, 10.59292291), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato09, Vector(40.53516025, 5.6340839093, 8.74950637), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato10, Vector(38.646, 5.987, 9.568), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato11, Vector(37.4776531, 5.51748914, 9.0389477), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato12, Vector(40.08600738, 5.9874312142, 9.56402761), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato13, Vector(39.39482262, 6.926696513, 8.56841316), XYZRotQuaternionEular(0, 180.171, 0))
      hatoReset(hato14, Vector(38.10104947, 6.478490775, 10.03781024), XYZRotQuaternionEular(0, 180.171, 0))
      hato01:setVisible(false)
      hato02:setVisible(false)
      hato03:setVisible(false)
      hato07:setVisible(false)
      hato08:setVisible(false)
      hato09:setVisible(false)
      hato10:setVisible(false)
      hato11:setVisible(false)
      hato12:setVisible(false)
      hato13:setVisible(false)
      hato14:setVisible(false)
      L0_1:play()
      while not L0_1:isDemoEnd() do
        playCutEffects(L0_1:getCurrentCutIndex())
        if L0_1:getCurrentCutIndex() == 3 then
          invokeTask(function()
            hato01:setVisible(true)
            hato02:setVisible(true)
            hato03:setVisible(true)
          end)
        end
        if L0_1:getCurrentCutIndex() == 3 and L0_1:getCurrentCutFrame() == 140 then
          invokeTask(function()
            hatoFlyLine(hato03, 15.6341, 20.97, 2.3, 40)
            wait(2)
            hatoFlyLine(hato01, 10.07, 20.98, 5.85, 50)
            wait(3)
            hatoFlyLine(hato02, 13.51, 20.98, 3.85, 60)
          end)
        end
        if L0_1:getCurrentCutIndex() == 3 and L0_1:getCurrentCutFrame() == 160 then
          hato07_flytable = {
            {
              pos = Vector(38.864, 5.256, 0.205),
              speed = 40
            },
            {
              pos = Vector(38.86355242, 5.55916878, -12.425470576),
              speed = 40
            },
            {
              pos = Vector(38.864, 6.228, -25.473),
              speed = 40
            }
          }
          hato08_flytable = {
            {
              pos = Vector(40.53352576, 5.460028484, 6.543507554),
              speed = 40
            },
            {
              pos = Vector(40.53352576, 5.054752545, -13.086531089),
              speed = 45
            },
            {
              pos = Vector(40.53352576, 4.881131801, -22.71014125),
              speed = 42
            }
          }
          hato09_flytable = {
            {
              pos = Vector(39.45634858, 3.436013704, 7.824752758),
              speed = 40
            },
            {
              pos = Vector(39.81937761, 4.3889748376, -12.425470576),
              speed = 40
            },
            {
              pos = Vector(39.5174914, 3.082932797, -25.74270791),
              speed = 40
            }
          }
          hato10_flytable = {
            {
              pos = Vector(40.52165867, 4.47674475, -1.824752758),
              speed = 45
            },
            {
              pos = Vector(40.8846877, 2.1750828735, -11.751491804),
              speed = 40
            },
            {
              pos = Vector(40.58280149, 4.123663843, -25.74270791),
              speed = 43
            }
          }
          hato11_flytable = {
            {
              pos = Vector(37.23867992, 5.886638919, 1.408840082),
              speed = 46
            },
            {
              pos = Vector(37.23867992, 5.481362979, -13.086531089),
              speed = 40
            },
            {
              pos = Vector(37.23867992, 5.307742235, -22.71014125),
              speed = 48
            }
          }
          hato12_flytable = {
            {
              pos = Vector(38.45062385, 4.1690486496, -4.998129632),
              speed = 48
            },
            {
              pos = Vector(38.34985256, 5.1193368275, -13.086531089),
              speed = 40
            },
            {
              pos = Vector(39.61555444, 6.948879021, -22.71014125),
              speed = 42
            }
          }
          hato13_flytable = {
            {
              pos = Vector(38.36855341, 4.886638919, -1.910650715),
              speed = 48
            },
            {
              pos = Vector(38.81800204, 4.481362979, -10.557768955),
              speed = 43
            },
            {
              pos = Vector(37.23867992, 5.1962063465, -24.24839946),
              speed = 40
            }
          }
          hato14_flytable = {
            {
              pos = Vector(37.25475394, 4.1690486496, -4.998129632),
              speed = 45
            },
            {
              pos = Vector(37.15398265, 5.1193368275, -13.086531089),
              speed = 48
            },
            {
              pos = Vector(38.41968453, 6.759365481, -22.71014125),
              speed = 44
            }
          }
          invokeTask(function()
            hato07:setVisible(true)
            hato08:setVisible(true)
            hato09:setVisible(true)
            hato10:setVisible(true)
            hato11:setVisible(true)
            hato12:setVisible(true)
            hato13:setVisible(true)
            hato14:setVisible(true)
            hatoFlyLine2(hato07, hato07_flytable)
            hatoFlyLine2(hato08, hato08_flytable)
            hatoFlyLine2(hato09, hato09_flytable)
            hatoFlyLine2(hato10, hato10_flytable)
            hatoFlyLine2(hato11, hato11_flytable)
            hatoFlyLine2(hato12, hato12_flytable)
            hatoFlyLine2(hato13, hato13_flytable)
            hatoFlyLine2(hato14, hato14_flytable)
          end)
        end
        if L0_1:getCurrentCutIndex() == 3 and L0_1:getCurrentCutFrame() == 216 then
          L3_4:requestBreak(Vector(-13.3, -5.13, 16.9), 16, 10)
        end
        wait()
      end
      L0_1:reset()
      resetCutEffects()
    end
  end)
  while true do
    wait()
  end
end
