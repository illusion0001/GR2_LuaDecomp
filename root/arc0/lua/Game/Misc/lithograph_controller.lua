import("Sound")
dofile("/Game/Misc/node_util.lua")
Lithograph_controller = {}
function Lithograph_controller.create(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22
  L5_5 = Sound
  L6_6 = L5_5
  L5_5 = L5_5.loadResource
  L7_7 = "anotherzone_se"
  L5_5(L6_6, L7_7)
  L5_5 = print
  L6_6 = " [ misc lc ] create start ... "
  L5_5(L6_6)
  L5_5 = {}
  L6_6 = SDemo
  L6_6 = L6_6.create
  L7_7 = "lithograph_controller"
  L6_6 = L6_6(L7_7)
  L5_5.sdemo = L6_6
  L5_5.clear = 0
  L6_6 = {}
  L5_5.list = L6_6
  L6_6 = {}
  L5_5.current = L6_6
  L6_6 = {}
  L5_5.late = L6_6
  L6_6 = {}
  L6_6.demo_type = ""
  L6_6.cam = ""
  L6_6.aim = ""
  L6_6.vctrl = ""
  L6_6.warp = ""
  L6_6.cam_time = ""
  L6_6.aim_time = ""
  L5_5.debug = L6_6
  L5_5.debug_disp = false
  L6_6 = Fn_getMissionPart
  L6_6 = L6_6()
  L7_7 = true
  L8_8 = true
  L9_9 = Fn_getPlayer
  L9_9 = L9_9()
  L10_10 = false
  if L11_11 == nil then
    L10_10 = true
  else
    L10_10 = false
  end
  for L14_14, L15_15 in L11_11(L12_12) do
    L16_16 = {}
    L16_16.lithograph = nil
    L16_16.guidance_hand = nil
    L16_16.sensor = nil
    L16_16.lithograph_glow_se = nil
    L16_16.guide_eff = nil
    L16_16.guide_eff_name = nil
    L16_16.guide_eff_visible = false
    L16_16.guide_r_eff = nil
    L16_16.guide_l_eff_name = "loc_l_ef_point_00"
    L17_17 = {}
    L16_16.leadinglight_table = L17_17
    L16_16.leadinglight_se = nil
    L17_17 = A2_2[L14_14]
    L17_17 = L17_17.text
    L17_17 = L17_17 or A2_2[L14_14]
    L16_16.mission_txt = L17_17
    L17_17 = A2_2[L14_14]
    L17_17 = L17_17.se
    L17_17 = L17_17 or nil
    L16_16.mission_se = L17_17
    L16_16.mission_on = false
    L16_16.mission_task = nil
    L16_16.mission_enable = true
    L17_17 = A1_1[L14_14]
    L16_16.demo_table = L17_17
    L16_16.lithograph_start = false
    L16_16.lithograph_finish = false
    L16_16.com_first_half_prosess = false
    L16_16.com_second_half_prosess_pre = true
    L16_16.com_second_half_prosess_pre_start = false
    L16_16.com_second_half_prosess = false
    L16_16.com_second_half_prosess_start = false
    L16_16.com_second_half_prosess_event_start = false
    L16_16.com_second_half_prosess_wait = false
    L16_16.user_first_half_prosess = false
    L16_16.user_second_half_prosess = false
    L16_16.com_failure_prosess = false
    L16_16.square_func = nil
    L16_16.read_start = L10_10
    if A3_3 ~= nil then
      L17_17 = A3_3[L14_14]
      L16_16.guide_eff_name = L17_17
    end
    if A4_4 == true then
      L16_16.guide_eff_visible = true
    end
    L17_17 = 1
    repeat
      L18_18 = findGameObject2
      L19_19 = "Node"
      L20_20 = string
      L20_20 = L20_20.format
      L21_21 = "locator2_leadinglight_%02d_%02d"
      L22_22 = L14_14
      L22_22 = L20_20(L21_21, L22_22, L17_17)
      L18_18 = L18_18(L19_19, L20_20, L21_21, L22_22, L20_20(L21_21, L22_22, L17_17))
      if L18_18 ~= nil then
        L19_19 = L16_16.leadinglight_table
        L19_19[L17_17] = L18_18
        L17_17 = L17_17 + 1
      end
    until L17_17 > 50
    function L18_18()
      local L0_23, L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31
      L0_23 = L5_5.current
      L0_23 = L0_23.demo_table
      if L0_23 then
        L0_23 = L5_5.current
        L0_23 = L0_23.demo_table
        L0_23 = L0_23.first_half
        if L0_23 then
          L0_23 = Fn_getGameObject
          L1_24 = "mother2"
          L0_23 = L0_23(L1_24)
          L2_25 = L0_23
          L1_24 = L0_23.findGameObject2
          L3_26 = "Sandbox2"
          L4_27 = GameDatabase
          L4_27 = L4_27.get
          L8_31 = L4_27(L5_28, L6_29)
          L1_24 = L1_24(L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31, L4_27(L5_28, L6_29))
          L2_25 = {}
          L3_26 = L5_5.current
          L3_26 = L3_26.demo_table
          L3_26 = L3_26.first_half
          L3_26 = L3_26.warp
          L2_25.name = L3_26
          L2_25.node = nil
          L3_26 = {}
          L3_26.sdemo = nil
          L3_26.vctrl = nil
          L4_27 = L5_5.current
          L4_27 = L4_27.demo_table
          L4_27 = L4_27.first_half
          L4_27 = L4_27.func
          L2_25.node = L5_28
          if L5_28 == nil then
            L8_31 = L2_25.name
            L2_25.node = L5_28
          end
          if L5_28 then
            L3_26.sdemo = L5_28
            for L8_31 = 1, 2 do
              if ({
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }).cam_name then
                ;({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).cam_node = findGameObject2("Node", ({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).cam_name)
              end
              if ({
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }).aim_name then
                ;({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).aim_node = findGameObject2("Node", ({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).aim_name)
              end
              if not ({
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }).cam_node and ({
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }).cam_name then
                ;({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).cam_node = L1_24:findGameObject2("Node", ({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).cam_name)
              end
              if not ({
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }).aim_node and ({
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }).aim_name then
                ;({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).aim_node = L1_24:findGameObject2("Node", ({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).aim_name)
              end
              if L8_31 == 2 then
                ;({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).cam_time = L5_5.current.demo_table.first_half.cut2 and L5_5.current.demo_table.first_half.cut2.cam_time or 1
                ;({
                  cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                  aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                  cam_node = nil,
                  aim_node = nil,
                  append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                  cam_time = 0,
                  aim_time = 0,
                  cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                  aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                  waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
                }).aim_time = L5_5.current.demo_table.first_half.cut2 and L5_5.current.demo_table.first_half.cut2.aim_time or 1
              end
              L3_26.sdemo[L8_31] = {
                cam_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam or nil,
                aim_name = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim or nil,
                cam_node = nil,
                aim_node = nil,
                append = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].append or false,
                cam_time = 0,
                aim_time = 0,
                cam_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].cam_hashfunc or "easeInOut",
                aim_hashfunc = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].aim_hashfunc or "easeInOut",
                waittime = L5_5.current.demo_table.first_half["cut" .. L8_31] and L5_5.current.demo_table.first_half["cut" .. L8_31].waittime or 0
              }
            end
            L5_28()
            L5_28(L6_29, L7_30)
            setstay_flag = true
          elseif L5_28 then
            L5_28.name = L6_29
            L5_28.node = nil
            L8_31 = L5_28.name
            L5_28.node = L6_29
            if not L6_29 then
              L8_31 = "Node"
              L5_28.node = L6_29
            end
            L3_26.vctrl = L5_28
            L6_29()
            L8_31 = true
            L6_29(L7_30, L8_31)
            setstay_flag = true
          end
          if L5_28 then
            L5_28(L6_29, L7_30)
          end
          if L4_27 then
            L5_28()
          end
          if L5_28 then
            if L5_28 then
              if not L5_28 then
              elseif L5_28 then
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[1]
                L8_31 = L8_31.aim_node
                L5_28(L6_29, L7_30, L8_31, L3_26.sdemo[1].append)
                L5_28(L6_29)
                L5_28.demo_type = "sdemo"
                L5_28.cam = L6_29
                L5_28.aim = L6_29
              end
            end
          elseif L5_28 then
            L5_28(L6_29, L7_30)
            L5_28.demo_type = "vctrl"
            L5_28.vctrl = L6_29
          end
          if L5_28 then
            L5_28(L6_29)
            L5_28(L6_29, L7_30)
            L5_28.warp = L6_29
          end
          if L5_28 ~= nil then
            if not L5_28 then
              if L5_28 ~= nil then
                L5_28(L6_29, L7_30)
                L5_28(L6_29, L7_30)
                L5_28(L6_29, L7_30)
              end
              if L5_28 ~= nil then
                L5_28(L6_29, L7_30)
              end
              if L5_28 ~= nil then
                L5_28(L6_29, L7_30)
              end
            end
          end
          if L5_28 then
            if L5_28 then
              if not L5_28 then
              elseif L5_28 then
                L5_28(L6_29)
              end
            end
          end
          L5_28(L6_29)
          L8_31 = 1
          L16_16.lithograph_glow_se = L5_28
          if L5_28 then
            if L5_28 ~= nil then
              L8_31 = 1
              L5_28(L6_29, L7_30, L8_31, "", L16_16.lithograph)
            else
              L8_31 = 1
              L5_28(L6_29, L7_30, L8_31, "", L16_16.lithograph)
            end
            L16_16.mission_on = true
            L5_28(L6_29)
            L5_28(L6_29)
          end
          if L5_28 then
            if L5_28 ~= 0 then
              L5_28(L6_29)
              L16_16.mission_on = false
            end
          else
            L16_16.mission_on = false
          end
          L16_16.lithograph_start = true
          if L5_28 ~= nil then
            if L5_28 ~= nil then
              L5_28(L6_29, L7_30)
            end
          end
          if L5_28 then
            if L5_28 then
              if not L5_28 then
              elseif L5_28 then
                if L5_28 == L6_29 then
                  L5_28.cam_time = 0
                end
                if L5_28 == L6_29 then
                  L5_28.aim_time = 0
                end
                L6_29.pos = L7_30
                L6_29.time = L7_30
                L6_29.hashfunc = L7_30
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.cam_node
                L7_30.pos = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.cam_time
                L7_30.time = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.cam_hashfunc
                L7_30.hashfunc = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[1]
                L8_31 = L8_31.aim_node
                L7_30.pos = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[1]
                L8_31 = L8_31.aim_time
                L7_30.time = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[1]
                L8_31 = L8_31.aim_hashfunc
                L7_30.hashfunc = L8_31
                L8_31 = {}
                L8_31.pos = L3_26.sdemo[2].aim_node
                L8_31.time = L3_26.sdemo[2].aim_time
                L8_31.hashfunc = L3_26.sdemo[2].aim_hashfunc
                L8_31 = L7_30
                L7_30(L8_31, L5_28, L6_29)
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.cam_name
                L7_30.cam = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.aim_name
                L7_30.aim = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.cam_time
                L7_30.cam_time = L8_31
                L8_31 = L3_26.sdemo
                L8_31 = L8_31[2]
                L8_31 = L8_31.aim_time
                L7_30.aim_time = L8_31
              end
            end
          end
          repeat
            L5_28()
          until L5_28
          repeat
            L5_28()
          until L5_28 == false
          L5_28(L6_29)
          if L5_28 then
            L5_28(L6_29, L7_30)
          end
          L5_28.demo_type = ""
          L5_28.cam = ""
          L5_28.aim = ""
          L5_28.vctrl = ""
          L5_28.warp = ""
          L5_28.cam_time = ""
          L5_28.aim_time = ""
          L5_28()
          if L5_28 then
            L5_28(L6_29, L7_30)
            setstay_flag = nil
          end
        end
      else
        L16_16.lithograph_start = true
      end
      L16_16.com_first_half_prosess = true
    end
    L19_19 = {}
    L20_20 = {}
    L20_20.id = "ic_litho_00120"
    L20_20.func = L18_18
    L19_19.RL = L20_20
    L16_16.square_func = L18_18
    L20_20 = findGameObject2
    L21_21 = "Lithograph"
    L22_22 = string
    L22_22 = L22_22.format
    L22_22 = L22_22("lithograph_%02d", L14_14)
    L20_20 = L20_20(L21_21, L22_22, L22_22("lithograph_%02d", L14_14))
    L16_16.lithograph = L20_20
    L20_20 = findGameObject2
    L21_21 = "GuidanceHand"
    L22_22 = string
    L22_22 = L22_22.format
    L22_22 = L22_22("hand_%02d", L14_14)
    L20_20 = L20_20(L21_21, L22_22, L22_22("hand_%02d", L14_14))
    L16_16.guidance_hand = L20_20
    L20_20 = L16_16.guidance_hand
    if L20_20 then
      if L15_15 then
        L20_20 = L16_16.guidance_hand
        L21_21 = L20_20
        L20_20 = L20_20.setActive
        L22_22 = false
        L20_20(L21_21, L22_22)
      else
        L20_20 = L16_16.guidance_hand
        L21_21 = L20_20
        L20_20 = L20_20.play
        L22_22 = "stay_up"
        L20_20(L21_21, L22_22)
      end
    end
    L20_20 = L16_16.lithograph
    if L20_20 then
      L20_20 = L16_16.lithograph
      L21_21 = L20_20
      L20_20 = L20_20.offGlow
      L20_20(L21_21)
      if L8_8 == true and L15_15 == false then
        L7_7 = true
        L20_20 = L5_5.list
        L20_20 = #L20_20
        L5_5.clear = L20_20
        L5_5.current = L16_16
        L20_20 = A0_0[L6_6]
        L20_20 = L20_20.start
        if L20_20 then
          L16_16.lithograph_start = true
          L16_16.com_first_half_prosess = true
        end
        L20_20 = L5_5.clear
        if L20_20 > 0 then
          L20_20 = L5_5.list
          L21_21 = L5_5.clear
          L20_20 = L20_20[L21_21]
          L5_5.late = L20_20
          if A3_3 ~= nil then
            L20_20 = L5_5.late
            L20_20 = L20_20.guide_eff_name
            if L20_20 ~= "" then
              L20_20 = L5_5.list
              L20_20 = #L20_20
              if L20_20 ~= nil then
                L20_20 = L5_5.late
                if L20_20 ~= nil then
                  L20_20 = L5_5.late
                  L20_20 = L20_20.guidance_hand
                  L21_21 = L20_20
                  L20_20 = L20_20.setActive
                  L22_22 = true
                  L20_20(L21_21, L22_22)
                  L20_20 = L5_5.late
                  L20_20 = L20_20.guidance_hand
                  L21_21 = L20_20
                  L20_20 = L20_20.play
                  L22_22 = "stay_down"
                  L20_20(L21_21, L22_22)
                  L20_20 = string
                  L20_20 = L20_20.format
                  L21_21 = "lightofguide_%02d"
                  L22_22 = tostring
                  L22_22 = L22_22(string.sub(L16_16.guidance_hand:getName(), -2))
                  L22_22 = L22_22 - 1
                  L20_20 = L20_20(L21_21, L22_22)
                  L21_21 = L5_5.late
                  L22_22 = Fn_createEffect
                  L22_22 = L22_22(L20_20, L5_5.late.guide_eff_name, L5_5.late.guidance_hand)
                  L21_21.guide_eff = L22_22
                  L21_21 = string
                  L21_21 = L21_21.format
                  L22_22 = "lightofguide_r_%02d"
                  L21_21 = L21_21(L22_22, tostring(string.sub(L16_16.guidance_hand:getName(), -2)) - 1)
                  L22_22 = L5_5.late
                  L22_22.guide_r_eff = Fn_createEffect(L21_21, "ef_hnd_par_03", {
                    obj = L5_5.late.guidance_hand:getHandPuppet(),
                    joint = "loc_r_ef_point_00"
                  })
                  L22_22 = string
                  L22_22 = L22_22.format
                  L22_22 = L22_22("lightofguide_l_%02d", tostring(string.sub(L16_16.guidance_hand:getName(), -2)) - 1)
                  L5_5.late.guide_l_eff = Fn_createEffect(L22_22, "ef_hnd_par_03", {
                    obj = L5_5.late.guidance_hand:getHandPuppet(),
                    joint = "loc_l_ef_point_00"
                  })
                  if L5_5.late.leadinglight_table[1] ~= nil then
                    L5_5.late.leadinglight_se = Sound:playSEHandleLineStrips("leadinglight", 1, "", L5_5.late.leadinglight_table)
                  end
                end
              end
            end
          end
        end
      elseif L8_8 == true and L15_15 == true then
        L20_20 = table
        L20_20 = L20_20.maxn
        L21_21 = A0_0[L6_6]
        L20_20 = L20_20(L21_21)
        if L14_14 == L20_20 then
          L7_7 = false
          L20_20 = L5_5.list
          L20_20 = #L20_20
          L20_20 = L20_20 + 1
          L5_5.clear = L20_20
          L5_5.late = L16_16
          if A3_3 ~= nil then
            L20_20 = L5_5.late
            L20_20 = L20_20.guide_eff_name
            if L20_20 ~= "" then
              L20_20 = L5_5.list
              L20_20 = #L20_20
              if L20_20 ~= nil then
                L20_20 = L5_5.late
                if L20_20 ~= nil then
                  L20_20 = L5_5.late
                  L20_20 = L20_20.guidance_hand
                  L21_21 = L20_20
                  L20_20 = L20_20.setActive
                  L22_22 = true
                  L20_20(L21_21, L22_22)
                  L20_20 = L5_5.late
                  L20_20 = L20_20.guidance_hand
                  L21_21 = L20_20
                  L20_20 = L20_20.play
                  L22_22 = "stay_down"
                  L20_20(L21_21, L22_22)
                  L20_20 = string
                  L20_20 = L20_20.format
                  L21_21 = "lightofguide_%02d"
                  L22_22 = tostring
                  L22_22 = L22_22(string.sub(L16_16.guidance_hand:getName(), -2))
                  L22_22 = L22_22 - 1
                  L20_20 = L20_20(L21_21, L22_22)
                  L21_21 = L5_5.late
                  L22_22 = Fn_createEffect
                  L22_22 = L22_22(L20_20, L5_5.late.guide_eff_name, L5_5.late.guidance_hand)
                  L21_21.guide_eff = L22_22
                  L21_21 = string
                  L21_21 = L21_21.format
                  L22_22 = "lightofguide_r_%02d"
                  L21_21 = L21_21(L22_22, tostring(string.sub(L16_16.guidance_hand:getName(), -2)) - 1)
                  L22_22 = L5_5.late
                  L22_22.guide_r_eff = Fn_createEffect(L21_21, "ef_hnd_par_03", {
                    obj = L5_5.late.guidance_hand:getHandPuppet(),
                    joint = "loc_r_ef_point_00"
                  })
                  L22_22 = string
                  L22_22 = L22_22.format
                  L22_22 = L22_22("lightofguide_l_%02d", tostring(string.sub(L16_16.guidance_hand:getName(), -2)) - 1)
                  L5_5.late.guide_l_eff = Fn_createEffect(L22_22, "ef_hnd_par_03", {
                    obj = L5_5.late.guidance_hand:getHandPuppet(),
                    joint = "loc_l_ef_point_00"
                  })
                  if L5_5.late.leadinglight_table[1] ~= nil then
                    L5_5.late.leadinglight_se = Sound:playSEHandleLineStrips("leadinglight", 1, "", L5_5.late.leadinglight_table)
                  end
                end
              end
            end
          end
        end
      else
        L7_7 = false
      end
      L20_20 = Fn_setupGestureAction
      L21_21 = {}
      L22_22 = L16_16.lithograph
      L21_21.target = L22_22
      L22_22 = L19_19
      L20_20 = L20_20(L21_21, L22_22, nil, L7_7, true)
      if L20_20 then
        L16_16.sensor = L20_20
        L21_21 = L16_16.lithograph
        L22_22 = L21_21
        L21_21 = L21_21.getName
        L21_21 = L21_21(L22_22)
        L22_22 = "pccubesensor2_"
        L22_22 = L22_22 .. L21_21 .. "_OnEnter"
        L16_16.lithograph:setVisibleBlockEnable(false)
        _G[L22_22] = function()
          if L16_16.lithograph_start then
            if L16_16.mission_task == nil then
              L16_16.mission_on = true
              L16_16.mission_task = invokeTask(function()
                if L16_16.mission_se ~= nil then
                  Sound:playSE(L16_16.mission_se, 1, "", L16_16.lithograph)
                else
                  Sound:playSE("skb_003", 1, "", L16_16.lithograph)
                end
                Fn_captionViewWait(L16_16.mission_txt, 0, 3)
                while L16_16.mission_on do
                  wait()
                end
                Fn_captionViewEnd()
                L16_16.mission_task = nil
              end)
            end
          elseif not L16_16.read_start then
            invokeTask(L18_18)
          else
            Fn_gestureAction(L19_19)
          end
        end
        _G["pccubesensor2_" .. L21_21 .. "_OnLeave"] = function()
          if L16_16.lithograph_start then
            L16_16.mission_on = false
          elseif L16_16.read_start then
            Fn_gestureActionCancel()
          end
        end
        table.insert(L5_5.list, L16_16)
      end
    end
    L8_8 = L15_15
    break
  end
  L11_11(L12_12)
  L11_11(L12_12)
  L11_11(L12_12)
  return L5_5
end
function Lithograph_controller.LithographStart(A0_32)
  invokeTask(function()
    A0_32.current.square_func()
  end)
end
function Lithograph_controller.isLithographStart(A0_33)
  return A0_33.current.lithograph_start
end
function Lithograph_controller.isLithographFinish(A0_34)
  return A0_34.current.lithograph_finish
end
function Lithograph_controller.isFirstHalfProcessEnd(A0_35)
  return A0_35.current.com_first_half_prosess
end
function Lithograph_controller.resetFirstHalfProcess(A0_36)
  A0_36.current.lithograph_start = false
end
function Lithograph_controller.isSecondHalfProcessEnd(A0_37)
  local L1_38
  L1_38 = A0_37.current
  L1_38 = L1_38.com_second_half_prosess
  if L1_38 == true then
    A0_37.late = A0_37.current
    if A0_37.clear < #A0_37.list then
      A0_37.current = A0_37.list[A0_37.clear + 1]
      A0_37.current.sensor:setActive(true)
    end
  end
  return L1_38
end
function Lithograph_controller.setFirstHalfProcessEnd(A0_39)
  A0_39.current.user_first_half_prosess = true
end
function Lithograph_controller.setSecondHalfProcessEnd(A0_40)
  A0_40.current.user_second_half_prosess = true
end
function Lithograph_controller.isSecondHalfProcessStart(A0_41)
  return A0_41.current.com_second_half_prosess_start
end
function Lithograph_controller.isSecondHalfProcessEventStart(A0_42)
  return A0_42.current.com_second_half_prosess_event_start
end
function Lithograph_controller.isSecondHalfProcessWait(A0_43)
  return A0_43.current.com_second_half_prosess_wait
end
function Lithograph_controller.isFailureProcessEnd(A0_44)
  return A0_44.current.com_failure_prosess
end
function Lithograph_controller.setFailureProcessEnd(A0_45)
  A0_45.current.user_failure_prosess = true
end
function Lithograph_controller.getCurrentLithographName(A0_46)
  if A0_46.current.lithograph == nil then
    return nil
  else
    return A0_46.current.lithograph:getName()
  end
end
function Lithograph_controller.setSensorVisible(A0_47, A1_48)
  if A0_47.current.sensor == nil then
    return nil
  else
    A0_47.current.sensor:setActive(A1_48)
  end
end
function Lithograph_controller.isMissionview(A0_49)
  local L1_50
  L1_50 = A0_49.current
  L1_50 = L1_50.mission_on
  if not L1_50 then
    L1_50 = A0_49.current
    L1_50 = L1_50.mission_task
    if L1_50 == nil then
      L1_50 = false
      return L1_50
    end
  else
    L1_50 = true
    return L1_50
  end
end
function Lithograph_controller.setSecondHalfProcessPre(A0_51)
  A0_51.current.com_second_half_prosess_pre = false
end
function Lithograph_controller.isSecondHalfProcessPreStart(A0_52)
  return A0_52.current.com_second_half_prosess_pre_start
end
function Lithograph_controller.setSecondHalfProcessPreEnd(A0_53)
  A0_53.current.com_second_half_prosess_pre = true
end
function Lithograph_controller.missionComplete(A0_54)
  local L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66, L13_67, L14_68
  L1_55 = A0_54.current
  L1_55 = L1_55.sensor
  L2_56 = L1_55
  L1_55 = L1_55.setActive
  L3_57 = false
  L1_55(L2_56, L3_57)
  L1_55 = Fn_captionViewEnd
  L1_55()
  L1_55 = A0_54.current
  L1_55.mission_on = false
  L1_55 = A0_54.current
  L1_55 = L1_55.demo_table
  if L1_55 ~= nil then
    L1_55 = A0_54.current
    L1_55 = L1_55.demo_table
    L1_55 = L1_55.second_half
  elseif L1_55 == nil then
    L1_55 = A0_54.current
    L1_55.com_second_half_prosess = true
    L1_55 = A0_54.clear
    L1_55 = L1_55 + 1
    A0_54.clear = L1_55
    L1_55 = false
    return L1_55
  end
  L1_55 = Fn_getGameObject
  L2_56 = "mother2"
  L1_55 = L1_55(L2_56)
  L3_57 = L1_55
  L2_56 = L1_55.findGameObject2
  L4_58 = "Sandbox2"
  L5_59 = GameDatabase
  L6_60 = L5_59
  L5_59 = L5_59.get
  L14_68 = L5_59(L6_60, L7_61)
  L2_56 = L2_56(L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66, L13_67, L14_68, L5_59(L6_60, L7_61))
  L3_57 = {}
  L4_58 = A0_54.current
  L4_58 = L4_58.demo_table
  L4_58 = L4_58.second_half
  L4_58 = L4_58.warp
  L3_57.name = L4_58
  L3_57.node = nil
  L4_58 = {}
  L4_58.sdemo = nil
  L4_58.vctrl = nil
  L5_59 = A0_54.current
  L5_59 = L5_59.demo_table
  L5_59 = L5_59.second_half
  L5_59 = L5_59.endfade
  L6_60 = false
  L3_57.node = L7_61
  if L7_61 == nil then
    L10_64 = L3_57.name
    L3_57.node = L7_61
  end
  if L7_61 then
    L4_58.sdemo = L7_61
    for L10_64 = 1, 3 do
      L11_65 = {}
      L12_66 = A0_54.current
      L12_66 = L12_66.demo_table
      L12_66 = L12_66.second_half
      L13_67 = "cut"
      L14_68 = L10_64
      L13_67 = L13_67 .. L14_68
      L12_66 = L12_66[L13_67]
      if L12_66 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        L12_66 = L12_66.cam
      else
        L12_66 = L12_66 or nil
      end
      L11_65.cam_name = L12_66
      L12_66 = A0_54.current
      L12_66 = L12_66.demo_table
      L12_66 = L12_66.second_half
      L13_67 = "cut"
      L14_68 = L10_64
      L13_67 = L13_67 .. L14_68
      L12_66 = L12_66[L13_67]
      if L12_66 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        L12_66 = L12_66.aim
      else
        L12_66 = L12_66 or nil
      end
      L11_65.aim_name = L12_66
      L11_65.cam_node = nil
      L11_65.aim_node = nil
      L12_66 = A0_54.current
      L12_66 = L12_66.demo_table
      L12_66 = L12_66.second_half
      L13_67 = "cut"
      L14_68 = L10_64
      L13_67 = L13_67 .. L14_68
      L12_66 = L12_66[L13_67]
      if L12_66 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        L12_66 = L12_66.append
      else
        L12_66 = L12_66 or false
      end
      L11_65.append = L12_66
      L11_65.cam_time = 0
      L11_65.aim_time = 0
      L12_66 = A0_54.current
      L12_66 = L12_66.demo_table
      L12_66 = L12_66.second_half
      L13_67 = "cut"
      L14_68 = L10_64
      L13_67 = L13_67 .. L14_68
      L12_66 = L12_66[L13_67]
      if L12_66 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        L12_66 = L12_66.cam_hashfunc
      else
        L12_66 = L12_66 or "easeInOut"
      end
      L11_65.cam_hashfunc = L12_66
      L12_66 = A0_54.current
      L12_66 = L12_66.demo_table
      L12_66 = L12_66.second_half
      L13_67 = "cut"
      L14_68 = L10_64
      L13_67 = L13_67 .. L14_68
      L12_66 = L12_66[L13_67]
      if L12_66 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        L12_66 = L12_66.aim_hashfunc
      else
        L12_66 = L12_66 or "easeInOut"
      end
      L11_65.aim_hashfunc = L12_66
      L12_66 = A0_54.current
      L12_66 = L12_66.demo_table
      L12_66 = L12_66.second_half
      L13_67 = "cut"
      L14_68 = L10_64
      L13_67 = L13_67 .. L14_68
      L12_66 = L12_66[L13_67]
      if L12_66 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        L12_66 = L12_66.waittime
      else
        L12_66 = L12_66 or 0
      end
      L11_65.waittime = L12_66
      L12_66 = L11_65.cam_name
      if L12_66 then
        L12_66 = findGameObject2
        L13_67 = "Node"
        L14_68 = L11_65.cam_name
        L12_66 = L12_66(L13_67, L14_68)
        L11_65.cam_node = L12_66
      end
      L12_66 = L11_65.aim_name
      if L12_66 then
        L12_66 = findGameObject2
        L13_67 = "Node"
        L14_68 = L11_65.aim_name
        L12_66 = L12_66(L13_67, L14_68)
        L11_65.aim_node = L12_66
      end
      L12_66 = L11_65.cam_node
      if not L12_66 then
        L12_66 = L11_65.cam_name
        if L12_66 then
          L13_67 = L2_56
          L12_66 = L2_56.findGameObject2
          L14_68 = "Node"
          L12_66 = L12_66(L13_67, L14_68, L11_65.cam_name)
          L11_65.cam_node = L12_66
        end
      end
      L12_66 = L11_65.aim_node
      if not L12_66 then
        L12_66 = L11_65.aim_name
        if L12_66 then
          L13_67 = L2_56
          L12_66 = L2_56.findGameObject2
          L14_68 = "Node"
          L12_66 = L12_66(L13_67, L14_68, L11_65.aim_name)
          L11_65.aim_node = L12_66
        end
      end
      if L10_64 == 2 or L10_64 == 3 then
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        if L12_66 then
          L12_66 = A0_54.current
          L12_66 = L12_66.demo_table
          L12_66 = L12_66.second_half
          L13_67 = "cut"
          L14_68 = L10_64
          L13_67 = L13_67 .. L14_68
          L12_66 = L12_66[L13_67]
          L12_66 = L12_66.cam_time
        else
          L12_66 = L12_66 or 1
        end
        L11_65.cam_time = L12_66
        L12_66 = A0_54.current
        L12_66 = L12_66.demo_table
        L12_66 = L12_66.second_half
        L13_67 = "cut"
        L14_68 = L10_64
        L13_67 = L13_67 .. L14_68
        L12_66 = L12_66[L13_67]
        if L12_66 then
          L12_66 = A0_54.current
          L12_66 = L12_66.demo_table
          L12_66 = L12_66.second_half
          L13_67 = "cut"
          L14_68 = L10_64
          L13_67 = L13_67 .. L14_68
          L12_66 = L12_66[L13_67]
          L12_66 = L12_66.aim_time
        else
          L12_66 = L12_66 or 1
        end
        L11_65.aim_time = L12_66
      end
      L12_66 = L4_58.sdemo
      L12_66[L10_64] = L11_65
    end
  elseif L7_61 then
    L7_61.name = L8_62
    L7_61.node = nil
    L10_64 = L7_61.name
    L7_61.node = L8_62
    if not L8_62 then
      L10_64 = "Node"
      L11_65 = L7_61.name
      L7_61.node = L8_62
    end
    L4_58.vctrl = L7_61
  end
  L1_55, L2_56 = nil, nil
  if L7_61 == true then
    L7_61()
    L7_61(L8_62, L9_63)
    setstay_flag = true
  else
    L7_61()
  end
  L7_61(L8_62)
  L7_61(L8_62)
  if L7_61 == true then
    repeat
      repeat
        L7_61()
      until L7_61 == false
    until L7_61 ~= L8_62
  end
  L7_61(L8_62, L9_63)
  setstay_flag = true
  L7_61.com_second_half_prosess_pre_start = true
  repeat
    L7_61()
  until L7_61
  if L7_61 then
    L7_61(L8_62)
  end
  L7_61.com_second_half_prosess_start = true
  L10_64 = false
  if L7_61 then
    L12_66 = L7_61
    L11_65 = L7_61.setExpandedAabb
    L13_67 = true
    L11_65(L12_66, L13_67)
    L12_66 = L7_61
    L11_65 = L7_61.getDriftEnable
    L11_65 = L11_65(L12_66)
    if L11_65 then
      L12_66 = L7_61
      L11_65 = L7_61.setDriftEnable
      L13_67 = false
      L11_65(L12_66, L13_67)
    end
  end
  if L8_62 then
    L12_66 = L8_62
    L11_65 = L8_62.setExpandedAabb
    L13_67 = true
    L11_65(L12_66, L13_67)
    L12_66 = L8_62
    L11_65 = L8_62.getDriftEnable
    L11_65 = L11_65(L12_66)
    if L11_65 then
      L12_66 = L8_62
      L11_65 = L8_62.setDriftEnable
      L13_67 = false
      L11_65(L12_66, L13_67)
      L10_64 = true
    end
  end
  L11_65 = L4_58.sdemo
  if L11_65 then
    L11_65 = L4_58.sdemo
    L11_65 = L11_65[1]
    if L11_65 then
      L11_65 = A0_54.sdemo
      L12_66 = L11_65
      L11_65 = L11_65.set
      L13_67 = L4_58.sdemo
      L13_67 = L13_67[1]
      L13_67 = L13_67.cam_node
      L14_68 = L4_58.sdemo
      L14_68 = L14_68[1]
      L14_68 = L14_68.aim_node
      L11_65(L12_66, L13_67, L14_68, L4_58.sdemo[1].append)
      L11_65 = A0_54.sdemo
      L12_66 = L11_65
      L11_65 = L11_65.play
      L11_65(L12_66)
      L11_65 = A0_54.debug
      L11_65.demo_type = "sdemo"
      L11_65 = A0_54.debug
      L12_66 = L4_58.sdemo
      L12_66 = L12_66[1]
      L12_66 = L12_66.cam_name
      L11_65.cam = L12_66
      L11_65 = A0_54.debug
      L12_66 = L4_58.sdemo
      L12_66 = L12_66[1]
      L12_66 = L12_66.aim_name
      L11_65.aim = L12_66
    end
  else
    L11_65 = L4_58.vctrl
    if L11_65 then
      L11_65 = L4_58.vctrl
      L11_65 = L11_65.node
      L12_66 = L11_65
      L11_65 = L11_65.setActive
      L13_67 = true
      L11_65(L12_66, L13_67)
      L11_65 = A0_54.debug
      L11_65.demo_type = "vctrl"
      L11_65 = A0_54.debug
      L12_66 = L4_58.vctrl
      L12_66 = L12_66.name
      L11_65.vctrl = L12_66
    end
  end
  L11_65 = HUD
  L12_66 = L11_65
  L11_65 = L11_65.fadein
  L13_67 = 0
  L11_65(L12_66, L13_67)
  L11_65 = A0_54.current
  L11_65.mission_on = true
  L11_65 = Sound
  L12_66 = L11_65
  L11_65 = L11_65.playSE
  L13_67 = "skb_004"
  L14_68 = 1
  L11_65(L12_66, L13_67, L14_68, "", A0_54.current.lithograph)
  L11_65 = Fn_captionView
  L12_66 = "ic_litho_00100"
  L13_67 = 2
  L11_65(L12_66, L13_67)
  L11_65 = A0_54.current
  L11_65 = L11_65.lithograph
  L12_66 = L11_65
  L11_65 = L11_65.offGlow
  L11_65(L12_66)
  L11_65 = A0_54.current
  L11_65 = L11_65.lithograph_glow_se
  if L11_65 ~= nil then
    L11_65 = Sound
    L12_66 = L11_65
    L11_65 = L11_65.stopSEHandle
    L13_67 = A0_54.current
    L13_67 = L13_67.lithograph_glow_se
    L11_65(L12_66, L13_67)
  end
  L11_65 = Sound
  L12_66 = L11_65
  L11_65 = L11_65.playSE
  L13_67 = "stele_clear"
  L11_65(L12_66, L13_67)
  repeat
    L11_65 = wait
    L11_65()
    L11_65 = A0_54.current
    L11_65 = L11_65.lithograph
    L12_66 = L11_65
    L11_65 = L11_65.isOffGlow
    L11_65 = L11_65(L12_66)
  until L11_65
  L11_65 = waitSeconds
  L12_66 = 0.5
  L11_65(L12_66)
  L11_65 = L4_58.sdemo
  if L11_65 then
    L11_65 = L4_58.sdemo
    L11_65 = L11_65[1]
    L11_65 = L11_65.waittime
    if L11_65 ~= 0 then
      L11_65 = waitSeconds
      L12_66 = L4_58.sdemo
      L12_66 = L12_66[1]
      L12_66 = L12_66.waittime
      L11_65(L12_66)
      L11_65 = A0_54.current
      L11_65.mission_on = false
    end
  else
    L11_65 = A0_54.current
    L11_65.mission_on = false
  end
  if L5_59 == true then
    L11_65 = L4_58.sdemo
    L11_65 = L11_65[2]
    L11_65 = L11_65.cam_name
    if L11_65 == nil then
      L11_65 = L4_58.sdemo
      L11_65 = L11_65[3]
      L11_65 = L11_65.cam_name
      if L11_65 == nil then
        L11_65 = waitSeconds
        L12_66 = 1.5
        L11_65(L12_66)
        L11_65 = Fn_blackout
        L12_66 = 1
        L11_65(L12_66)
        L6_60 = true
      end
    end
  end
  L11_65 = false
  L12_66 = A0_54.current
  L12_66 = L12_66.guidance_hand
  if L12_66 then
    L12_66 = L4_58.sdemo
    if L12_66 then
      L12_66 = L4_58.sdemo
      L12_66 = L12_66[2]
      if L12_66 then
        L12_66 = L4_58.sdemo
        L12_66 = L12_66[2]
        L12_66 = L12_66.cam_node
        if not L12_66 then
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[2]
          L12_66 = L12_66.aim_node
        elseif L12_66 then
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[1]
          L12_66 = L12_66.cam_node
          L13_67 = L4_58.sdemo
          L13_67 = L13_67[2]
          L13_67 = L13_67.cam_node
          if L12_66 == L13_67 then
            L12_66 = L4_58.sdemo
            L12_66 = L12_66[2]
            L12_66.cam_time = 0
          end
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[1]
          L12_66 = L12_66.aim_node
          L13_67 = L4_58.sdemo
          L13_67 = L13_67[2]
          L13_67 = L13_67.aim_node
          if L12_66 == L13_67 then
            L12_66 = L4_58.sdemo
            L12_66 = L12_66[2]
            L12_66.aim_time = 0
          end
          L12_66 = {L13_67, L14_68}
          L13_67 = {}
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[1]
          L14_68 = L14_68.cam_node
          L13_67.pos = L14_68
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[1]
          L14_68 = L14_68.cam_time
          L13_67.time = L14_68
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[1]
          L14_68 = L14_68.cam_hashfunc
          L13_67.hashfunc = L14_68
          L14_68 = {}
          L14_68.pos = L4_58.sdemo[2].cam_node
          L14_68.time = L4_58.sdemo[2].cam_time
          L14_68.hashfunc = L4_58.sdemo[2].cam_hashfunc
          L13_67 = {
            L14_68,
            {
              pos = L4_58.sdemo[2].aim_node,
              time = L4_58.sdemo[2].aim_time,
              hashfunc = L4_58.sdemo[2].aim_hashfunc
            }
          }
          L14_68 = {}
          L14_68.pos = L4_58.sdemo[1].aim_node
          L14_68.time = L4_58.sdemo[1].aim_time
          L14_68.hashfunc = L4_58.sdemo[1].aim_hashfunc
          L14_68 = wait
          L14_68(3)
          L14_68 = A0_54.sdemo
          L14_68 = L14_68.play
          L14_68(L14_68, L12_66, L13_67)
          L14_68 = A0_54.debug
          L14_68.cam = L4_58.sdemo[2].cam_name
          L14_68 = A0_54.debug
          L14_68.aim = L4_58.sdemo[2].aim_name
          L14_68 = A0_54.debug
          L14_68.cam_time = L4_58.sdemo[2].cam_time
          L14_68 = A0_54.debug
          L14_68.aim_time = L4_58.sdemo[2].aim_time
        end
      end
    else
      L11_65 = true
      L12_66 = A0_54.sdemo
      L13_67 = L12_66
      L12_66 = L12_66.stop
      L12_66(L13_67)
      if L5_59 == true then
        L12_66 = waitSeconds
        L13_67 = 0.5
        L12_66(L13_67)
        L12_66 = Fn_fadein
        L13_67 = 1
        L12_66(L13_67)
        L5_59, L6_60 = nil, nil
      end
      L12_66 = Fn_userCtrlOn
      L12_66()
      L12_66 = setstay_flag
      if L12_66 then
        L12_66 = Player
        L13_67 = L12_66
        L12_66 = L12_66.setStay
        L14_68 = false
        L12_66(L13_67, L14_68)
        setstay_flag = nil
      end
    end
    L12_66 = A0_54.current
    L12_66 = L12_66.guidance_hand
    L13_67 = L12_66
    L12_66 = L12_66.play
    L14_68 = "move"
    L12_66(L13_67, L14_68)
    L12_66 = Sound
    L13_67 = L12_66
    L12_66 = L12_66.playSE
    L14_68 = "leadinghand_guide"
    L12_66(L13_67, L14_68)
    repeat
      L12_66 = wait
      L12_66()
      L12_66 = A0_54.current
      L12_66 = L12_66.guidance_hand
      L13_67 = L12_66
      L12_66 = L12_66.isPlayEnd
      L12_66 = L12_66(L13_67)
    until L12_66
    L12_66 = A0_54.current
    L12_66 = L12_66.guidance_hand
    L13_67 = L12_66
    L12_66 = L12_66.play
    L14_68 = "stay_down"
    L12_66(L13_67, L14_68)
    L12_66 = L4_58.sdemo
    if L12_66 then
      L12_66 = L4_58.sdemo
      L12_66 = L12_66[2]
      if L12_66 then
        L12_66 = L4_58.sdemo
        L12_66 = L12_66[2]
        L12_66 = L12_66.cam_node
        if not L12_66 then
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[2]
          L12_66 = L12_66.aim_node
        elseif L12_66 then
          repeat
            L12_66 = wait
            L12_66()
            L12_66 = A0_54.sdemo
            L13_67 = L12_66
            L12_66 = L12_66.isPlay
            L12_66 = L12_66(L13_67)
          until L12_66 == false
          L12_66 = A0_54.sdemo
          L13_67 = L12_66
          L12_66 = L12_66.stop
          L14_68 = 1
          L12_66(L13_67, L14_68)
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[2]
          L12_66 = L12_66.append
          if L12_66 ~= false then
            L12_66 = A0_54.sdemo
            L13_67 = L12_66
            L12_66 = L12_66.set
            L14_68 = L4_58.sdemo
            L14_68 = L14_68[2]
            L14_68 = L14_68.cam_node
            L12_66(L13_67, L14_68, L4_58.sdemo[2].aim_node, L4_58.sdemo[2].append)
          end
        end
      end
    end
  end
  if L6_60 == false and L5_59 == true then
    L12_66 = L4_58.sdemo
    L12_66 = L12_66[3]
    L12_66 = L12_66.cam_name
    if L12_66 == nil then
      L12_66 = waitSeconds
      L13_67 = 1.5
      L12_66(L13_67)
      L12_66 = Fn_blackout
      L13_67 = 1
      L12_66(L13_67)
      L6_60 = true
    end
  end
  L12_66 = A0_54.current
  L12_66.com_second_half_prosess_event_start = true
  if not L11_65 then
    L12_66 = L4_58.sdemo
    if L12_66 then
      L12_66 = L4_58.sdemo
      L12_66 = L12_66[3]
      if L12_66 then
        L12_66 = L4_58.sdemo
        L12_66 = L12_66[3]
        L12_66 = L12_66.cam_node
        if not L12_66 then
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[3]
          L12_66 = L12_66.aim_node
        elseif L12_66 then
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[2]
          L12_66 = L12_66.cam_node
          L13_67 = L4_58.sdemo
          L13_67 = L13_67[3]
          L13_67 = L13_67.cam_node
          if L12_66 == L13_67 then
            L12_66 = L4_58.sdemo
            L12_66 = L12_66[3]
            L12_66.cam_time = 0
          end
          L12_66 = L4_58.sdemo
          L12_66 = L12_66[2]
          L12_66 = L12_66.aim_node
          L13_67 = L4_58.sdemo
          L13_67 = L13_67[3]
          L13_67 = L13_67.aim_node
          if L12_66 == L13_67 then
            L12_66 = L4_58.sdemo
            L12_66 = L12_66[3]
            L12_66.aim_time = 0
          end
          L12_66 = {L13_67, L14_68}
          L13_67 = {}
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[2]
          L14_68 = L14_68.cam_node
          L13_67.pos = L14_68
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[2]
          L14_68 = L14_68.cam_time
          L13_67.time = L14_68
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[2]
          L14_68 = L14_68.cam_hashfunc
          L13_67.hashfunc = L14_68
          L14_68 = {}
          L14_68.pos = L4_58.sdemo[3].cam_node
          L14_68.time = L4_58.sdemo[3].cam_time
          L14_68.hashfunc = L4_58.sdemo[3].cam_hashfunc
          L13_67 = {
            L14_68,
            {
              pos = L4_58.sdemo[3].aim_node,
              time = L4_58.sdemo[3].aim_time,
              hashfunc = L4_58.sdemo[3].aim_hashfunc
            }
          }
          L14_68 = {}
          L14_68.pos = L4_58.sdemo[2].aim_node
          L14_68.time = L4_58.sdemo[2].aim_time
          L14_68.hashfunc = L4_58.sdemo[2].aim_hashfunc
          L14_68 = A0_54.sdemo
          L14_68 = L14_68.play
          L14_68(L14_68, L12_66, L13_67)
          L14_68 = A0_54.debug
          L14_68.cam = L4_58.sdemo[3].cam_name
          L14_68 = A0_54.debug
          L14_68.aim = L4_58.sdemo[3].aim_name
          L14_68 = A0_54.debug
          L14_68.cam_time = L4_58.sdemo[3].cam_time
          L14_68 = A0_54.debug
          L14_68.aim_time = L4_58.sdemo[3].aim_time
          repeat
            L14_68 = wait
            L14_68()
            L14_68 = A0_54.sdemo
            L14_68 = L14_68.isPlay
            L14_68 = L14_68(L14_68)
          until L14_68 == false
          L14_68 = L4_58.sdemo
          L14_68 = L14_68[3]
          L14_68 = L14_68.append
          if L14_68 ~= false then
            L14_68 = A0_54.sdemo
            L14_68 = L14_68.set
            L14_68(L14_68, L4_58.sdemo[3].cam_node, L4_58.sdemo[3].aim_node, L4_58.sdemo[3].append)
          end
        end
      end
    end
  end
  L12_66 = A0_54.current
  L12_66.com_second_half_prosess_wait = true
  repeat
    L12_66 = wait
    L12_66()
    L12_66 = A0_54.current
    L12_66 = L12_66.user_second_half_prosess
  until L12_66
  L12_66 = A0_54.current
  L12_66 = L12_66.guide_eff_name
  if L12_66 ~= nil then
    L12_66 = A0_54.current
    L12_66 = L12_66.guide_eff_name
    if L12_66 ~= "" then
      L12_66 = string
      L12_66 = L12_66.format
      L13_67 = "lightofguide_%02d"
      L14_68 = tostring
      L14_68 = L14_68(string.sub(A0_54.current.guidance_hand:getName(), -2))
      L14_68 = L14_68 - 1
      L12_66 = L12_66(L13_67, L14_68)
      L13_67 = A0_54.current
      L14_68 = Fn_createEffect
      L14_68 = L14_68(L12_66, A0_54.current.guide_eff_name, A0_54.current.guidance_hand)
      L13_67.guide_eff = L14_68
      L13_67 = string
      L13_67 = L13_67.format
      L14_68 = "lightofguide_r_%02d"
      L13_67 = L13_67(L14_68, tostring(string.sub(A0_54.current.guidance_hand:getName(), -2)) - 1)
      L14_68 = A0_54.current
      L14_68.guide_r_eff = Fn_createEffect(L13_67, "ef_hnd_par_03", {
        obj = A0_54.current.guidance_hand:getHandPuppet(),
        joint = "loc_r_ef_point_00"
      })
      L14_68 = string
      L14_68 = L14_68.format
      L14_68 = L14_68("lightofguide_l_%02d", tostring(string.sub(A0_54.current.guidance_hand:getName(), -2)) - 1)
      A0_54.current.guide_l_eff = Fn_createEffect(L14_68, "ef_hnd_par_03", {
        obj = A0_54.current.guidance_hand:getHandPuppet(),
        joint = "loc_l_ef_point_00"
      })
      if A0_54.current.guide_eff == nil then
        A0_54.current.guide_eff_name = "not"
      end
      if A0_54.current.leadinglight_table[1] ~= nil then
        A0_54.current.leadinglight_se = Sound:playSEHandleLineStrips("leadinglight", 1, "", A0_54.current.leadinglight_table)
      end
    end
  end
  if L5_59 == true then
    L12_66 = A0_54.sdemo
    L13_67 = L12_66
    L12_66 = L12_66.stop
    L14_68 = 0
    L12_66(L13_67, L14_68)
    L12_66 = waitSeconds
    L13_67 = 0.5
    L12_66(L13_67)
    L12_66 = Fn_fadein
    L13_67 = 1
    L12_66(L13_67)
    L5_59, L6_60 = nil, nil
  else
    L12_66 = A0_54.sdemo
    L13_67 = L12_66
    L12_66 = L12_66.stop
    L12_66(L13_67)
  end
  L12_66 = L4_58.vctrl
  if L12_66 then
    L12_66 = L4_58.vctrl
    L12_66 = L12_66.node
    L13_67 = L12_66
    L12_66 = L12_66.setActive
    L14_68 = false
    L12_66(L13_67, L14_68)
  end
  if L7_61 then
    L13_67 = L7_61
    L12_66 = L7_61.setExpandedAabb
    L14_68 = false
    L12_66(L13_67, L14_68)
    if L9_63 then
      L13_67 = L7_61
      L12_66 = L7_61.setDriftEnable
      L14_68 = true
      L12_66(L13_67, L14_68)
    end
  end
  if L8_62 then
    L13_67 = L8_62
    L12_66 = L8_62.setExpandedAabb
    L14_68 = false
    L12_66(L13_67, L14_68)
    if L10_64 then
      L13_67 = L8_62
      L12_66 = L8_62.setDriftEnable
      L14_68 = true
      L12_66(L13_67, L14_68)
    end
  end
  L12_66 = A0_54.debug
  L12_66.demo_type = ""
  L12_66 = A0_54.debug
  L12_66.cam = ""
  L12_66 = A0_54.debug
  L12_66.aim = ""
  L12_66 = A0_54.debug
  L12_66.vctrl = ""
  if not L11_65 then
    L12_66 = Fn_userCtrlOn
    L12_66()
    L12_66 = setstay_flag
    if L12_66 then
      L12_66 = Player
      L13_67 = L12_66
      L12_66 = L12_66.setStay
      L14_68 = false
      L12_66(L13_67, L14_68)
      setstay_flag = nil
    end
  end
  L12_66 = A0_54.current
  L12_66.com_second_half_prosess = true
  L12_66 = A0_54.clear
  L12_66 = L12_66 + 1
  A0_54.clear = L12_66
  L12_66 = true
  return L12_66
end
function Lithograph_controller.setMissionEnable(A0_69, A1_70)
  A0_69.current.mission_enable = A1_70
end
function Lithograph_controller.missionFailure(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78
  L1_72 = A0_71.current
  L1_72 = L1_72.sensor
  L2_73 = L1_72
  L1_72 = L1_72.setActive
  L3_74 = false
  L1_72(L2_73, L3_74)
  L1_72 = Fn_captionViewEnd
  L1_72()
  L1_72 = A0_71.current
  L1_72.mission_on = false
  L1_72 = A0_71.current
  L1_72 = L1_72.demo_table
  if L1_72 ~= nil then
    L1_72 = A0_71.current
    L1_72 = L1_72.demo_table
    L1_72 = L1_72.failure
  elseif L1_72 == nil then
    L1_72 = A0_71.current
    L1_72.com_failure_prosess = true
    L1_72 = false
    return L1_72
  end
  L1_72 = Fn_getGameObject
  L2_73 = "mother2"
  L1_72 = L1_72(L2_73)
  L3_74 = L1_72
  L2_73 = L1_72.findGameObject2
  L7_78 = ggd
  L7_78 = L7_78.Savedata__EventManageFlags__CurrentMissionName
  L7_78 = L5_76(L6_77, L7_78)
  L2_73 = L2_73(L3_74, L4_75, L5_76, L6_77, L7_78, L5_76(L6_77, L7_78))
  L3_74 = {}
  L3_74.sdemo = nil
  L3_74.vctrl = nil
  if L4_75 then
    L3_74.sdemo = L4_75
    for L7_78 = 1, 1 do
      if ({
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }).cam_name then
        ;({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).cam_node = findGameObject2("Node", ({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).cam_name)
      end
      if ({
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }).aim_name then
        ;({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).aim_node = findGameObject2("Node", ({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).aim_name)
      end
      if not ({
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }).cam_node and ({
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }).cam_name then
        ;({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).cam_node = L2_73:findGameObject2("Node", ({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).cam_name)
      end
      if not ({
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }).aim_node and ({
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }).aim_name then
        ;({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).aim_node = L2_73:findGameObject2("Node", ({
          cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
          aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
          cam_node = nil,
          aim_node = nil,
          append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
        }).aim_name)
      end
      L3_74.sdemo[L7_78] = {
        cam_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].cam or nil,
        aim_name = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].aim or nil,
        cam_node = nil,
        aim_node = nil,
        append = A0_71.current.demo_table.failure["cut" .. L7_78] and A0_71.current.demo_table.failure["cut" .. L7_78].append or false
      }
    end
  elseif L4_75 then
    L4_75.name = L5_76
    L4_75.node = nil
    L7_78 = L4_75.name
    L4_75.node = L5_76
    if not L5_76 then
      L7_78 = "Node"
      L4_75.node = L5_76
    end
    L3_74.vctrl = L4_75
  end
  L1_72, L2_73 = nil, nil
  if L4_75 == true then
    repeat
      repeat
        L4_75()
      until L4_75 == false
    until L4_75 ~= L5_76
  end
  if L4_75 == true then
    L4_75()
    L4_75(L5_76, L6_77)
    setstay_flag = true
  else
    L4_75()
  end
  L4_75(L5_76)
  L7_78 = false
  if L4_75 then
    L4_75:setExpandedAabb(true)
    if L4_75:getDriftEnable() then
      L4_75:setDriftEnable(false)
    end
  end
  if L5_76 then
    L5_76:setExpandedAabb(true)
    if L5_76:getDriftEnable() then
      L5_76:setDriftEnable(false)
      L7_78 = true
    end
  end
  if L3_74.sdemo and L3_74.sdemo[1] then
    A0_71.sdemo:set(L3_74.sdemo[1].cam_node, L3_74.sdemo[1].aim_node, L3_74.sdemo[1].append)
    A0_71.sdemo:play()
    A0_71.debug.demo_type = "sdemo"
    A0_71.debug.cam = L3_74.sdemo[1].cam_name
    A0_71.debug.aim = L3_74.sdemo[1].aim_name
  elseif L3_74.vctrl then
    L3_74.vctrl.node:setActive(true)
    A0_71.debug.demo_type = "vctrl"
    A0_71.debug.vctrl = L3_74.vctrl.name
  end
  HUD:fadein(0)
  Player:setStay(true)
  setstay_flag = true
  A0_71.current.mission_on = true
  Sound:playSE("skb_005", 1, "", A0_71.current.lithograph)
  Fn_captionView("ic_litho_00110")
  A0_71.current.lithograph:offGlow()
  if A0_71.current.lithograph_glow_se ~= nil then
    Sound:stopSEHandle(A0_71.current.lithograph_glow_se)
    A0_71.current.lithograph_glow_se = nil
  end
  repeat
    wait()
  until A0_71.current.lithograph:isOffGlow()
  waitSeconds(1)
  A0_71.current.lithograph:requestBreak()
  Sound:playSE("stele_break")
  repeat
    wait()
  until A0_71.current.lithograph:isBroken()
  waitSeconds(1)
  A0_71.current.mission_on = false
  if L4_75 then
    L4_75:setExpandedAabb(false)
    if L6_77 then
      L4_75:setDriftEnable(true)
    end
  end
  if L5_76 then
    L5_76:setExpandedAabb(false)
    if L7_78 then
      L5_76:setDriftEnable(true)
    end
  end
  A0_71.current.com_failure_prosess = true
  Sound:playSE("stele_retry")
  waitSeconds(1)
  A0_71.sdemo:stop()
  if L3_74.vctrl then
    L3_74.vctrl.node:setActive(false)
  end
  return true
end
function Lithograph_controller.azSeUnload(A0_79)
  print("*** azSeUnload ***")
  for _FORV_4_, _FORV_5_ in ipairs(A0_79.list) do
    if _FORV_5_.lithograph_glow_se ~= nil then
      Sound:stopSEHandle(_FORV_5_.lithograph_glow_se)
    end
    if _FORV_5_.leadinglight_se ~= nil then
      Sound:stopSEHandle(_FORV_5_.leadinglight_se)
    end
  end
  Sound:unloadResource("anotherzone_se")
end
function Lithograph_controller.guideEffAllOff(A0_80)
  invokeTask(function()
    for _FORV_3_, _FORV_4_ in ipairs(A0_80.list) do
      if _FORV_4_.guide_eff ~= nil then
        Fn_finishedTremEffect(_FORV_4_.guide_eff, 1)
        Fn_finishedTremEffect(_FORV_4_.guide_r_eff, 1)
        Fn_finishedTremEffect(_FORV_4_.guide_l_eff, 1)
      end
      if _FORV_4_.leadinglight_se ~= nil then
        Sound:stopSEHandle(_FORV_4_.leadinglight_se)
      end
      if _FORV_4_.guidance_hand ~= nil then
        _FORV_4_.guidance_hand:play("stay_up")
      end
    end
  end)
end
function Lithograph_controller.guideEffOff(A0_81, A1_82)
  invokeTask(function()
    if A0_81.list[A1_82].guide_eff then
      Fn_finishedTremEffect(A0_81.list[A1_82].guide_eff, 1)
      Fn_finishedTremEffect(A0_81.list[A1_82].guide_r_eff, 1)
      Fn_finishedTremEffect(A0_81.list[A1_82].guide_l_eff, 1)
      if A0_81.list[A1_82].leadinglight_se ~= nil then
        Sound:stopSEHandle(A0_81.list[A1_82].leadinglight_se)
      else
        return false
      end
      if A0_81.list[A1_82].guidance_hand ~= nil then
        A0_81.list[A1_82].guidance_hand:play("stay_up")
      end
      return true
    end
    return false
  end)
end
function Lithograph_controller.terminate(A0_83)
  A0_83.sdemo:terminate()
  for _FORV_4_, _FORV_5_ in ipairs(A0_83.list) do
    if _FORV_5_.lithograph then
      _FORV_5_.lithograph:requestRestore(true)
      _FORV_5_.lithograph = nil
    end
    if _FORV_5_.sensor then
      _FORV_5_.sensor:try_term()
      _FORV_5_.sensor = nil
    end
  end
end
function Lithograph_controller._findNode(A0_84, A1_85)
  local L2_86
  L2_86 = A1_85
  if type(L2_86) == "string" then
    L2_86 = findGameObject2("Node", L2_86)
  end
  if L2_86 then
    if type(L2_86) == "table" then
      print(" [ misc lc ] pos " .. tostring(A1_85))
    else
      print(" [ misc lc ] " .. L2_86:getName() .. " : " .. L2_86:getTypeName())
    end
  end
  return L2_86
end
function Lithograph_controller._isValid(A0_87)
  local L1_88
  if A0_87 == nil then
    L1_88 = false
    return L1_88
  end
  L1_88 = true
  return L1_88
end
function Lithograph_controller._installMethods(A0_89)
  local L1_90, L2_91, L3_92, L4_93, L5_94
  for L4_93, L5_94 in L1_90(L2_91) do
    if type(L5_94) == "function" then
      A0_89[L4_93] = L5_94
    end
  end
end
function Lithograph_controller.debugDisp(A0_95, A1_96)
  A0_95.debugDisp = A1_96
end
