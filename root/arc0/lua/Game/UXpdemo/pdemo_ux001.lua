import("math")
dofile("/Game/UXpdemo/pdemo_ux_common.lua")
effect_table = {
  [0] = "ux001_c01_eff",
  [1] = "ux001_c02_eff",
  [2] = "ux001_c03_eff",
  [3] = "ux001_c04_eff"
}
bg_table = {
  {
    bgname = "building_md_01_01",
    name = "building_md_01",
    pos = Vector(62.75, -0.158, 59.127),
    rot = 104.028
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
    bgname = "pdemo_ux_shadow_01_01",
    name = "pdemo_ux_shadow_01",
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
  },
  {
    bgname = "building_pd_01_05_j",
    name = "building_pd_01",
    pos = Vector(0, 0, 0),
    rot = 447.855
  },
  {
    bgname = "building_md_03_07_j",
    name = "building_md_03",
    pos = Vector(0, 0, 0),
    rot = 206.984
  }
}
bgobj_table = {}
flag_puppet_table = {
  {
    puppetname = "flag_md_01_01",
    name = "flag_md_01",
    pos = Vector(3.4375, 0.65778, -27.39659),
    rot = -180,
    rotx = 18
  },
  {
    puppetname = "flag_md_01_02",
    name = "flag_md_01",
    pos = Vector(10.5, 0.67937, -24.39506),
    rot = -180,
    rotx = 18
  },
  {
    puppetname = "flag_md_01_03",
    name = "flag_md_01",
    pos = Vector(-2.3125, 0.65778, -27.39659),
    rot = -180,
    rotx = 18
  }
}
flag_puppetobj_table = {}
puppet_table = {
  {
    puppetname = "man01",
    name = "man01_base",
    animname = "man01_idle_00",
    pos = Vector(6.06, -5.73, -2.638),
    rot = 0,
    attach = "building_pd_01_01"
  },
  {
    puppetname = "man02",
    name = "man02_base",
    animname = "man01_idle_00",
    pos = Vector(10.342, -2.554, -15.248),
    rot = 0,
    attach = "building_pd_01_01"
  },
  {
    puppetname = "man03",
    name = "man03_base",
    animname = "man01_walk_00",
    pos = Vector(6.06, -5.73, -6.921),
    pos2 = Vector(6.06, -5.73, 1.439),
    rot = 0,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man04",
    name = "man04_base",
    animname = "man01_walk_00",
    pos = Vector(6.622, -5.438, -8.217),
    pos2 = Vector(6.622, -2.87, -12.139),
    rot = 180,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man05",
    name = "man05_base",
    animname = "man01_walk_00",
    pos = Vector(-0.706, 4.912, -12.139),
    pos2 = Vector(-0.706, 9.875, -2.112),
    rot = 0,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man06",
    name = "man06_base",
    animname = "man11_stay_00",
    pos = Vector(0.081, 1.529, -22.116),
    rot = 72.263,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man07",
    name = "man07_base",
    animname = "man01_idle_00",
    pos = Vector(10.116, -2.554, -17.02),
    rot = 116.924,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man08",
    name = "man08_base",
    animname = "man01_stay_02",
    pos = Vector(7.185, -3.678, 8.153),
    rot = -166.635,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man09",
    name = "man09_base",
    animname = "man01_talk_01",
    pos = Vector(6.844, -3.69, 7.078),
    rot = 16.473,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man10",
    name = "man10_base",
    animname = "man01_walk_00",
    pos = Vector(1.35, 1.236, -18.545),
    pos2 = Vector(5.255, -2.327, -18.545),
    rot = 90,
    attach = "building_pd_01_01"
  },
  {
    puppetname = "man11",
    name = "man11_base",
    animname = "man11_funreaction_00",
    pos = Vector(3.3, 3.527, -15.698),
    rot = -88.736,
    attach = "building_pd_01_04"
  },
  {
    puppetname = "man12",
    name = "man12_base",
    animname = "man01_stay_01",
    pos = Vector(0.615, 1, -24.944),
    rot = 90.263
  },
  {
    puppetname = "man13",
    name = "man13_base",
    animname = "man01_talk_01",
    pos = Vector(1.992, 0, -24.944),
    rot = -87.279
  },
  {
    puppetname = "man17",
    name = "man17_base",
    animname = "man01_idle_00",
    pos = Vector(8.807, -3.976, 15.191),
    rot = -182.286,
    attach = "building_md_03_02"
  },
  {
    puppetname = "man18",
    name = "man18_base",
    animname = "man01_idle_00",
    pos = Vector(8.955, -3.976, 13.172),
    rot = -4.209,
    attach = "building_md_03_02"
  },
  {
    puppetname = "wom01",
    name = "wom01_base",
    animname = "wom01_talk_00",
    pos = Vector(-2.28, 0, -20.303),
    rot = 173.382
  },
  {
    puppetname = "wom02",
    name = "wom02_base",
    animname = "wom01_stay_00",
    pos = Vector(-3.038, 0, -21.568),
    rot = 43.854
  },
  {
    puppetname = "wom03",
    name = "wom03_base",
    animname = "wom01_stay_00",
    pos = Vector(-13.258, 0.024, 15.189),
    rot = 40.866,
    attach = "building_md_03_02"
  },
  {
    puppetname = "wom04",
    name = "wom04_base",
    animname = "wom01_walk_00",
    pos = Vector(-25.053, -16.997, -7.213),
    pos2 = Vector(-25.053, -16.997, 5.44),
    rot = 0,
    attach = "building_md_03_02"
  },
  {
    puppetname = "wom05",
    name = "wom05_base",
    animname = "wom01_walk_00",
    pos = Vector(-20.267, -16.997, 8.541),
    pos2 = Vector(-20.267, -16.997, -3.444),
    rot = 180,
    attach = "building_md_03_02"
  },
  {
    puppetname = "wom07",
    name = "wom05_base",
    animname = "wom01_stay_00",
    pos = Vector(-1.595, 0, -21.828),
    rot = -38.665
  },
  {
    puppetname = "wom10",
    name = "wom10_base",
    animname = "wom01_angry_00",
    pos = Vector(2.353, 3.527, -15.698),
    rot = 91.3,
    attach = "building_pd_01_04"
  }
}
puppetobj_table = {}
function main()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
  L0_0 = print
  L1_1 = "main start---------------------------"
  L0_0(L1_1)
  L0_0 = createGameObject2
  L1_1 = "PolyDemo"
  L0_0 = L0_0(L1_1)
  L1_1 = loadFileAsset
  L1_1 = L1_1(L2_2, L3_3)
  L2_2(L3_3)
  polydemo_init_args = L2_2
  L5_5 = L1_1
  L7_7 = L4_4(L5_5)
  L2_2(L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L4_4(L5_5))
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = bgobj_table
    L7_7[L8_8] = L9_9
    L7_7 = bgobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.loadModel
    L7_7(L8_8, L9_9)
    L7_7 = bgobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.setName
    L7_7(L8_8, L9_9)
    L7_7 = bgobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.setPos
    L7_7(L8_8, L9_9)
    L7_7 = bgobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.setRot
    L7_7(L8_8, L9_9, L10_10, L9_9(L10_10, L6_6.rot, 0))
    while true do
      L7_7 = bgobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.isLoading
      L7_7 = L7_7(L8_8)
      if L7_7 then
        L7_7 = wait
        L7_7()
      end
    end
  end
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = 0
    if L8_8 ~= nil then
      L7_7 = L6_6.rotx
    end
    L9_9[L10_10] = createGameObject2("Puppet")
    L9_9(L10_10, L6_6.name)
    L9_9(L10_10, L6_6.name, L6_6.name)
    L9_9(L10_10, L6_6.pos)
    L9_9(L10_10, XYZRotQuaternionEular(L7_7, L6_6.rot, L8_8))
    L9_9(L10_10, L6_6.name, L6_6.name)
    while true do
      if L9_9 then
        L9_9()
      end
    end
  end
  L2_2()
  L2_2()
  L2_2()
  L2_2()
  L2_2()
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = puppetobj_table
    L7_7[L8_8] = L9_9
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.loadModel
    L7_7(L8_8, L9_9)
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.loadBaseSkeleton
    L7_7(L8_8, L9_9)
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.setPos
    L7_7(L8_8, L9_9)
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.setRot
    L7_7(L8_8, L9_9, L10_10, L9_9(L10_10, L6_6.rot, 0))
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.loadPoseAnimation
    L7_7(L8_8, L9_9, L10_10)
    while true do
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.isLoading
      L7_7 = L7_7(L8_8)
      if L7_7 then
        L7_7 = wait
        L7_7()
      end
    end
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.try_init
    L7_7(L8_8)
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.waitForReady
    L7_7(L8_8)
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.try_start
    L7_7(L8_8)
    L7_7 = puppetobj_table
    L7_7 = L7_7[L8_8]
    L7_7 = L7_7.playPoseAnimation
    L7_7(L8_8, L9_9)
    L7_7 = L6_6.pos2
    if L7_7 then
      L7_7 = puppetobj_table
      L7_7[L8_8] = L9_9
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.loadModel
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.loadBaseSkeleton
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.setPos
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.setRot
      L7_7(L8_8, L9_9, L10_10, L9_9(L10_10, L6_6.rot, 0))
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.loadPoseAnimation
      L7_7(L8_8, L9_9, L10_10)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.try_init
      L7_7(L8_8)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.waitForReady
      L7_7(L8_8)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.try_start
      L7_7(L8_8)
      L7_7 = puppetobj_table
      L7_7[L8_8] = L9_9
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.loadModel
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.loadBaseSkeleton
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.setPos
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.setRot
      L7_7(L8_8, L9_9, L10_10, L9_9(L10_10, L6_6.rot, 0))
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.loadPoseAnimation
      L7_7(L8_8, L9_9, L10_10)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.try_init
      L7_7(L8_8)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.waitForReady
      L7_7(L8_8)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.try_start
      L7_7(L8_8)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.setVisible
      L7_7(L8_8, L9_9)
      L7_7 = puppetobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.setVisible
      L7_7(L8_8, L9_9)
    end
    L7_7 = L6_6.attach
    if L7_7 then
      L7_7 = bgobj_table
      L7_7 = L7_7[L8_8]
      L7_7 = L7_7.getPos
      L7_7 = L7_7(L8_8)
      L9_9(L10_10, Vector(0, 0, 0))
      L9_9(L10_10, XYZRotQuaternionEular(0, 0, 0))
      L9_9()
      L9_9(L10_10, puppetobj_table[L6_6.puppetname])
      L9_9(L10_10, L7_7)
      L9_9(L10_10, L8_8)
      if L9_9 then
        bgobj_table[L6_6.attach]:setPos(Vector(0, 0, 0))
        bgobj_table[L6_6.attach]:setRot(XYZRotQuaternionEular(0, 0, 0))
        wait()
        bgobj_table[L6_6.attach]:appendChild(puppetobj_table[L6_6.puppetname .. "_dummy"])
        bgobj_table[L6_6.attach]:appendChild(puppetobj_table[L6_6.puppetname .. "_dummy2"])
        bgobj_table[L6_6.attach]:setPos(L9_9)
        bgobj_table[L6_6.attach]:setRot(L10_10)
      end
    end
  end
  L2_2()
  L2_2()
  L2_2()
  for L5_5, L6_6 in L2_2(L3_3) do
    L7_7 = false
    notswing_table = L8_8
    for _FORV_11_ = 1, #L9_9 do
      if L6_6.bgname == notswing_table[_FORV_11_] then
        L7_7 = true
      end
    end
    if L7_7 == false then
      L8_8(L9_9, L10_10, 0.03)
    end
    L7_7 = false
    notturn_table = L8_8
    for _FORV_11_ = 1, #L9_9 do
      if L6_6.bgname == notturn_table[_FORV_11_] then
        L7_7 = true
      end
    end
    if L7_7 == false then
      L8_8(L9_9)
    end
  end
  L2_2()
  L2_2(L3_3, L4_4)
  hato01 = L2_2
  hato02 = L2_2
  hato03 = L2_2
  hato10 = L2_2
  hato11 = L2_2
  hato12 = L2_2
  hato13 = L2_2
  hato14 = L2_2
  hato15 = L2_2
  hato16 = L2_2
  hato17 = L2_2
  hato18 = L2_2
  hato19 = L2_2
  hato20 = L2_2
  hato21 = L2_2
  hato22 = L2_2
  hato23 = L2_2
  hato24 = L2_2
  hato25 = L2_2
  hato26 = L2_2
  hato27 = L2_2
  hato28 = L2_2
  hato29 = L2_2
  hato30 = L2_2
  hato31 = L2_2
  hato32 = L2_2
  hato33 = L2_2
  L2_2()
  L2_2()
  L2_2()
  L2_2(L3_3)
  while true do
    L2_2()
  end
end
