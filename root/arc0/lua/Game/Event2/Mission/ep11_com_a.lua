dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Misc/gm_boss.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
kEP11_A = 1
kEP11_A2 = 2
kEP11_B = 3
kEP11_C = 4
kEP11_D = 5
_GEM = {
  SMALL = 1,
  MIDDLE = 2,
  LARGE = 3,
  ENERGY = 4,
  VITAL = 5,
  SPECIAL = 6
}
_area_ctrls = {}
_npcs = {}
_crow_puppet = nil
_crow_brain = nil
_enmgen_hdl = {}
_mission_part_num = kEP11_A
_gm = nil
_gm_enmgen_name_list = {
  f = {
    "enmgen2_core_a_f_03",
    "enmgen2_core_b_f_03",
    "enmgen2_core_b_f_02",
    "enmgen2_core_a_f_01",
    "enmgen2_core_b_f_01"
  },
  l = {
    "enmgen2_core_a_l_04",
    "enmgen2_core_b_l_04",
    "enmgen2_core_a_l_03",
    "enmgen2_core_b_l_02",
    "enmgen2_core_a_l_01"
  },
  r = {
    "enmgen2_core_a_r_04",
    "enmgen2_core_b_r_04",
    "enmgen2_core_b_r_03",
    "enmgen2_core_a_r_02",
    "enmgen2_core_b_r_02"
  },
  b = {
    "enmgen2_gm_bodyarea_01"
  }
}
_gm_enmgen_handle_list = {
  f = {},
  r = {},
  l = {},
  b = {}
}
_gm_enemy_name_list = {}
_gm_request = nil
_gm_option = nil
_gm_request_avairable = false
_gmScream = nil
_rumbleSE = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = Area
  L1_1 = L0_0
  L0_0 = L0_0.setForceSceneParams
  L0_0(L1_1, "gm_b_root")
  L0_0 = Fn_warshipWarpRequest
  L1_1 = findGameObject2
  L1_1 = L1_1("Node", "locator2_ar_a_root_pos")
  L0_0(L1_1, L1_1("Node", "locator2_ar_a_root_pos"))
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  L1_1 = print
  L1_1(L0_0)
  if L0_0 == "ep11_a2" then
    L1_1 = kEP11_A2
    _mission_part_num = L1_1
  elseif L0_0 == "ep11_b" then
    L1_1 = kEP11_B
    _mission_part_num = L1_1
  elseif L0_0 == "ep11_c" then
    L1_1 = kEP11_C
    _mission_part_num = L1_1
  elseif L0_0 == "ep11_d" then
    L1_1 = kEP11_D
    _mission_part_num = L1_1
  end
  L1_1 = {
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_cid01_01",
      active = _mission_part_num > kEP11_A2 and true or false
    },
    {
      name = "sis01",
      type = "sis01",
      node = "locator2_sis01_01",
      active = _mission_part_num > kEP11_A2 and true or false
    },
    {
      name = "chi16",
      type = "chi16",
      node = "locator2_chi16_01",
      active = false
    },
    {
      name = "wom27",
      type = "wom27",
      node = "locator2_wom27_01",
      active = false
    },
    {
      name = "man45",
      type = "man45",
      node = "locator2_man45_01",
      active = false
    },
    {
      name = "wom25",
      type = "wom25",
      node = "locator2_wom25_01",
      active = false
    },
    {
      name = "man40",
      type = "man40",
      node = "locator2_man40_01",
      active = false
    }
  }
  _npcs = Fn_setupNpc(L1_1)
  setGemActive(false, "energy_a", 1, 2)
  setGemActive(false, "energy_a2", 1, 5)
  setGemActive(false, "vital_b", 1, 5)
  _gm_request_avairable = false
  _gm = GmBoss.create("locator2_boss_start_" .. L0_0, "ep11_gm_b_root")
  _crow_puppet = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground, "locator2_crow_start_" .. L0_0, false)
  _crow_brain = _crow_puppet:getBrain()
  _crow_brain:setIdling(true)
  while _crow_brain:isIdling() do
    wait()
  end
  findGmEnemy()
  _enmgen_hdl.enmgen2_01 = {
    hdl = findGameObject2("EnemyGenerator", "enmgen2_01"),
    active = false
  }
  _enmgen_hdl.enmgen2_02 = {
    hdl = findGameObject2("EnemyGenerator", "enmgen2_02"),
    active = false
  }
  _enmgen_hdl.enmgen2_gm_f_01 = {
    hdl = findGameObject2("EnemyGenerator", "enmgen2_gm_f_01"),
    active = false
  }
  _enmgen_hdl.enmgen2_gm_r_01 = {
    hdl = findGameObject2("EnemyGenerator", "enmgen2_gm_r_01"),
    active = false
  }
  _enmgen_hdl.enmgen2_gm_l_01 = {
    hdl = findGameObject2("EnemyGenerator", "enmgen2_gm_l_01"),
    active = false
  }
  if _mission_part_num < kEP11_D then
    Fn_setAreaWarp("ve_lo_a", "locator2_ve_lo_a")
  end
  if _mission_part_num >= kEP11_B then
    Fn_findAreaHandle("up_a_02_01"):setEffectiveness(false)
    Fn_findAreaHandle("up_a_02_01"):setAreaGroup(nil)
  end
  if _mission_part_num >= kEP11_C then
    setBomActive(false)
    setBridgeActive(false)
  end
  if _mission_part_num < kEP11_B then
    Fn_findAreaHandle("ve_lo_a"):setEffectiveness(false)
    Fn_findAreaHandle("ve_lo_a"):setAreaGroup(nil)
    setBomActive(false)
    setArmSensorActive(false)
  end
  if _mission_part_num >= kEP11_D then
    setGmGrabObject()
    Fn_findAreaHandle("ve_lo_a"):setEffectiveness(false)
    Fn_findAreaHandle("ve_lo_a"):setAreaGroup(nil)
    Fn_findAreaHandle("up_a_12b"):setEffectiveness(false)
    Fn_findAreaHandle("up_a_12b"):setAreaGroup(nil)
    Fn_findAreaHandle("up_a_11"):setEffectiveness(false)
    Fn_findAreaHandle("up_a_11"):setAreaGroup(nil)
  end
end
function Ingame()
  local L0_2, L1_3
  L0_2 = {}
  L0_2.man01_groggy_00 = "man01_groggy_00"
  L0_2.man01_groggy_01 = "man01_groggy_01"
  _npcMotions1 = L0_2
  L0_2 = {}
  L0_2.wom01_groggy_00 = "wom01_groggy_00"
  L0_2.wom01_groggy_01 = "wom01_groggy_01"
  _npcMotions2 = L0_2
  L0_2 = Fn_loadNpcEventMotion
  L1_3 = _npcs
  L1_3 = L1_3.man45
  L0_2(L1_3, _npcMotions1)
  L0_2 = Fn_loadNpcEventMotion
  L1_3 = _npcs
  L1_3 = L1_3.wom25
  L0_2(L1_3, _npcMotions2)
  L0_2 = Fn_loadNpcEventMotion
  L1_3 = _npcs
  L1_3 = L1_3.man40
  L0_2(L1_3, _npcMotions1)
  L0_2 = Camera
  L1_3 = L0_2
  L0_2 = L0_2.stopShake
  L0_2(L1_3, 0)
  L0_2 = Fn_getMissionPart
  L0_2 = L0_2()
  L1_3 = findGameObject2
  L1_3 = L1_3("Node", "locator2_crow_start_" .. L0_2)
  _crow_brain:warpToNode(L1_3, Supporter.FirstAction.Ground)
  setGmEnemyMaker(false)
  if _mission_part_num <= kEP11_A2 then
    Player:setSituation(Player.kSituation_Normal, true, 0, false, false)
  end
  if _mission_part_num == kEP11_B then
    setNpcMotion()
  end
  if _mission_part_num < kEP11_D then
    requestIdlingGmEnemy(true)
    setEnableHomingTargetGmEnemy(false)
  else
    setEnableHomingTargetGmEnemy(true)
  end
  if _mission_part_num <= kEP11_A2 or _mission_part_num == kEP11_C then
    _gm:setDispFlag("f", false)
  else
  end
  if _mission_part_num == kEP11_D then
    setGmEnemyMaker(true)
    if GameDatabase:get(ggd.EventFlags__ep11__flag01) >= 1 then
      print("\228\184\173\229\164\174\227\129\174\232\133\149\227\129\175\231\160\180\229\163\138\230\184\136")
      _gm:setDispFlag("f", false)
    else
    end
    if 1 <= GameDatabase:get(ggd.EventFlags__ep11__flag02) then
      print("\229\143\179\227\129\174\232\133\149\227\129\175\231\160\180\229\163\138\230\184\136")
      _gm:setDispFlag("r", false)
    else
    end
    if 1 <= GameDatabase:get(ggd.EventFlags__ep11__flag03) then
      print("\229\183\166\227\129\174\232\133\149\227\129\175\231\160\180\229\163\138\230\184\136")
      _gm:setDispFlag("l", false)
    end
  else
  end
  if not getArmState().f then
    reSpawnArmEnemy("f")
  end
  if not getArmState().r then
    reSpawnArmEnemy("r")
  end
  if not getArmState().l then
    reSpawnArmEnemy("l")
  end
  _gm:run()
  _rumbleSE = Sound:playSEHandle("ep11_rumble", 1)
  if _mission_part_num == kEP11_D then
    setGemActive(true, "vital", 6, 10)
  else
    setGemActive(false, "vital", 6, 10)
  end
  waitSeconds(1)
  if _mission_part_num < kEP11_D then
    _gm:setMotionSpeedManager(false)
  else
    _gm:setMotionSpeedManager(true)
  end
  _gm:setMotionSpeed("f", 0.3)
  _gm:setMotionSpeed("r", 0.3)
  _gm:setMotionSpeed("l", 0.3)
  _gm:setMotionSpeed("b", 0.3)
  _gm:playMotionAll("stay")
  invokeTask(function()
    local L0_4, L1_5, L2_6
    while true do
      L0_4 = Fn_getMissionPart
      L0_4 = L0_4()
      L1_5 = _gm_request
      if L1_5 then
        L1_5 = _gm_request
        if L1_5 == "move" then
          L1_5 = print
          L2_6 = "\228\186\161\233\156\138\233\131\189\229\184\130:\231\167\187\229\139\149"
          L1_5(L2_6)
          L1_5 = findGameObject2
          L2_6 = "Node"
          L1_5 = L1_5(L2_6, _gm_option)
          L2_6 = L1_5
          L1_5 = L1_5.getWorldTransform
          L2_6 = L1_5(L2_6)
          _gm_move_task = invokeTask(function()
            _gm:move(L1_5, L2_6, 600)
          end)
          break
        else
          L1_5 = _gm_request
          if L1_5 == "abort" then
            L1_5 = print
            L2_6 = "\228\186\161\233\156\138\233\131\189\229\184\130:\231\167\187\229\139\149\228\184\173\230\150\173"
            L1_5(L2_6)
            L1_5 = _gm_move_task
            if L1_5 ~= nil then
              L1_5 = _gm_move_task
              L2_6 = L1_5
              L1_5 = L1_5.abort
              L1_5(L2_6)
            end
          else
            L1_5 = _gm_request
            if L1_5 == "absorptionStandby" then
              L1_5 = print
              L2_6 = "\229\144\184\227\129\132\232\190\188\227\129\191\231\148\168\230\132\143"
              L1_5(L2_6)
              L1_5 = _gm
              L2_6 = L1_5
              L1_5 = L1_5.absorptionEffStandby
              L1_5(L2_6)
              L1_5 = _gm
              L2_6 = L1_5
              L1_5 = L1_5.absorptionEffPlay
              L1_5(L2_6)
              if L0_4 == "ep11_a2" then
                L1_5 = _gm
                L2_6 = L1_5
                L1_5 = L1_5.absorptionPlayerEffectStandby
                L1_5(L2_6)
                L1_5 = _gm
                L2_6 = L1_5
                L1_5 = L1_5.absorptionPlayerEffectPlay
                L1_5(L2_6)
              end
              if L0_4 == "ep11_d" then
                L1_5 = _gm
                L2_6 = L1_5
                L1_5 = L1_5.absorptionPlayerEffectStandby
                L1_5(L2_6)
                L1_5 = _gm
                L2_6 = L1_5
                L1_5 = L1_5.absorptionPlayerEffectPlay
                L1_5(L2_6)
                L1_5 = crowCaption
                L2_6 = "absorptionBegin"
                L1_5(L2_6)
              end
            else
              L1_5 = _gm_request
              if L1_5 == "absorption" then
                L1_5 = print
                L2_6 = "\227\129\138\227\129\152\227\129\149\227\130\147\227\129\174\229\179\182\229\144\184\227\129\132\232\190\188\227\129\191\233\150\139\229\167\139"
                L1_5(L2_6)
                L1_5 = _gm
                L2_6 = L1_5
                L1_5 = L1_5.absorption
                L1_5(L2_6)
              else
                L1_5 = _gm_request
                if L1_5 == "absorption2" then
                  L1_5 = print
                  L2_6 = "\229\134\134\229\189\162\229\138\135\229\160\180\229\144\184\227\129\132\232\190\188\227\129\191\233\150\139\229\167\139"
                  L1_5(L2_6)
                  L1_5 = _gm
                  L2_6 = L1_5
                  L1_5 = L1_5.absorption2
                  L1_5(L2_6)
                else
                  L1_5 = _gm_request
                  if L1_5 == "absorption3" then
                    L1_5 = print
                    L2_6 = "\229\144\184\227\129\132\232\190\188\227\129\191\230\148\187\230\146\131\233\150\139\229\167\139"
                    L1_5(L2_6)
                    L1_5 = _gm
                    L2_6 = L1_5
                    L1_5 = L1_5.absorption3
                    L1_5(L2_6)
                  else
                    L1_5 = _gm_request
                    if L1_5 == "absorptionStop" then
                      L1_5 = print
                      L2_6 = "\229\144\184\227\129\132\232\190\188\227\129\191\231\181\130\228\186\134"
                      L1_5(L2_6)
                      L1_5 = _gm
                      L2_6 = L1_5
                      L1_5 = L1_5.absorptionEffStop
                      L1_5(L2_6)
                      if L0_4 == "ep11_a2" then
                        L1_5 = _gm
                        L2_6 = L1_5
                        L1_5 = L1_5.absorptionPlayerEffectStop
                        L1_5(L2_6)
                      end
                      if L0_4 == "ep11_d" then
                        L1_5 = _gm
                        L2_6 = L1_5
                        L1_5 = L1_5.absorptionPlayerEffectStop
                        L1_5(L2_6)
                        L1_5 = crowCaption
                        L2_6 = "absorptionEnd"
                        L1_5(L2_6)
                      end
                    else
                      L1_5 = _gm_request
                      if L1_5 == "appearanceArm" then
                        L1_5 = print
                        L2_6 = "\232\133\149\227\130\146\231\148\159\227\130\132\227\129\153"
                        L1_5(L2_6)
                        L1_5 = _gm
                        L2_6 = L1_5
                        L1_5 = L1_5.appearanceArm
                        L1_5(L2_6, _gm_option, "ep11_ghost_recovery")
                        L1_5 = print
                        L2_6 = "\232\133\149\227\130\146\231\148\159\227\130\132\227\129\151\227\129\159\227\130\137\227\131\141\227\131\180\227\130\163\227\129\140\229\146\178\227\129\143"
                        L1_5(L2_6)
                        L1_5 = reSpawnArmEnemy
                        L2_6 = _gm_option
                        L1_5(L2_6)
                      else
                        L1_5 = _gm_request
                        if L1_5 == "brokenArm" then
                          L1_5 = print
                          L2_6 = "\232\133\149\227\130\146\229\163\138\227\129\153"
                          L1_5(L2_6)
                          L1_5 = _gm
                          L2_6 = L1_5
                          L1_5 = L1_5.brokenArm
                          L1_5(L2_6, _gm_option, "ep11_ghost_scream")
                        else
                          L1_5 = _gm_request
                          if L1_5 == "attackR" then
                            L1_5 = print
                            L2_6 = "\229\143\179\232\133\149\227\129\174\230\148\187\230\146\131"
                            L1_5(L2_6)
                            L1_5 = _gm
                            L2_6 = L1_5
                            L1_5 = L1_5.attackArm
                            L1_5(L2_6, "r")
                            if L0_4 == "ep11_d" then
                              L1_5 = crowCaption
                              L2_6 = "attack"
                              L1_5(L2_6)
                            end
                          else
                            L1_5 = _gm_request
                            if L1_5 == "attackL" then
                              L1_5 = print
                              L2_6 = "\229\183\166\232\133\149\227\129\174\230\148\187\230\146\131"
                              L1_5(L2_6)
                              L1_5 = _gm
                              L2_6 = L1_5
                              L1_5 = L1_5.attackArm
                              L1_5(L2_6, "l")
                              if L0_4 == "ep11_d" then
                                L1_5 = crowCaption
                                L2_6 = "attack"
                                L1_5(L2_6)
                              end
                            else
                              L1_5 = _gm_request
                              if L1_5 == "attackF" then
                                L1_5 = print
                                L2_6 = "\228\184\173\229\164\174\232\133\149\227\129\174\230\148\187\230\146\131"
                                L1_5(L2_6)
                                L1_5 = RandI
                                L2_6 = 1
                                L1_5 = L1_5(L2_6, 2)
                                if L1_5 == 1 then
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.attackArm
                                  L1_5(L2_6, "r")
                                else
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.attackArm
                                  L1_5(L2_6, "l")
                                end
                                if L0_4 == "ep11_d" then
                                  L1_5 = crowCaption
                                  L2_6 = "attack"
                                  L1_5(L2_6)
                                end
                              else
                                L1_5 = _gm_request
                                if L1_5 == "attackBreak" then
                                  L1_5 = print
                                  L2_6 = "\229\179\182\227\130\146\229\143\169\227\129\143"
                                  L1_5(L2_6)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "f", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "r", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "l", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "b", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.playMotion
                                  L1_5(L2_6, "l", "attack_break_00", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.playMotion
                                  L1_5(L2_6, "r", "attack_break_00", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.playMotion
                                  L1_5(L2_6, "b", "attack_break_00", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.playSE
                                  L1_5(L2_6, "r", "ene_gc_arm_whoosh", 1)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.playSE
                                  L1_5(L2_6, "l", "ene_gc_arm_whoosh", 1)
                                  repeat
                                    L1_5 = wait
                                    L1_5()
                                    L1_5 = _gm
                                    L2_6 = L1_5
                                    L1_5 = L1_5.isMotionEnd
                                    L1_5 = L1_5(L2_6, "r")
                                  until L1_5
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "f", 0.3)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "r", 0.3)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "l", 0.3)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.setMotionSpeed
                                  L1_5(L2_6, "b", 0.3)
                                  L1_5 = _gm
                                  L2_6 = L1_5
                                  L1_5 = L1_5.playMotionAll
                                  L1_5(L2_6, "stay")
                                else
                                  L1_5 = _gm_request
                                  if L1_5 == "stay" then
                                    L1_5 = print
                                    L2_6 = "\233\128\154\229\184\184"
                                    L1_5(L2_6)
                                    repeat
                                      L1_5 = wait
                                      L1_5()
                                      L1_5 = _gm
                                      L2_6 = L1_5
                                      L1_5 = L1_5.isMotionEnd
                                      L1_5 = L1_5(L2_6, "r")
                                    until L1_5
                                    L1_5 = _gm
                                    L2_6 = L1_5
                                    L1_5 = L1_5.setMotionSpeed
                                    L1_5(L2_6, "f", 0.3)
                                    L1_5 = _gm
                                    L2_6 = L1_5
                                    L1_5 = L1_5.setMotionSpeed
                                    L1_5(L2_6, "r", 0.3)
                                    L1_5 = _gm
                                    L2_6 = L1_5
                                    L1_5 = L1_5.setMotionSpeed
                                    L1_5(L2_6, "l", 0.3)
                                    L1_5 = _gm
                                    L2_6 = L1_5
                                    L1_5 = L1_5.setMotionSpeed
                                    L1_5(L2_6, "b", 0.3)
                                    L1_5 = _gm
                                    L2_6 = L1_5
                                    L1_5 = L1_5.playMotionAll
                                    L1_5(L2_6, "stay")
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
        _gm_request = nil
      end
      L1_5 = wait
      L1_5()
    end
  end)
  _gm_request_avairable = true
end
function Finalize()
  if Fn_getPlayer() then
    Player:setSituation(Player.kSituation_Normal, true, 3, false, false)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  stopRumbleSE()
  Area:setForceSceneParams("")
  if not Fn_getPlayer() then
    return
  end
  if Player:isEnableCheckInWall() == true then
    Player:setEnableCheckInWall(false)
    print("\227\130\168\227\131\158\227\131\188\227\130\184\227\130\167\227\131\179\227\130\183\227\131\188\230\169\159\232\131\189\227\130\146\229\174\140\229\133\168\227\129\171\231\181\130\228\186\134\227\129\151\227\129\190\227\129\153")
  end
end
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      locator = "locator_01",
      name = "enm01_01",
      type = "imp"
    },
    {
      locator = "locator_02",
      name = "enm01_02",
      type = "imp"
    },
    {
      locator = "locator_03",
      name = "enm01_03",
      type = "jammer"
    },
    {
      locator = "locator_04",
      name = "enm01_04",
      type = "imp"
    },
    {
      locator = "locator_05",
      name = "enm01_05",
      type = "gellyfish"
    },
    {
      locator = "locator_06",
      name = "enm01_06",
      type = "imp"
    },
    {
      locator = "locator_07",
      name = "enm01_07",
      type = "jammer"
    },
    {
      locator = "locator_08",
      name = "enm01_08",
      type = "treecannon"
    },
    {
      locator = "locator_09",
      name = "enm01_09",
      type = "treecannon"
    },
    {
      locator = "locator_10",
      name = "enm01_10",
      type = "jammer"
    },
    {
      locator = "locator_11",
      name = "enm01_11",
      type = "jammer"
    },
    {
      locator = "locator_12",
      name = "enm01_12",
      type = "gellyfish"
    },
    {
      locator = "locator_13",
      name = "enm01_13",
      type = "gellyfish"
    },
    {
      locator = "locator_14",
      name = "enm01_14",
      type = "gellyfish"
    },
    {
      locator = "locator_15",
      name = "enm01_15",
      type = "gellyfish"
    },
    {
      locator = "locator_16",
      name = "enm01_16",
      type = "lunafishowner",
      ai_spawn_option = "LunaFishOwner/owner_num08"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_16",
      name = "fish_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_7)
    local L1_8
  end,
  onEnter = function(A0_9)
    local L1_10
  end,
  onLeave = function(A0_11)
    local L1_12
  end,
  onSpawn = function(A0_13, A1_14)
    if A1_14:getName() == "fish_01" or A1_14:getName() == "enm01_16" then
      A1_14:setScriptAttackTarget(Fn_getPlayer())
    end
    A0_13:getSpecTable().totalEnemyCount = A0_13:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_15, A1_16)
    A0_15:getSpecTable().totalAshCount = A0_15:getSpecTable().totalAshCount + 1
  end,
  onObjectDead = function(A0_17, A1_18)
    A0_17:getSpecTable().totalDeadCount = A0_17:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      locator = "locator_01",
      name = "enm02_01",
      type = "imp"
    },
    {
      locator = "locator_02",
      name = "enm02_02",
      type = "imp"
    },
    {
      locator = "locator_03",
      name = "enm02_03",
      type = "imp"
    },
    {
      locator = "locator_04",
      name = "enm02_04",
      type = "gellyfish"
    },
    {
      locator = "locator_05",
      name = "enm02_05",
      type = "jammer"
    },
    {
      locator = "locator_06",
      name = "enm02_06",
      type = "gellyfish"
    },
    {
      locator = "locator_07",
      name = "enm02_07",
      type = "stalker"
    },
    {
      locator = "locator_08",
      name = "enm02_08",
      type = "stalker"
    },
    {
      locator = "locator_09",
      name = "enm02_09",
      type = "stalker"
    },
    {
      locator = "locator_10",
      name = "enm02_10",
      type = "stalker"
    },
    {
      locator = "locator_11",
      name = "enm02_11",
      type = "gellyfish"
    },
    {
      locator = "locator_12",
      name = "enm02_12",
      type = "gellyfish"
    },
    {
      locator = "locator_13",
      name = "enm02_13",
      type = "gellyfish"
    },
    {
      locator = "locator_14",
      name = "enm02_14",
      type = "jammer"
    },
    {
      locator = "locator_15",
      name = "enm02_15",
      type = "gellyfish"
    },
    {
      locator = "locator_16",
      name = "enm02_16",
      type = "lunafishowner",
      ai_spawn_option = "LunaFishOwner/owner_num08"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_16",
      name = "fish_02"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_19)
    local L1_20
  end,
  onEnter = function(A0_21)
    local L1_22
  end,
  onLeave = function(A0_23)
    local L1_24
  end,
  onSpawn = function(A0_25, A1_26)
    if A1_26:getName() == "fish_02" or A1_26:getName() == "enm02_16" then
      A1_26:setScriptAttackTarget(Fn_getPlayer())
    end
    A0_25:getSpecTable().totalEnemyCount = A0_25:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_27, A1_28)
    A0_27:getSpecTable().totalAshCount = A0_27:getSpecTable().totalAshCount + 1
  end,
  onObjectDead = function(A0_29, A1_30)
    A0_29:getSpecTable().totalDeadCount = A0_29:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_f_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_b_f_03"
    }
  },
  puppets = {},
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_31)
    local L1_32
  end,
  onEnter = function(A0_33)
    local L1_34
  end,
  onLeave = function(A0_35)
    local L1_36
  end,
  onSpawn = function(A0_37, A1_38)
    table.insert(A0_37:getSpecTable().puppets, A1_38:getGizmo())
    A0_37:getSpecTable().totalEnemyCount = A0_37:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_39, A1_40)
    A0_39:getSpecTable().totalAshCount = A0_39:getSpecTable().totalAshCount + 1
    if _gm:setHp("f", _gm:getHp("f") - 1) then
      popGemForCore(A1_40:getGizmo())
      requestGmAction("attackF")
    end
  end,
  onObjectDead = function(A0_41, A1_42)
    A0_41:getSpecTable().totalDeadCount = A0_41:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_f_03 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core",
      locator = "locator_01",
      name = "core_a_f_03"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_43)
    local L1_44
  end,
  onEnter = function(A0_45)
    local L1_46
  end,
  onLeave = function(A0_47)
    local L1_48
  end,
  onSpawn = function(A0_49, A1_50)
    table.insert(A0_49:getSpecTable().puppets, A1_50:getGizmo())
    A0_49:getSpecTable().totalEnemyCount = A0_49:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_51, A1_52)
    A0_51:getSpecTable().totalAshCount = A0_51:getSpecTable().totalAshCount + 1
    if _gm:setHp("f", _gm:getHp("f") - 1) then
      popGemForCore(A1_52:getGizmo())
      requestGmAction("attackF")
    end
  end,
  onObjectDead = function(A0_53, A1_54)
    A0_53:getSpecTable().totalDeadCount = A0_53:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_f_02 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_b_f_02"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_55)
    local L1_56
  end,
  onEnter = function(A0_57)
    local L1_58
  end,
  onLeave = function(A0_59)
    local L1_60
  end,
  onSpawn = function(A0_61, A1_62)
    table.insert(A0_61:getSpecTable().puppets, A1_62:getGizmo())
    A0_61:getSpecTable().totalEnemyCount = A0_61:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_63, A1_64)
    A0_63:getSpecTable().totalAshCount = A0_63:getSpecTable().totalAshCount + 1
    if _gm:setHp("f", _gm:getHp("f") - 1) then
      popGemForCore(A1_64:getGizmo())
      requestGmAction("attackF")
    end
  end,
  onObjectDead = function(A0_65, A1_66)
    A0_65:getSpecTable().totalDeadCount = A0_65:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_f_01 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core",
      locator = "locator_01",
      name = "core_a_f_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_67)
    local L1_68
  end,
  onEnter = function(A0_69)
    local L1_70
  end,
  onLeave = function(A0_71)
    local L1_72
  end,
  onSpawn = function(A0_73, A1_74)
    table.insert(A0_73:getSpecTable().puppets, A1_74:getGizmo())
    A0_73:getSpecTable().totalEnemyCount = A0_73:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_75, A1_76)
    A0_75:getSpecTable().totalAshCount = A0_75:getSpecTable().totalAshCount + 1
    if _gm:setHp("f", _gm:getHp("f") - 1) then
      popGemForCore(A1_76:getGizmo())
      requestGmAction("attackF")
    end
  end,
  onObjectDead = function(A0_77, A1_78)
    A0_77:getSpecTable().totalDeadCount = A0_77:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_f_01 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_b_f_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_79)
    local L1_80
  end,
  onEnter = function(A0_81)
    local L1_82
  end,
  onLeave = function(A0_83)
    local L1_84
  end,
  onSpawn = function(A0_85, A1_86)
    table.insert(A0_85:getSpecTable().puppets, A1_86:getGizmo())
    A0_85:getSpecTable().totalEnemyCount = A0_85:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_87, A1_88)
    A0_87:getSpecTable().totalAshCount = A0_87:getSpecTable().totalAshCount + 1
    if _gm:setHp("f", _gm:getHp("f") - 1) then
      popGemForCore(A1_88:getGizmo())
      requestGmAction("attackF")
    end
  end,
  onObjectDead = function(A0_89, A1_90)
    A0_89:getSpecTable().totalDeadCount = A0_89:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_l_04 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core",
      locator = "locator_01",
      name = "core_b_l_04"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_91)
    local L1_92
  end,
  onEnter = function(A0_93)
    local L1_94
  end,
  onLeave = function(A0_95)
    local L1_96
  end,
  onSpawn = function(A0_97, A1_98)
    table.insert(A0_97:getSpecTable().puppets, A1_98:getGizmo())
    A0_97:getSpecTable().totalEnemyCount = A0_97:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_99, A1_100)
    A0_99:getSpecTable().totalAshCount = A0_99:getSpecTable().totalAshCount + 1
    if _gm:setHp("l", _gm:getHp("l") - 1) then
      popGemForCore(A1_100:getGizmo())
      requestGmAction("attackL")
    end
  end,
  onObjectDead = function(A0_101, A1_102)
    A0_101:getSpecTable().totalDeadCount = A0_101:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_l_04 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_a_l_04"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_103)
    local L1_104
  end,
  onEnter = function(A0_105)
    local L1_106
  end,
  onLeave = function(A0_107)
    local L1_108
  end,
  onSpawn = function(A0_109, A1_110)
    table.insert(A0_109:getSpecTable().puppets, A1_110:getGizmo())
    A0_109:getSpecTable().totalEnemyCount = A0_109:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_111, A1_112)
    A0_111:getSpecTable().totalAshCount = A0_111:getSpecTable().totalAshCount + 1
    if _gm:setHp("l", _gm:getHp("l") - 1) then
      popGemForCore(A1_112:getGizmo())
      requestGmAction("attackL")
    end
  end,
  onObjectDead = function(A0_113, A1_114)
    A0_113:getSpecTable().totalDeadCount = A0_113:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_l_03 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_a_l_03"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_115)
    local L1_116
  end,
  onEnter = function(A0_117)
    local L1_118
  end,
  onLeave = function(A0_119)
    local L1_120
  end,
  onSpawn = function(A0_121, A1_122)
    table.insert(A0_121:getSpecTable().puppets, A1_122:getGizmo())
    A0_121:getSpecTable().totalEnemyCount = A0_121:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_123, A1_124)
    A0_123:getSpecTable().totalAshCount = A0_123:getSpecTable().totalAshCount + 1
    if _gm:setHp("l", _gm:getHp("l") - 1) then
      popGemForCore(A1_124:getGizmo())
      requestGmAction("attackL")
    end
  end,
  onObjectDead = function(A0_125, A1_126)
    A0_125:getSpecTable().totalDeadCount = A0_125:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_l_02 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core",
      locator = "locator_01",
      name = "core_b_l_02"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_127)
    local L1_128
  end,
  onEnter = function(A0_129)
    local L1_130
  end,
  onLeave = function(A0_131)
    local L1_132
  end,
  onSpawn = function(A0_133, A1_134)
    table.insert(A0_133:getSpecTable().puppets, A1_134:getGizmo())
    A0_133:getSpecTable().totalEnemyCount = A0_133:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_135, A1_136)
    A0_135:getSpecTable().totalAshCount = A0_135:getSpecTable().totalAshCount + 1
    if _gm:setHp("l", _gm:getHp("l") - 1) then
      popGemForCore(A1_136:getGizmo())
      requestGmAction("attackL")
    end
  end,
  onObjectDead = function(A0_137, A1_138)
    A0_137:getSpecTable().totalDeadCount = A0_137:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_l_01 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_a_l_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_139)
    local L1_140
  end,
  onEnter = function(A0_141)
    local L1_142
  end,
  onLeave = function(A0_143)
    local L1_144
  end,
  onSpawn = function(A0_145, A1_146)
    table.insert(A0_145:getSpecTable().puppets, A1_146:getGizmo())
    A0_145:getSpecTable().totalEnemyCount = A0_145:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_147, A1_148)
    A0_147:getSpecTable().totalAshCount = A0_147:getSpecTable().totalAshCount + 1
    if _gm:setHp("l", _gm:getHp("l") - 1) then
      popGemForCore(A1_148:getGizmo())
      requestGmAction("attackL")
    end
  end,
  onObjectDead = function(A0_149, A1_150)
    A0_149:getSpecTable().totalDeadCount = A0_149:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_r_04 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core",
      locator = "locator_01",
      name = "core_a_r_04"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_151)
    local L1_152
  end,
  onEnter = function(A0_153)
    local L1_154
  end,
  onLeave = function(A0_155)
    local L1_156
  end,
  onSpawn = function(A0_157, A1_158)
    table.insert(A0_157:getSpecTable().puppets, A1_158:getGizmo())
    A0_157:getSpecTable().totalEnemyCount = A0_157:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_159, A1_160)
    A0_159:getSpecTable().totalAshCount = A0_159:getSpecTable().totalAshCount + 1
    if _gm:setHp("r", _gm:getHp("r") - 1) then
      popGemForCore(A1_160:getGizmo())
      requestGmAction("attackR")
    end
  end,
  onObjectDead = function(A0_161, A1_162)
    A0_161:getSpecTable().totalDeadCount = A0_161:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_r_04 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_b_r_04"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_163)
    local L1_164
  end,
  onEnter = function(A0_165)
    local L1_166
  end,
  onLeave = function(A0_167)
    local L1_168
  end,
  onSpawn = function(A0_169, A1_170)
    table.insert(A0_169:getSpecTable().puppets, A1_170:getGizmo())
    A0_169:getSpecTable().totalEnemyCount = A0_169:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_171, A1_172)
    A0_171:getSpecTable().totalAshCount = A0_171:getSpecTable().totalAshCount + 1
    if _gm:setHp("r", _gm:getHp("r") - 1) then
      popGemForCore(A1_172:getGizmo())
      requestGmAction("attackR")
    end
  end,
  onObjectDead = function(A0_173, A1_174)
    A0_173:getSpecTable().totalDeadCount = A0_173:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_r_03 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_b_r_03"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_175)
    local L1_176
  end,
  onEnter = function(A0_177)
    local L1_178
  end,
  onLeave = function(A0_179)
    local L1_180
  end,
  onSpawn = function(A0_181, A1_182)
    table.insert(A0_181:getSpecTable().puppets, A1_182:getGizmo())
    A0_181:getSpecTable().totalEnemyCount = A0_181:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_183, A1_184)
    A0_183:getSpecTable().totalAshCount = A0_183:getSpecTable().totalAshCount + 1
    if _gm:setHp("r", _gm:getHp("r") - 1) then
      popGemForCore(A1_184:getGizmo())
      requestGmAction("attackR")
    end
  end,
  onObjectDead = function(A0_185, A1_186)
    A0_185:getSpecTable().totalDeadCount = A0_185:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_b_r_02 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core_s",
      locator = "locator_01",
      name = "core_b_r_02"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_187)
    local L1_188
  end,
  onEnter = function(A0_189)
    local L1_190
  end,
  onLeave = function(A0_191)
    local L1_192
  end,
  onSpawn = function(A0_193, A1_194)
    table.insert(A0_193:getSpecTable().puppets, A1_194:getGizmo())
    A0_193:getSpecTable().totalEnemyCount = A0_193:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_195, A1_196)
    A0_195:getSpecTable().totalAshCount = A0_195:getSpecTable().totalAshCount + 1
    if _gm:setHp("r", _gm:getHp("r") - 1) then
      popGemForCore(A1_196:getGizmo())
      requestGmAction("attackR")
    end
  end,
  onObjectDead = function(A0_197, A1_198)
    A0_197:getSpecTable().totalDeadCount = A0_197:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_core_a_r_02 = {
  puppets = {},
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "ghostcity_core",
      locator = "locator_01",
      name = "core_a_r_02"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_199)
    local L1_200
  end,
  onEnter = function(A0_201)
    local L1_202
  end,
  onLeave = function(A0_203)
    local L1_204
  end,
  onSpawn = function(A0_205, A1_206)
    table.insert(A0_205:getSpecTable().puppets, A1_206:getGizmo())
    A0_205:getSpecTable().totalEnemyCount = A0_205:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_207, A1_208)
    A0_207:getSpecTable().totalAshCount = A0_207:getSpecTable().totalAshCount + 1
    if _gm:setHp("r", _gm:getHp("r") - 1) then
      popGemForCore(A1_208:getGizmo())
      requestGmAction("attackR")
    end
  end,
  onObjectDead = function(A0_209, A1_210)
    A0_209:getSpecTable().totalDeadCount = A0_209:getSpecTable().totalDeadCount + 1
  end
}
enmgen2_gm_bodyarea_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      locator = "locator_gm_body_11",
      name = "body_enm_11",
      type = "lunafishowner",
      ai_spawn_option = "LunaFishOwner/owner_num08"
    },
    {
      locator = "locator_gm_body_12",
      name = "body_enm_12",
      type = "imp"
    },
    {
      locator = "locator_gm_body_13",
      name = "body_enm_13",
      type = "imp"
    },
    {
      locator = "locator_gm_body_14",
      name = "body_enm_14",
      type = "imp"
    },
    {
      locator = "locator_gm_body_21",
      name = "body_enm_21",
      type = "imp"
    },
    {
      locator = "locator_gm_body_22",
      name = "body_enm_22",
      type = "imp"
    },
    {
      locator = "locator_gm_body_23",
      name = "body_enm_23",
      type = "imp"
    },
    {
      locator = "locator_gm_body_24",
      name = "body_enm_24",
      type = "imp"
    },
    {
      locator = "locator_gm_body_31",
      name = "body_enm_31",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_32",
      name = "body_enm_32",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_body_33",
      name = "body_enm_33",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_41",
      name = "body_enm_41",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_42",
      name = "body_enm_42",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_body_43",
      name = "body_enm_43",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_51",
      name = "body_enm_51",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_52",
      name = "body_enm_52",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_body_53",
      name = "body_enm_53",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_61",
      name = "body_enm_61",
      type = "jammer"
    },
    {
      locator = "locator_gm_body_62",
      name = "body_enm_62",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_body_63",
      name = "body_enm_63",
      type = "jammer"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_gm_body_11",
      name = "fish_b_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_211)
    local L1_212
  end,
  onEnter = function(A0_213)
    local L1_214
  end,
  onLeave = function(A0_215)
    local L1_216
  end,
  onSpawn = function(A0_217, A1_218)
    if A1_218:getName() == "fish_b_01" or A1_218:getName() == "body_enm_11" then
      A1_218:setScriptAttackTarget(Fn_getPlayer())
    end
    A1_218:setVisibleEnemyMarker(false)
    A0_217:getSpecTable().totalEnemyCount = A0_217:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_219, A1_220)
    local L2_221
    L2_221 = A0_219.getSpecTable
    L2_221 = L2_221(A0_219)
    L2_221.totalAshCount = A0_219:getSpecTable().totalAshCount + 1
    L2_221 = {}
    L2_221.brain = A1_220
    L2_221.pos = A1_220:getGizmo():getWorldPos()
    L2_221.type = "dummy"
    L2_221.impulse = Vector(0, 0, 0)
    Fn_enemyAshPopGem(A0_219, L2_221, {
      "A",
      "B",
      "C",
      "D"
    })
  end,
  onObjectDead = function(A0_222, A1_223)
    A0_222:getSpecTable().totalDeadCount = A0_222:getSpecTable().totalDeadCount + 1
  end,
  onSetupGem = function(A0_224, A1_225)
    Fn_enemyPopGemSetup(A0_224, {
      "body_enm_31",
      "body_enm_32",
      "body_enm_33"
    }, 3, _GEM.ENERGY, "A")
    Fn_enemyPopGemSetup(A0_224, {
      "body_enm_41",
      "body_enm_42",
      "body_enm_43"
    }, 3, _GEM.ENERGY, "B")
    Fn_enemyPopGemSetup(A0_224, {
      "body_enm_51",
      "body_enm_52",
      "body_enm_53"
    }, 3, _GEM.ENERGY, "C")
    Fn_enemyPopGemSetup(A0_224, {
      "body_enm_61",
      "body_enm_62",
      "body_enm_63"
    }, 3, _GEM.ENERGY, "D")
  end,
  onPopGem = function(A0_226, A1_227)
  end
}
enmgen2_gm_f_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      locator = "locator_gm_f_01",
      name = "body_enm_f01",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_02",
      name = "body_enm_f02",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_03",
      name = "body_enm_f03",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_04",
      name = "body_enm_f04",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_05",
      name = "body_enm_f05",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_06",
      name = "body_enm_f06",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_11",
      name = "body_enm_f11",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_12",
      name = "body_enm_f12",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_13",
      name = "body_enm_f13",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_14",
      name = "body_enm_f14",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_15",
      name = "body_enm_f15",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_16",
      name = "body_enm_f16",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_21",
      name = "body_enm_f21",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_22",
      name = "body_enm_f22",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_23",
      name = "body_enm_f23",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_24",
      name = "body_enm_f24",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_25",
      name = "body_enm_f25",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_26",
      name = "body_enm_f26",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_31",
      name = "body_enm_f31",
      type = "lunafishowner",
      ai_spawn_option = "LunaFishOwner/owner_num08"
    },
    {
      locator = "locator_gm_f_32",
      name = "body_enm_f32",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_33",
      name = "body_enm_f33",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_34",
      name = "body_enm_f34",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_f_35",
      name = "body_enm_f35",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_f_36",
      name = "body_enm_f36",
      type = "gellyfish"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_gm_f_31",
      name = "fish_f_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_228)
    local L1_229
  end,
  onEnter = function(A0_230)
    local L1_231
  end,
  onLeave = function(A0_232)
    local L1_233
  end,
  onSpawn = function(A0_234, A1_235)
    if A1_235:getName() == "fish_f_01" or A1_235:getName() == "body_enm_f31" then
      A1_235:setScriptAttackTarget(Fn_getPlayer())
    end
    A1_235:setVisibleEnemyMarker(false)
    A0_234:getSpecTable().totalEnemyCount = A0_234:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_236, A1_237)
    local L2_238
    L2_238 = A0_236.getSpecTable
    L2_238 = L2_238(A0_236)
    L2_238.totalAshCount = A0_236:getSpecTable().totalAshCount + 1
    L2_238 = {}
    L2_238.brain = A1_237
    L2_238.pos = A1_237:getGizmo():getWorldPos()
    L2_238.type = "dummy"
    L2_238.impulse = Vector(0, 0, 0)
    Fn_enemyAshPopGem(A0_236, L2_238, {
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H"
    })
  end,
  onObjectDead = function(A0_239, A1_240)
    A0_239:getSpecTable().totalDeadCount = A0_239:getSpecTable().totalDeadCount + 1
  end,
  onSetupGem = function(A0_241, A1_242)
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f01",
      "body_enm_f02",
      "body_enm_f03"
    }, 3, _GEM.VITAL, "A")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f04",
      "body_enm_f05",
      "body_enm_f06"
    }, 3, _GEM.VITAL, "B")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f11",
      "body_enm_f12",
      "body_enm_f13"
    }, 3, _GEM.VITAL, "C")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f14",
      "body_enm_f15",
      "body_enm_f16"
    }, 3, _GEM.VITAL, "D")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f21",
      "body_enm_f22",
      "body_enm_f23"
    }, 3, _GEM.VITAL, "E")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f24",
      "body_enm_f25",
      "body_enm_f26"
    }, 3, _GEM.VITAL, "F")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f31",
      "body_enm_f32",
      "body_enm_f33"
    }, 3, _GEM.VITAL, "G")
    Fn_enemyPopGemSetup(A0_241, {
      "body_enm_f34",
      "body_enm_f35",
      "body_enm_f36"
    }, 3, _GEM.VITAL, "H")
  end,
  onPopGem = function(A0_243, A1_244)
  end
}
enmgen2_gm_r_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      locator = "locator_gm_r_01",
      name = "body_enm_r01",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_02",
      name = "body_enm_r02",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_03",
      name = "body_enm_r03",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_04",
      name = "body_enm_r01",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_05",
      name = "body_enm_r02",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_06",
      name = "body_enm_r03",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_11",
      name = "body_enm_r11",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_12",
      name = "body_enm_r12",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_13",
      name = "body_enm_r13",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_14",
      name = "body_enm_r11",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_15",
      name = "body_enm_r12",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_16",
      name = "body_enm_r13",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_21",
      name = "body_enm_r21",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_22",
      name = "body_enm_r22",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_23",
      name = "body_enm_r23",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_24",
      name = "body_enm_r21",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_25",
      name = "body_enm_r22",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_26",
      name = "body_enm_r23",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_31",
      name = "body_enm_r31",
      type = "lunafishowner",
      ai_spawn_option = "LunaFishOwner/owner_num08"
    },
    {
      locator = "locator_gm_r_32",
      name = "body_enm_r32",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_33",
      name = "body_enm_r33",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_34",
      name = "body_enm_r31",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_r_35",
      name = "body_enm_r32",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_r_36",
      name = "body_enm_r33",
      type = "gellyfish"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_gm_r_31",
      name = "fish_r_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_245)
    local L1_246
  end,
  onEnter = function(A0_247)
    local L1_248
  end,
  onLeave = function(A0_249)
    local L1_250
  end,
  onSpawn = function(A0_251, A1_252)
    if A1_252:getName() == "fish_r_01" or A1_252:getName() == "body_enm_r31" then
      A1_252:setScriptAttackTarget(Fn_getPlayer())
    end
    A1_252:setVisibleEnemyMarker(false)
    A0_251:getSpecTable().totalEnemyCount = A0_251:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_253, A1_254)
    local L2_255
    L2_255 = A0_253.getSpecTable
    L2_255 = L2_255(A0_253)
    L2_255.totalAshCount = A0_253:getSpecTable().totalAshCount + 1
    L2_255 = {}
    L2_255.brain = A1_254
    L2_255.pos = A1_254:getGizmo():getWorldPos()
    L2_255.type = "dummy"
    L2_255.impulse = Vector(0, 0, 0)
    Fn_enemyAshPopGem(A0_253, L2_255, {
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H"
    })
  end,
  onObjectDead = function(A0_256, A1_257)
    A0_256:getSpecTable().totalDeadCount = A0_256:getSpecTable().totalDeadCount + 1
  end,
  onSetupGem = function(A0_258, A1_259)
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r01",
      "body_enm_r02",
      "body_enm_r03"
    }, 3, _GEM.VITAL, "A")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r04",
      "body_enm_r05",
      "body_enm_r06"
    }, 3, _GEM.VITAL, "B")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r11",
      "body_enm_r12",
      "body_enm_r13"
    }, 3, _GEM.VITAL, "C")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r14",
      "body_enm_r15",
      "body_enm_r16"
    }, 3, _GEM.VITAL, "D")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r21",
      "body_enm_r22",
      "body_enm_r23"
    }, 3, _GEM.VITAL, "E")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r24",
      "body_enm_r25",
      "body_enm_r26"
    }, 3, _GEM.VITAL, "F")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r31",
      "body_enm_r32",
      "body_enm_r33"
    }, 3, _GEM.VITAL, "G")
    Fn_enemyPopGemSetup(A0_258, {
      "body_enm_r34",
      "body_enm_r35",
      "body_enm_r36"
    }, 3, _GEM.VITAL, "H")
  end,
  onPopGem = function(A0_260, A1_261)
  end
}
enmgen2_gm_l_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      locator = "locator_gm_l_01",
      name = "body_enm_l01",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_02",
      name = "body_enm_l02",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_03",
      name = "body_enm_l03",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_04",
      name = "body_enm_l01",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_05",
      name = "body_enm_l02",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_06",
      name = "body_enm_l03",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_11",
      name = "body_enm_l11",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_12",
      name = "body_enm_l12",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_13",
      name = "body_enm_l13",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_14",
      name = "body_enm_l11",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_15",
      name = "body_enm_l12",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_16",
      name = "body_enm_l13",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_21",
      name = "body_enm_l21",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_22",
      name = "body_enm_l22",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_23",
      name = "body_enm_l23",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_24",
      name = "body_enm_l21",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_25",
      name = "body_enm_l22",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_26",
      name = "body_enm_l23",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_31",
      name = "body_enm_l31",
      type = "lunafishowner",
      ai_spawn_option = "LunaFishOwner/owner_num08"
    },
    {
      locator = "locator_gm_l_32",
      name = "body_enm_l32",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_33",
      name = "body_enm_l33",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_34",
      name = "body_enm_l31",
      type = "gellyfish"
    },
    {
      locator = "locator_gm_l_35",
      name = "body_enm_l32",
      type = "lasercannon"
    },
    {
      locator = "locator_gm_l_36",
      name = "body_enm_l33",
      type = "gellyfish"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish",
      locator = "locator_gm_l_31",
      name = "fish_l_01"
    }
  },
  totalEnemyCount = 0,
  totalAshCount = 0,
  totalDeadCount = 0,
  onUpdate = function(A0_262)
    local L1_263
  end,
  onEnter = function(A0_264)
    local L1_265
  end,
  onLeave = function(A0_266)
    local L1_267
  end,
  onSpawn = function(A0_268, A1_269)
    if A1_269:getName() == "fish_l_01" or A1_269:getName() == "body_enm_l31" then
      A1_269:setScriptAttackTarget(Fn_getPlayer())
    end
    A1_269:setVisibleEnemyMarker(false)
    A0_268:getSpecTable().totalEnemyCount = A0_268:getSpecTable().totalEnemyCount + 1
  end,
  onObjectAsh = function(A0_270, A1_271)
    local L2_272
    L2_272 = A0_270.getSpecTable
    L2_272 = L2_272(A0_270)
    L2_272.totalAshCount = A0_270:getSpecTable().totalAshCount + 1
    L2_272 = {}
    L2_272.brain = A1_271
    L2_272.pos = A1_271:getGizmo():getWorldPos()
    L2_272.type = "dummy"
    L2_272.impulse = Vector(0, 0, 0)
    Fn_enemyAshPopGem(A0_270, L2_272, {
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H"
    })
  end,
  onObjectDead = function(A0_273, A1_274)
    A0_273:getSpecTable().totalDeadCount = A0_273:getSpecTable().totalDeadCount + 1
  end,
  onSetupGem = function(A0_275, A1_276)
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l01",
      "body_enm_l02",
      "body_enm_l03"
    }, 3, _GEM.VITAL, "A")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l04",
      "body_enm_l05",
      "body_enm_l06"
    }, 3, _GEM.VITAL, "B")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l11",
      "body_enm_l12",
      "body_enm_l13"
    }, 3, _GEM.VITAL, "C")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l14",
      "body_enm_l15",
      "body_enm_l16"
    }, 3, _GEM.VITAL, "D")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l21",
      "body_enm_l22",
      "body_enm_l23"
    }, 3, _GEM.VITAL, "E")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l24",
      "body_enm_l25",
      "body_enm_l26"
    }, 3, _GEM.VITAL, "F")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l31",
      "body_enm_l32",
      "body_enm_l33"
    }, 3, _GEM.VITAL, "G")
    Fn_enemyPopGemSetup(A0_275, {
      "body_enm_l34",
      "body_enm_l35",
      "body_enm_l36"
    }, 3, _GEM.VITAL, "H")
  end,
  onPopGem = function(A0_277, A1_278)
  end
}
function findGmEnemy()
  local L0_279, L1_280, L2_281, L3_282, L4_283, L5_284, L6_285, L7_286, L8_287, L9_288, L10_289, L11_290
  for L3_282, L4_283 in L0_279(L1_280) do
    for L8_287, L9_288 in L5_284(L6_285) do
      L10_289 = findGameObject2
      L11_290 = "EnemyGenerator"
      L10_289 = L10_289(L11_290, L9_288)
      L11_290 = print
      L11_290(">>> " .. L9_288)
      if L10_289 then
        L11_290 = table
        L11_290 = L11_290.insert
        L11_290(_gm_enmgen_handle_list[L3_282], L10_289)
        L11_290 = _enmgen_hdl
        L11_290[L9_288] = {hdl = L10_289, active = false}
        L11_290 = L10_289.getSpecTable
        L11_290 = L11_290(L10_289)
        L11_290 = L11_290.spawnSet
        for _FORV_15_, _FORV_16_ in ipairs(L11_290) do
          print("     " .. _FORV_16_.name)
          table.insert(_gm_enemy_name_list, _FORV_16_.name)
        end
      end
    end
  end
end
function setGmEnemyMaker(A0_291)
  local L1_292, L2_293, L3_294, L4_295, L5_296
  for L4_295, L5_296 in L1_292(L2_293) do
    for _FORV_9_, _FORV_10_ in ipairs(L5_296) do
      _FORV_10_:setEnemyMarker(A0_291)
    end
  end
end
function getGmEnemyCount(A0_297)
  for _FORV_5_, _FORV_6_ in ipairs(_gm_enmgen_handle_list[A0_297]) do
  end
  return 0 + _FORV_6_:getEnemyCount()
end
function requestSpawn(A0_298)
  if type(A0_298) == "string" then
    if not _enmgen_hdl[A0_298].active then
      _enmgen_hdl[A0_298].hdl:requestSpawn()
      _enmgen_hdl[A0_298].active = true
    end
  elseif type(A0_298) == "table" then
    for _FORV_4_, _FORV_5_ in pairs(A0_298) do
      if not _enmgen_hdl[_FORV_5_].active then
        _enmgen_hdl[_FORV_5_].hdl:requestSpawn()
        _enmgen_hdl[_FORV_5_].active = true
      end
    end
  end
end
function requestIdling(A0_299, A1_300)
  if type(A0_299) == "string" then
    _enmgen_hdl[A0_299].hdl:requestIdlingEnemy(A1_300)
  elseif type(A0_299) == "table" then
    for _FORV_5_, _FORV_6_ in pairs(A0_299) do
      _enmgen_hdl[_FORV_6_].hdl:requestIdlingEnemy(A1_300)
    end
  end
end
function requestIdlingGmEnemy(A0_301)
  for _FORV_4_, _FORV_5_ in ipairs(_gm_enmgen_handle_list.f) do
    _FORV_5_:requestIdlingEnemy(A0_301)
  end
  for _FORV_4_, _FORV_5_ in ipairs(_gm_enmgen_handle_list.r) do
    _FORV_5_:requestIdlingEnemy(A0_301)
  end
  for _FORV_4_, _FORV_5_ in ipairs(_gm_enmgen_handle_list.l) do
    _FORV_5_:requestIdlingEnemy(A0_301)
  end
  for _FORV_4_, _FORV_5_ in ipairs(_gm_enmgen_handle_list.b) do
    _FORV_5_:requestIdlingEnemy(A0_301)
  end
end
function requestKill(A0_302)
  if type(A0_302) == "string" then
    _enmgen_hdl[A0_302].hdl:requestAllEnemyKill()
    _enmgen_hdl[A0_302].active = false
  elseif type(A0_302) == "table" then
    for _FORV_4_, _FORV_5_ in pairs(A0_302) do
      _enmgen_hdl[_FORV_5_].hdl:requestAllEnemyKill()
      _enmgen_hdl[_FORV_5_].active = false
    end
  end
end
function getEnemyPuppets(A0_303)
  return _enmgen_hdl[A0_303].hdl:getSpecTable().puppets
end
function setEnableHomingTargetGmEnemy(A0_304)
  local L1_305, L2_306, L3_307, L4_308, L5_309
  for L4_308, L5_309 in L1_305(L2_306) do
    if findGameObject2("EnemyBrain", L5_309) ~= nil then
      findGameObject2("EnemyBrain", L5_309):setEnableHomingTarget(A0_304)
    end
  end
end
function isCoreInSight()
  local L0_310, L1_311, L2_312, L3_313, L4_314, L5_315, L6_316, L7_317
  L0_310 = false
  for L4_314, L5_315 in L1_311(L2_312) do
    L6_316 = string
    L6_316 = L6_316.find
    L7_317 = L5_315
    L6_316 = L6_316(L7_317, "core")
    if L6_316 ~= nil then
      L6_316 = findGameObject2
      L7_317 = "EnemyBrain"
      L6_316 = L6_316(L7_317, L5_315)
      if L6_316 ~= nil then
        L7_317 = L6_316.getGizmo
        L7_317 = L7_317(L6_316)
        if L7_317 ~= nil and Fn_getDistanceToPlayer(L7_317) > 20 and Fn_getDistanceToPlayer(L7_317) < 70 and Fn_isInSightTarget(L7_317, 0.9) then
          L0_310 = true
          break
        end
      end
    end
  end
  return L0_310
end
function requestAllEnemyKill(A0_318)
  local L1_319, L2_320, L3_321, L4_322, L5_323
  for L4_322, L5_323 in L1_319(L2_320) do
    findGameObject2("EnemyGenerator", L5_323):requestAllEnemyKill()
  end
end
function requestAllEnemySpawn(A0_324)
  local L1_325, L2_326, L3_327, L4_328, L5_329
  for L4_328, L5_329 in L1_325(L2_326) do
    findGameObject2("EnemyGenerator", L5_329):requestSpawn()
  end
end
function setTargetEnemies(A0_330)
  local L1_331, L2_332, L3_333, L4_334, L5_335, L6_336, L7_337, L8_338, L9_339, L10_340, L11_341
  L1_331 = _gm_enmgen_handle_list
  L1_331 = L1_331[A0_330]
  if L1_331 == nil then
    return
  end
  L1_331 = {}
  for L5_335, L6_336 in L2_332(L3_333) do
    for L10_340, L11_341 in L7_337(L8_338) do
      table.insert(L1_331, L11_341)
    end
  end
  L2_332(L3_333, L4_334)
  L2_332(L3_333)
end
function setAttackParams()
  local L0_342
  L0_342 = _crow_brain
  L0_342 = L0_342.setIdling
  L0_342(L0_342, false)
  L0_342 = _crow_brain
  L0_342 = L0_342.setAbility
  L0_342(L0_342, Supporter.Ability.Follow, false)
  L0_342 = {}
  L0_342.type = Supporter.AttackAction.ShootGravity
  L0_342.power = 1000
  L0_342.distance = 100
  L0_342.check_in_sight = false
  _crow_brain:setThreatObjectAttackParams(L0_342)
  print(">>> setThreatObjectAttackParams")
end
function getCrowHandle()
  local L0_343, L1_344
  L0_343 = _crow_puppet
  return L0_343
end
function getNodeHandle(A0_345)
  return findGameObject2("Node", A0_345)
end
function crowCaption(A0_346)
  local L1_347, L2_348
  L1_347 = {}
  L2_348 = {"ep11_01010", "ep11_01011"}
  L1_347.attack = L2_348
  L2_348 = {
    "ep11_01012",
    "ep11_01013",
    "ep11_01014"
  }
  L1_347.absorptionBegin = L2_348
  L2_348 = {"ep11_01015", "ep11_01016"}
  L1_347.absorptionEnd = L2_348
  L2_348 = {}
  L2_348.attack = {"", ""}
  L2_348.absorptionBegin = {
    "",
    "",
    ""
  }
  L2_348.absorptionEnd = {"", ""}
  if L1_347[A0_346] ~= nil and not Fn_isCaptionView() then
    Fn_captionView(L1_347[A0_346][RandI(1, #L1_347[A0_346])])
  end
end
function isGmReady()
  local L0_349, L1_350
  L0_349 = _gm_request_avairable
  return L0_349
end
function requestGmAction(A0_351, A1_352)
  if not _gm_request then
    _gm_request = A0_351
    _gm_option = A1_352
    return true
  else
    return false
  end
end
function isAbsorptionEnd()
  return _gm:isAbsorptionEnd()
end
function isArmBrokenAll()
  return _gm:isArmBrokenAll()
end
function getArmState()
  local L0_353
  L0_353 = {}
  L0_353.f = isArmBroken("f")
  L0_353.r = isArmBroken("r")
  L0_353.l = isArmBroken("l")
  return L0_353
end
function isArmBroken(A0_354)
  return _gm:isArmBroken(A0_354)
end
function killArmEnemy(A0_355)
  if isArmBroken(A0_355) then
    return
  end
  for _FORV_4_, _FORV_5_ in ipairs(_gm_enmgen_handle_list[A0_355]) do
    if _FORV_5_:getEnemyCount() > 0 then
      print("\230\149\181\227\130\146\229\188\183\229\136\182\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153:" .. A0_355)
      _FORV_5_:requestAllEnemyKill()
      _gm:setHp(A0_355, 0)
    end
  end
end
function reSpawnArmEnemy(A0_356)
  local L1_357
  L1_357 = isArmBroken
  L1_357 = L1_357(A0_356)
  if L1_357 then
    return
  end
  L1_357 = 0
  for _FORV_5_, _FORV_6_ in ipairs(_gm_enmgen_handle_list[A0_356]) do
    print("\230\149\181\227\130\146\229\190\169\230\180\187\227\129\149\227\129\155\227\129\190\227\129\153:" .. _FORV_6_:getName())
    _FORV_6_:requestSpawn()
    L1_357 = L1_357 + #_FORV_6_:getSpecTable().spawnSet
  end
  _gm:setHp(A0_356, L1_357)
  print(string.format(" %s \227\129\174HP\227\129\175 %d ", A0_356, L1_357))
end
function getGmHp(A0_358)
  return _gm:getHp(A0_358)
end
function setVisibleCoreMarker(A0_359, A1_360)
  local L2_361, L3_362, L4_363, L5_364, L6_365, L7_366
  for L5_364, L6_365 in L2_361(L3_362) do
    L7_366 = L6_365.setEnemyMarker
    L7_366(L6_365, A1_360)
    if A1_360 then
      L7_366 = L6_365.getSpecTable
      L7_366 = L7_366(L6_365)
      L7_366 = L7_366.spawnSet
      for _FORV_11_, _FORV_12_ in ipairs(L7_366) do
        if findGameObject2("EnemyBrain", _FORV_12_.name) ~= nil then
          print(string.format("boss marker on: %s", _FORV_12_.name))
          findGameObject2("EnemyBrain", _FORV_12_.name):setVisibleBossMarker(A1_360)
        end
      end
    end
  end
end
function setMotionSpeed(A0_367, A1_368)
  _gm:setMotionSpeed(A0_367, A1_368)
end
function getGmMouth()
  return _gm:getMouthNode()
end
function getGmCenterArm()
  return _gm:getArmHandle()
end
function getGmBody()
  return _gm:getBodyHandle()
end
function setArmSensorActive(A0_369)
  _gm:setArmSensorActive("f", A0_369)
  _gm:setArmSensorActive("r", A0_369)
  _gm:setArmSensorActive("l", A0_369)
end
function isGameOver()
  return _gm:isGameOver()
end
function setGmGrabObject()
  local L0_370, L1_371, L2_372, L3_373, L4_374, L5_375, L6_376, L7_377, L8_378, L9_379, L10_380, L11_381, L12_382, L13_383, L14_384, L15_385, L16_386, L17_387, L18_388, L19_389, L20_390
  L0_370 = {L1_371, L2_372}
  L1_371 = "a"
  L1_371 = {
    L2_372,
    L3_373,
    L4_374
  }
  for L5_375, L6_376 in L2_372(L3_373) do
    for L10_380, L11_381 in L7_377(L8_378) do
      for L15_385 = 1, 4 do
        for L19_389 = 1, 10 do
          L20_390 = string
          L20_390 = L20_390.format
          L20_390 = L20_390("bg2_grab_%s_%s_%02d_0%d", L6_376, L11_381, L15_385, L19_389)
          if findGameObject2("GimmickBg", L20_390) ~= nil then
            print("\232\135\170\229\139\149\229\190\169\230\180\187\232\168\173\229\174\154:" .. L20_390)
            findGameObject2("GimmickBg", L20_390):setAutoRestore(30)
          end
        end
      end
    end
  end
end
function setWorldTransform(A0_391)
  invokeTask(function()
    local L1_392
    L1_392 = _gm
    L1_392 = L1_392.setWorldTransform
    L1_392(L1_392, findGameObject2("Node", A0_391):getWorldTransform())
  end)
end
function playSE(A0_393, A1_394, A2_395)
  if _gm ~= nil then
    _gm:playSE(A0_393, A1_394, A2_395)
  end
end
function startGmScream()
  stopGmScream()
  _gmScream = invokeTask(function()
    local L0_396
    L0_396 = RandI
    L0_396 = L0_396(7, 15)
    while true do
      L0_396 = L0_396 - 1
      if L0_396 < 0 then
        playSE("b", "ep11_ghost_scream", 1)
        L0_396 = RandI(7, 15)
      end
      waitSeconds(1)
    end
  end)
end
function stopGmScream()
  if _gmScream ~= nil then
    _gmScream:abort()
    _gmScream = nil
  end
end
function stopRumbleSE()
  _gm:stopBodySE()
  if _rumbleSE ~= nil then
    Sound:stopSEHandle(_rumbleSE)
    _rumbleSE = nil
  end
end
function setSaftyAreaActive(A0_397)
  if A0_397 then
    Fn_pcSensorOn("pccubesensor2_safty_area")
  else
    Fn_pcSensorOff("pccubesensor2_safty_area")
  end
end
function pccubesensor2_gmsafty_OnEnter(A0_398)
  print("\230\131\179\229\174\154\227\130\168\227\131\170\227\130\162\229\134\133\227\129\171\229\133\165\227\129\163\227\129\159")
end
function pccubesensor2_gmsafty_OnLeave(A0_399)
  print("\230\131\179\229\174\154\227\130\168\227\131\170\227\130\162\229\164\150\227\129\184\229\135\186\227\129\159")
end
function setNpcActive(A0_400, A1_401)
  if type(A0_400) == "string" then
    _npcs[A0_400]:setActive(A1_401)
  elseif type(A0_400) == "table" then
    for _FORV_5_, _FORV_6_ in pairs(A0_400) do
      _npcs[_FORV_6_]:setActive(A1_401)
    end
  end
end
function getNpcHandle(A0_402)
  return _npcs[A0_402]
end
function getNpcPuppet(A0_403)
  return Fn_findNpcPuppet(A0_403)
end
function lookAtPos(A0_404, A1_405)
  Camera:resetViewControl()
  return invokeTask(function()
    local L0_406
    L0_406 = A1_405
    L0_406 = L0_406 * 30
    while L0_406 > 0 do
      Camera:setViewControlTarget(A0_404)
      L0_406 = L0_406 - 1
      wait()
    end
  end)
end
function setBomActive(A0_407)
  local L1_408, L2_409, L3_410, L4_411
  for L4_411 = 1, 16 do
    findGameObject2("GimmickBg", string.format("bg2_bom_%02d", L4_411)):setActive(A0_407)
  end
end
function setBridgeActive(A0_412)
  local L1_413, L2_414, L3_415, L4_416
  for L4_416 = 1, 48 do
    findGameObject2("GimmickBg", string.format("bg2_up_a_bridge_parts0%d", L4_416)):setActive(A0_412)
  end
end
function setBridgeBaseActive(A0_417)
  if findGameObject2("GimmickBg", "bg2_up_a_bridge_base") ~= nil then
    findGameObject2("GimmickBg", "bg2_up_a_bridge_base"):setActive(A0_417)
  end
end
function setPcSensor(A0_418, A1_419)
  if A1_419 then
    Fn_pcSensorOff("pccubesensor2_safty_area")
  else
    Fn_pcSensorOff(A0_418)
  end
end
function setPlayerSituation(A0_420, A1_421, A2_422, A3_423, A4_424)
  Player:setSituation(A0_420, A1_421, A2_422, A3_423, A4_424)
end
function setPlayerMuteVoice(A0_425)
  Player:muteVoice(A0_425)
end
function setNpcMotion()
  local L0_426, L1_427, L2_428
  L0_426 = {}
  L0_426.isRepeat = true
  L0_426.isRandom = true
  L0_426.animBlendDuration = 1
  L1_427 = {L2_428, "stay_01"}
  L2_428 = "stay"
  L2_428 = Fn_playMotionNpc
  L2_428("sis01", L1_427, false, L0_426)
  L2_428 = {
    "lookaround_eps05_00"
  }
  Fn_playMotionNpc("cid01", L2_428, false, L0_426)
end
function escapeNpcAction()
  invokeTask(function()
    local L0_429, L1_430, L2_431, L3_432, L4_433, L5_434, L6_435, L7_436, L8_437, L9_438, L10_439, L11_440, L12_441, L13_442, L14_443, L15_444, L16_445
    _npc_escape_man_01 = "man45"
    _npc_escape_wom_01 = "wom25"
    _npc_escape_man_02 = "man40"
    L0_429 = Fn_findNpc
    L1_430 = _npc_escape_man_01
    L0_429 = L0_429(L1_430)
    _npc1 = L0_429
    L0_429 = Fn_findNpc
    L1_430 = _npc_escape_wom_01
    L0_429 = L0_429(L1_430)
    _npc2 = L0_429
    L0_429 = Fn_findNpc
    L1_430 = _npc_escape_man_02
    L0_429 = L0_429(L1_430)
    _npc3 = L0_429
    _npc1_mob_changed = false
    _npc2_mob_changed = false
    _npc3_mob_changed = false
    L0_429 = false
    L1_430 = false
    L2_431 = false
    L3_432 = Fn_setGrabNpc
    L4_433 = _npc1
    L5_434 = false
    L6_435 = true
    L3_432(L4_433, L5_434, L6_435)
    L3_432 = Fn_setGrabNpc
    L4_433 = _npc2
    L5_434 = false
    L6_435 = true
    L3_432(L4_433, L5_434, L6_435)
    L3_432 = Fn_setGrabNpc
    L4_433 = _npc3
    L5_434 = false
    L6_435 = true
    L3_432(L4_433, L5_434, L6_435)
    L3_432 = {}
    L3_432.anim_walk_speed = 1
    L3_432.anim_run_speed = 1
    L3_432.anim_speed_over = true
    L3_432.runLength = -1
    L3_432.arrivedLength = 0.1
    L3_432.navimesh = false
    L3_432.noTurn = false
    L3_432.recast = false
    L3_432.bridge = true
    L4_433 = {}
    L4_433.anim_walk_speed = 0.9
    L4_433.anim_run_speed = 0.9
    L4_433.anim_speed_over = true
    L4_433.runLength = -1
    L4_433.arrivedLength = 0.1
    L4_433.navimesh = false
    L4_433.noTurn = false
    L4_433.recast = false
    L4_433.bridge = true
    L5_434 = {}
    L5_434.anim_walk_speed = 0.9
    L5_434.anim_run_speed = 0.6
    L5_434.anim_speed_over = true
    L5_434.runLength = -1
    L5_434.arrivedLength = 0.1
    L5_434.navimesh = false
    L5_434.noTurn = false
    L5_434.recast = false
    L5_434.bridge = true
    L6_435 = {}
    L6_435.startIndex = 1
    L6_435.goalDirection = true
    L7_436 = {
      L8_437,
      L9_438,
      L10_439,
      L11_440,
      L12_441,
      L13_442,
      L14_443
    }
    L8_437 = {}
    L8_437.pos = "locator2_man45_01"
    L8_437.opt = L3_432
    L9_438 = {}
    L9_438.pos = "locator2_man45_02"
    L9_438.opt = L3_432
    L10_439 = {}
    L10_439.pos = "locator2_man45_03"
    L10_439.opt = L3_432
    L11_440 = {}
    L11_440.pos = "locator2_man45_04"
    L11_440.opt = L3_432
    L12_441 = {}
    L12_441.pos = "locator2_man45_05"
    L12_441.opt = L3_432
    L13_442 = {}
    L13_442.pos = "locator2_man45_06"
    L13_442.opt = L3_432
    L14_443 = {}
    L14_443.pos = "locator2_man45_07"
    L14_443.opt = L3_432
    L8_437 = {
      L9_438,
      L10_439,
      L11_440,
      L12_441,
      L13_442,
      L14_443,
      L15_444
    }
    L9_438 = {}
    L9_438.pos = "locator2_wom25_01"
    L9_438.opt = L4_433
    L10_439 = {}
    L10_439.pos = "locator2_wom25_02"
    L10_439.opt = L4_433
    L11_440 = {}
    L11_440.pos = "locator2_wom25_03"
    L11_440.opt = L4_433
    L12_441 = {}
    L12_441.pos = "locator2_wom25_04"
    L12_441.opt = L4_433
    L13_442 = {}
    L13_442.pos = "locator2_wom25_05"
    L13_442.opt = L4_433
    L14_443 = {}
    L14_443.pos = "locator2_wom25_06"
    L14_443.opt = L4_433
    L15_444 = {}
    L15_444.pos = "locator2_wom25_07"
    L15_444.opt = L4_433
    L9_438 = {
      L10_439,
      L11_440,
      L12_441,
      L13_442,
      L14_443,
      L15_444,
      L16_445
    }
    L10_439 = {}
    L10_439.pos = "locator2_man40_01"
    L10_439.opt = L5_434
    L11_440 = {}
    L11_440.pos = "locator2_man40_02"
    L11_440.opt = L5_434
    L12_441 = {}
    L12_441.pos = "locator2_man40_03"
    L12_441.opt = L5_434
    L13_442 = {}
    L13_442.pos = "locator2_man40_04"
    L13_442.opt = L5_434
    L14_443 = {}
    L14_443.pos = "locator2_man40_05"
    L14_443.opt = L5_434
    L15_444 = {}
    L15_444.pos = "locator2_man40_06"
    L15_444.opt = L5_434
    L16_445 = {}
    L16_445.pos = "locator2_man40_07"
    L16_445.opt = L5_434
    L10_439 = _npc1
    L11_440 = L10_439
    L10_439 = L10_439.playMotion
    L12_441 = "scared_nevy_00"
    L10_439(L11_440, L12_441)
    L10_439 = _npc2
    L11_440 = L10_439
    L10_439 = L10_439.playMotion
    L12_441 = "scared_nevy_00"
    L10_439(L11_440, L12_441)
    L10_439 = _npc3
    L11_440 = L10_439
    L10_439 = L10_439.playMotion
    L12_441 = "scared_nevy_00"
    L10_439(L11_440, L12_441)
    L10_439 = waitSeconds
    L11_440 = 5
    L10_439(L11_440)
    L10_439 = _npc1
    L11_440 = L10_439
    L10_439 = L10_439.setEventListener
    L12_441 = "npcFall"
    function L13_442()
      print(string.format("%s \227\129\175\232\144\189\228\184\139\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", _npc1:getName()))
      Sound:playSE("m30_011c", 1, nil, Fn_findNpcPuppet(_npc_escape_man_01))
      _npc1:reset()
      _npc1:setActive(false)
    end
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc1
    L11_440 = L10_439
    L10_439 = L10_439.setEventListener
    L12_441 = "npcGrabbed"
    function L13_442()
      if _npc1 ~= nil then
        _npc1:pauseMove(false)
      end
    end
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc2
    L11_440 = L10_439
    L10_439 = L10_439.setEventListener
    L12_441 = "npcFall"
    function L13_442()
      print(string.format("%s \227\129\175\232\144\189\228\184\139\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", _npc2:getName()))
      Sound:playSE("w16_004a", 1, nil, Fn_findNpcPuppet(_npc_escape_wom_01))
      _npc2:reset()
      _npc2:setActive(false)
    end
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc2
    L11_440 = L10_439
    L10_439 = L10_439.setEventListener
    L12_441 = "npcGrabbed"
    function L13_442()
      if _npc2 ~= nil then
        _npc2:pauseMove(false)
      end
    end
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc3
    L11_440 = L10_439
    L10_439 = L10_439.setEventListener
    L12_441 = "npcFall"
    function L13_442()
      print(string.format("%s \227\129\175\232\144\189\228\184\139\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130", _npc3:getName()))
      Sound:playSE("m07_004a", 1, nil, Fn_findNpcPuppet(_npc_escape_man_02))
      _npc3:reset()
      _npc3:setActive(false)
    end
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc3
    L11_440 = L10_439
    L10_439 = L10_439.setEventListener
    L12_441 = "npcGrabbed"
    function L13_442()
      if _npc3 ~= nil then
        _npc3:pauseMove(false)
      end
    end
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc1
    L11_440 = L10_439
    L10_439 = L10_439.move
    L12_441 = L7_436
    L13_442 = L6_435
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc2
    L11_440 = L10_439
    L10_439 = L10_439.move
    L12_441 = L8_437
    L13_442 = L6_435
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc3
    L11_440 = L10_439
    L10_439 = L10_439.move
    L12_441 = L9_438
    L13_442 = L6_435
    L10_439(L11_440, L12_441, L13_442)
    L10_439 = _npc1
    L11_440 = L10_439
    L10_439 = L10_439.getWorldPos
    L10_439 = L10_439(L11_440)
    L11_440 = _npc2
    L12_441 = L11_440
    L11_440 = L11_440.getWorldPos
    L11_440 = L11_440(L12_441)
    L12_441 = _npc3
    L13_442 = L12_441
    L12_441 = L12_441.getWorldPos
    L12_441 = L12_441(L13_442)
    L13_442, L14_443, L15_444 = nil, nil, nil
    L16_445 = {}
    L16_445.animBlendDuration = 0.5
    while true do
      if _npc1 ~= nil and _npc1:getMoveCurrentIndex() == 4 then
        L13_442 = L10_439
        L10_439 = Fn_findNpcPuppet(_npc_escape_man_01):getWorldPos()
        if not L0_429 and Fn_get_distance(L13_442, L10_439) < 0.05 then
          Sound:playSE("m30_011b", 1, nil, Fn_findNpcPuppet(_npc_escape_man_01))
          L0_429 = true
          _npc1:pauseMove(true)
          _npc1:playMotion(_npcMotions1.man01_groggy_00, L16_445)
        end
      end
      if _npc2 ~= nil and _npc2:getMoveCurrentIndex() == 4 then
        L14_443 = L11_440
        L11_440 = Fn_findNpcPuppet(_npc_escape_wom_01):getWorldPos()
        if not L1_430 and Fn_get_distance(L14_443, L11_440) < 0.05 then
          Sound:playSE("w16_004c", 1, nil, Fn_findNpcPuppet(_npc_escape_wom_01))
          L1_430 = true
          _npc2:pauseMove(true)
          _npc2:playMotion(_npcMotions2.wom01_groggy_01, L16_445)
        end
      end
      if _npc3 ~= nil and _npc3:getMoveCurrentIndex() == 3 then
        L15_444 = L12_441
        L12_441 = Fn_findNpcPuppet(_npc_escape_man_02):getWorldPos()
        if not L2_431 and Fn_get_distance(L15_444, L12_441) < 0.05 then
          Sound:playSE("m07_004c", 1, nil, Fn_findNpcPuppet(_npc_escape_man_02))
          L2_431 = true
          _npc3:pauseMove(true)
          _npc3:playMotion("scared_00", L16_445)
        end
      end
      if _npc1 ~= nil and _npc1:isMoveEnd() then
        _npc1:changeMob()
        _npc1_mob_changed = true
        _npc1 = nil
      end
      if _npc2 ~= nil and _npc2:isMoveEnd() then
        _npc2:changeMob()
        _npc2_mob_changed = true
        _npc2 = nil
      end
      if _npc3 ~= nil and _npc3:isMoveEnd() then
        _npc3:changeMob()
        _npc3_mob_changed = true
        _npc3 = nil
      end
      wait()
    end
  end)
end
function npcPause(A0_446, A1_447)
  if A0_446 == _npc_escape_man_01 and _npc1_mob_changed then
    return
  end
  if A0_446 == _npc_escape_wom_01 and _npc2_mob_changed then
    return
  end
  if A0_446 == _npc_escape_man_02 and _npc3_mob_changed then
    return
  end
  if Fn_findNpc(A0_446) ~= nil and not Fn_findNpc(A0_446):isMoveEnd() then
    Fn_findNpc(A0_446):pauseMove(A1_447)
    if A1_447 then
      Fn_findNpc(A0_446):playMotion("stay")
    end
  end
end
function setGemActive(A0_448, A1_449, A2_450, A3_451)
  local L4_452, L5_453, L6_454, L7_455, L8_456
  for L7_455 = A2_450, A3_451 do
    L8_456 = findGameObject2
    L8_456 = L8_456("Gem", string.format("gem2_%s_%02d", A1_449, L7_455))
    if L8_456 ~= nil then
      L8_456:setActive(A0_448)
    else
      print(string.format("gem2_%s_%02d \227\129\175\232\166\139\227\129\164\227\129\139\227\130\138\227\129\190\227\129\155\227\130\147.", A1_449, L7_455))
    end
  end
end
function popGemForCore(A0_457)
  if RandI(1, 100) > 20 then
    return
  end
  invokeTask(function()
    local L0_458, L1_459, L2_460
    L0_458 = createGameObject2
    L1_459 = "Gem"
    L0_458 = L0_458(L1_459)
    L2_460 = L0_458
    L1_459 = L0_458.setGemModelNo
    L1_459(L2_460, _GEM.VITAL)
    L1_459 = A0_457
    L2_460 = L1_459
    L1_459 = L1_459.getWorldTransform
    L2_460 = L1_459(L2_460)
    L0_458:setWorldTransform(L1_459 + L2_460:Apply(Vector(0, 10, 0)), L2_460)
    L0_458:setActive(true)
    L0_458:try_init()
    L0_458:setVisibleBlockHalfSize(150)
    L0_458:waitForReady()
    L0_458:try_start()
    print("Vital Gem\227\130\146\231\148\159\230\136\144")
  end)
end
