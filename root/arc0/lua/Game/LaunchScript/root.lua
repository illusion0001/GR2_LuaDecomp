import("GameDatabase")
import("HUD")
import("Sound")
import("Net")
import("Ugc")
import("Font")
dofile("/Game/Event2/Common/SystemScriptCommon.lua")
dofile("/Game/Event2/Table/RewardTable.lua")
import("Debug")
_DEBUG_DISP = true
_title = true
_load = false
_tropyUpdateCode = 1
_tropyUpdate = true
_dlcCheak = true
_network = true
_do_cache = true
_sb_soundManager = nil
_sb_demoManager = nil
_exit_sandbox = false
function setDebugFlags()
  if GameDatabase:get(ggd.Debug__StartMission) == "None" or GameDatabase:get(ggd.Debug__StartMission) == nil then
    GameDatabase:set(ggd.Debug__UserTest, false)
  elseif GameDatabase:get(ggd.Debug__UserTest) then
    Savedata:autoLoad()
    while Savedata:update() == 0 do
      wait()
    end
    Savedata:setupLoadGame()
  end
  if _sb_demoManager:sendEvent("setDebugFlags") ~= nil then
    wait()
  end
  return (_sb_demoManager:sendEvent("setDebugFlags"))
end
_textSet_list = {
  "common",
  "Credits",
  "ep00",
  "ep01",
  "ep02",
  "ep03",
  "ep04",
  "ep05",
  "ep06",
  "ep07",
  "ep08",
  "ep09",
  "ep10",
  "ep11",
  "ep12",
  "ep13",
  "ep14",
  "ep15",
  "ep16",
  "ep17",
  "ep18",
  "ep19",
  "ep20",
  "ep21",
  "ep22",
  "ep23",
  "ep24",
  "ep25",
  "ep26",
  "ep27",
  "sm01",
  "sm02",
  "sm03",
  "sm04",
  "sm05",
  "sm06",
  "sm07",
  "sm08",
  "sm09",
  "sm10",
  "sm11",
  "sm12",
  "sm13",
  "sm14",
  "sm15",
  "sm16",
  "sm17",
  "sm18",
  "sm19",
  "sm20",
  "sm21",
  "sm22",
  "sm23",
  "sm24",
  "sm26",
  "sm27",
  "sm28",
  "sm29",
  "sm30",
  "sm31",
  "sm32",
  "sm33",
  "sm34",
  "sm35",
  "sm36",
  "sm38",
  "sm39",
  "sm40",
  "sm41",
  "sm42",
  "sm43",
  "sm44",
  "sm45",
  "sm46",
  "sm47",
  "sm48",
  "sm49",
  "sm50",
  "sm51",
  "dm01",
  "dm02",
  "dm03",
  "dm04",
  "dm05",
  "dm06",
  "ep80",
  "sm93"
}
function closeText()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  for L3_3, L4_4 in L0_0(L1_1) do
    Font:closeTextSet(L4_4)
  end
end
function openText()
  local L0_5, L1_6, L2_7, L3_8, L4_9
  for L3_8, L4_9 in L0_5(L1_6) do
    Font:openTextSet(L4_9)
  end
end
function autoSave()
  while not _exit_sandbox do
    if GameDatabase:get(ggd.GlobalSystemFlags__AutoSave) > 0 then
      print(" |  root   | backup gamedatabase")
      GameDatabase:backup(ggd.Savedata__APP_VER)
      GameDatabase:backup(ggd.Savedata__Entitlement)
      GameDatabase:backup(ggd.Savedata__PlayerAbility)
      GameDatabase:backup(ggd.Savedata__Player)
      GameDatabase:backup(ggd.Savedata__Camera)
      GameDatabase:backup(ggd.Savedata__PhotoFilter)
      GameDatabase:backup(ggd.Savedata__MissionPhoto)
      GameDatabase:backup(ggd.Savedata__Gesture)
      GameDatabase:backup(ggd.Savedata__Option)
      GameDatabase:backup(ggd.Savedata__Menu)
      GameDatabase:backup(ggd.Savedata__EventManageFlags)
      GameDatabase:backup(ggd.Savedata__FreeTimeFlags)
      GameDatabase:backup(ggd.Savedata__EventClearFlags)
      GameDatabase:backup(ggd.Savedata__EventFinishedFlags)
      GameDatabase:backup(ggd.Savedata__EventFlags)
      GameDatabase:backup(ggd.Savedata__Info)
      GameDatabase:backup(ggd.Savedata__BrokenObj)
      GameDatabase:backup(ggd.Savedata__InfoActor)
      GameDatabase:backup(ggd.Savedata__PhotoItem)
      GameDatabase:backup(ggd.Savedata__CostumeUnlock)
      GameDatabase:backup(ggd.Savedata__GemInfo)
      GameDatabase:backup(ggd.Savedata__MyDeathGhost)
      GameDatabase:backup(ggd.Savedata__HomeInfo)
      GameDatabase:backup(ggd.Savedata__ChallengeClearState)
      GameDatabase:backup(ggd.Savedata__Collection)
      GameDatabase:backup(ggd.Savedata__Mine)
      GameDatabase:backup(ggd.Savedata__News)
      GameDatabase:backup(ggd.Savedata__CreneShipFlags)
      GameDatabase:backup(ggd.Savedata__Mine99)
      GameDatabase:backup(ggd.Savedata__TreasureFlags)
      GameDatabase:backup(ggd.Savedata__RewardFlags)
      GameDatabase:backup(ggd.Savedata__StatisticalChart)
      GameDatabase:backup(ggd.Savedata__MineInfo)
      wait()
      GameDatabase:backup(ggd.Savedata__TalismanOreGacha)
      GameDatabase:backup(ggd.Savedata__TalismanOre)
      GameDatabase:backup(ggd.Savedata__TalismanEquipped)
      GameDatabase:backup(ggd.Savedata__TalismanSkillNewarrivals)
      wait()
      GameDatabase:backup(ggd.Savedata__Talisman)
      wait()
      if GameDatabase:get(ggd.Debug__AutoSaveSkip) or GameDatabase:get(ggd.GlobalSystemFlags__AutoSaveSkip) then
        print(" |  root   | skip autoSave")
        GameDatabase:set(ggd.GlobalSystemFlags__AutoSaveSkip, false)
      else
        print(" |  root   | auto save start ...")
        Savedata:autoSave()
        while Savedata:update() == 0 do
          wait()
        end
        print(" |  root   | auto save finish!!")
      end
      if GameDatabase:get(ggd.GlobalSystemFlags__AutoSave) == GameDatabase:get(ggd.GlobalSystemFlags__AutoSave) then
        GameDatabase:set(ggd.GlobalSystemFlags__AutoSave, 0)
        print(" |  root   | auto save rep empty")
      else
        print(" |  root   | auto save rep " .. GameDatabase:get(ggd.GlobalSystemFlags__AutoSave) - GameDatabase:get(ggd.GlobalSystemFlags__AutoSave))
      end
    end
    wait()
  end
end
function accessIndicator()
  local L0_10, L1_11, L2_12
  L0_10 = false
  L1_11 = false
  L2_12 = false
  while not _exit_sandbox do
    L1_11 = GameDatabase:get(ggd.GlobalSystemFlags__AccessIndicator)
    L2_12 = GameDatabase:get(ggd.GlobalSystemFlags__AccessIndicatorHide)
    if L2_12 then
      if L0_10 == true then
        L0_10 = false
        HUD:accessEnd()
        print(" |  root   | access indicator hide ")
      end
    elseif L1_11 > 0 then
      if L0_10 == false then
        L0_10 = true
        HUD:accessBegin()
        print(" |  root   | access indicator on")
      end
    elseif L0_10 == true then
      L0_10 = false
      HUD:accessEnd()
      print(" |  root   | access indicator off")
    end
    wait()
  end
end
function gameStart()
  local L0_13, L1_14, L2_15, L3_16
  L0_13 = _network
  if L0_13 then
    L0_13 = Ugc
    L1_14 = L0_13
    L0_13 = L0_13.serviceStop
    L0_13(L1_14)
  end
  L0_13 = _load
  if not L0_13 then
    L0_13 = resetSaveData
    L0_13()
  else
    L0_13 = Savedata
    L1_14 = L0_13
    L0_13 = L0_13.setupLoadGame
    L0_13(L1_14)
  end
  L0_13 = GameDatabase
  L1_14 = L0_13
  L0_13 = L0_13.get
  L2_15 = ggd
  L2_15 = L2_15.Menu__TitleCount
  L0_13 = L0_13(L1_14, L2_15)
  L1_14 = GameDatabase
  L2_15 = L1_14
  L1_14 = L1_14.reset
  L3_16 = ggd
  L3_16 = L3_16.Menu
  L1_14(L2_15, L3_16)
  L1_14 = GameDatabase
  L2_15 = L1_14
  L1_14 = L1_14.reset
  L3_16 = ggd
  L3_16 = L3_16.InfoActorFlags
  L1_14(L2_15, L3_16)
  L1_14 = GameDatabase
  L2_15 = L1_14
  L1_14 = L1_14.reset
  L3_16 = ggd
  L3_16 = L3_16.CreneShipFlags
  L1_14(L2_15, L3_16)
  L1_14 = GameDatabase
  L2_15 = L1_14
  L1_14 = L1_14.reset
  L3_16 = ggd
  L3_16 = L3_16.EventFlags
  L1_14(L2_15, L3_16)
  L1_14 = GameDatabase
  L2_15 = L1_14
  L1_14 = L1_14.reset
  L3_16 = ggd
  L3_16 = L3_16.GlobalSystemFlags
  L1_14(L2_15, L3_16)
  L1_14 = GameDatabase
  L2_15 = L1_14
  L1_14 = L1_14.set
  L3_16 = ggd
  L3_16 = L3_16.Menu__TitleCount
  L1_14(L2_15, L3_16, L0_13)
  L1_14 = _load
  if not L1_14 then
    L1_14 = setDebugFlags
    L1_14 = L1_14()
    _title = L1_14
  end
  _load = false
  L1_14 = nil
  L2_15 = _title
  if L2_15 then
    L2_15 = HUD
    L3_16 = L2_15
    L2_15 = L2_15.titleOpen
    L2_15(L3_16, "ep00_00100m,ep00_00200m,ep00_00300m,ep00_00500m")
    L2_15 = wait
    L2_15()
    while true do
      L2_15 = HUD
      L3_16 = L2_15
      L2_15 = L2_15.getTitleStatue
      L2_15 = L2_15(L3_16)
      L1_14 = L2_15
      L2_15 = HUD
      L2_15 = L2_15.kTitleResult_NewGame
      if L1_14 == L2_15 then
        L2_15 = HUD
        L3_16 = L2_15
        L2_15 = L2_15.blackout
        L2_15(L3_16, 0)
        L2_15 = resetSaveData
        L2_15()
        L2_15 = Savedata
        L3_16 = L2_15
        L2_15 = L2_15.setupNewGame
        L2_15(L3_16)
        break
      else
        L2_15 = HUD
        L2_15 = L2_15.kTitleResult_Continue
        if L1_14 == L2_15 then
          L2_15 = HUD
          L3_16 = L2_15
          L2_15 = L2_15.blackout
          L2_15(L3_16, 0)
          L2_15 = Savedata
          L3_16 = L2_15
          L2_15 = L2_15.setupLoadGame
          L2_15(L3_16)
          break
        else
          L2_15 = HUD
          L2_15 = L2_15.kTitleResult_LoadGame
          if L1_14 == L2_15 then
            L2_15 = HUD
            L3_16 = L2_15
            L2_15 = L2_15.blackout
            L2_15(L3_16, 0)
            L2_15 = Savedata
            L3_16 = L2_15
            L2_15 = L2_15.setupLoadGame
            L2_15(L3_16)
            break
          else
            L2_15 = HUD
            L2_15 = L2_15.kTitleResult_Stay
            if L1_14 == L2_15 then
              L2_15 = wait
              L3_16 = 10
              L2_15(L3_16)
            else
              L2_15 = HUD
              L2_15 = L2_15.kTitleResult_None
              if L1_14 == L2_15 then
                L2_15 = wait
                L3_16 = 10
                L2_15(L3_16)
                L2_15 = HUD
                L3_16 = L2_15
                L2_15 = L2_15.titleOpen
                L2_15(L3_16)
              end
            end
          end
        end
      end
      L2_15 = _exit_sandbox
      if L2_15 then
        L2_15 = print
        L3_16 = " |  root   | exit sandbox title cansel "
        L2_15(L3_16)
        break
      end
      L2_15 = wait
      L2_15()
    end
  end
  L2_15 = _exit_sandbox
  if L2_15 then
    L2_15 = print
    L3_16 = " |  root   | exit sandbox return gameStart"
    L2_15(L3_16)
    return
  end
  L2_15 = _sb_demoManager
  L3_16 = L2_15
  L2_15 = L2_15.sendEvent
  L2_15 = L2_15(L3_16, "startup")
  L3_16 = _network
  if L3_16 then
    L3_16 = Net
    L3_16 = L3_16.checkAvailability
    L3_16(L3_16)
    L3_16 = invokeSystemTask
    L3_16(function()
      while Net:checkAvailabilityUpdate() ~= 0 do
        wait()
      end
      Ugc:serviceStart()
    end)
  end
  L3_16 = _dlcCheak
  if L3_16 then
    L3_16 = Ugc
    L3_16 = L3_16.dlcNewsCheck
    L3_16(L3_16)
  end
  L3_16 = _tropyUpdate
  if L3_16 then
    L3_16 = 0
    while 0 < _tropyUpdateCode do
      wait()
      L3_16 = L3_16 + 1
    end
    L3_16 = 10 - L3_16
    if L3_16 > 0 then
      wait(L3_16)
    end
  end
  if not L2_15 then
    L3_16 = createSandbox2
    L3_16 = L3_16("mother2")
    sb_mother2 = L3_16
    L3_16 = sb_mother2
    L3_16 = L3_16.setString
    L3_16(L3_16, "g_filename", "/Game/Event2/mother2.lua")
    L3_16 = sb_mother2
    L3_16 = L3_16.try_init
    L3_16(L3_16)
    L3_16 = sb_mother2
    L3_16 = L3_16.waitForReady
    L3_16(L3_16)
    L3_16 = sb_mother2
    L3_16 = L3_16.setGameObject
    L3_16(L3_16, "soundManager", _sb_soundManager)
    L3_16 = sb_mother2
    L3_16 = L3_16.setGameObject
    L3_16(L3_16, "demoManager", _sb_demoManager)
    L3_16 = sb_mother2
    L3_16 = L3_16.setGameObject
    L3_16(L3_16, "enemyManager", g_own:getGameObject("enemyManager"))
    L3_16 = sb_mother2
    L3_16 = L3_16.try_start
    L3_16(L3_16)
  end
end
function gameOver()
  invokeTask(function()
    HUD:blackout(0)
    Sound:playBgm()
    while not HUD:faderStability() do
      wait()
    end
    _resetHUD()
    _sb_demoManager:sendEvent("reset")
    _sb_soundManager:sendEvent("reset")
    if sb_mother2 then
      sb_mother2:sendEvent("motherExitSandbox")
      GameDatabase:set(ggd.GlobalSystemFlags__AccessIndicator, 0)
      while sb_mother2:getPhase() <= _GOBJ2_Phase_Dead do
        wait()
      end
      sb_mother2 = nil
    end
    print("delete all object...")
    _title = true
    invokeSystemTask(gameStart)
  end)
end
function gameLoad()
  invokeTask(function()
    HUD:blackout(0)
    Sound:playBgm()
    while not HUD:faderStability() do
      wait()
    end
    _resetHUD()
    _sb_demoManager:sendEvent("reset")
    _sb_soundManager:sendEvent("reset")
    if sb_mother2 then
      sb_mother2:sendEvent("motherExitSandbox")
      while sb_mother2:getPhase() <= _GOBJ2_Phase_Dead do
        wait()
      end
      sb_mother2 = nil
    end
    _title = false
    _load = true
    invokeSystemTask(gameStart)
  end)
end
function tokenRewardCallback(A0_17)
  invokeTask(function()
    local L0_18, L2_19, L3_20
    for _FORV_3_ = 1, #L2_19 do
      print(A0_17[_FORV_3_])
      _rewardView("token", A0_17[_FORV_3_])
    end
  end)
end
cache_asset_count = 0
cache_asset_table = {}
eaf_cache_list = {
  "dus01_base",
  "dus01_dash_00",
  "dus01_jump_a_00",
  "dus01_jump_b_00",
  "dus01_jump_c_00",
  "dus01_jump_d_00",
  "dus01_run_00",
  "dus01_sit2stay_00",
  "dus01_sit_00",
  "dus01_stay2sit_00",
  "dus01_stay_00",
  "dus01_turn_l_00",
  "dus01_turn_r_00",
  "dus01_walk_00",
  "fel01_base",
  "fel01_run_00",
  "fel01_run_l_00",
  "fel01_run_r_00",
  "fel02_base",
  "kit01_apple_00",
  "kit01_backflip_00",
  "kit01_backflip_01",
  "kit01_backflip_fly_00",
  "kit01_base",
  "kit01_beh_00",
  "kit01_blackhole_a_00",
  "kit01_blackhole_b_00",
  "kit01_blackhole_c_00",
  "kit01_bow_00",
  "kit01_claphands_00",
  "kit01_crossedlegs_00",
  "kit01_damage_above_middle_00",
  "kit01_damage_l_00",
  "kit01_damage_leg_middle_00",
  "kit01_damage_leg_small_00",
  "kit01_damage_middle_00",
  "kit01_dash_00",
  "kit01_dash_01",
  "kit01_dash_a_00",
  "kit01_dash_b_00",
  "kit01_dash_c_00",
  "kit01_dash_d_00",
  "kit01_dash_e_00",
  "kit01_dash_f_00",
  "kit01_dash_slow_a_00",
  "kit01_dash_slow_b_00",
  "kit01_dash_stop_l_00",
  "kit01_dead_00",
  "kit01_dodge_kick_00",
  "kit01_donut_00",
  "kit01_down_a_00",
  "kit01_down_a_01",
  "kit01_down_b_00",
  "kit01_down_b_01",
  "kit01_down_head_00",
  "kit01_down_roll_00",
  "kit01_fall_head_00",
  "kit01_fall_head_in_00",
  "kit01_fall_head_start_00",
  "kit01_fall_kick_a_00",
  "kit01_fall_kick_b_00",
  "kit01_fall_kick_combo_a_00",
  "kit01_fall_kick_combo_b_00",
  "kit01_fall_kick_combo_finish_a_00",
  "kit01_fall_kick_combo_finish_b_00",
  "kit01_fall_kick_short_fl_00",
  "kit01_fall_kick_short_fr_00",
  "kit01_fall_l_a_00",
  "kit01_fall_l_b_00",
  "kit01_fall_landing_00",
  "kit01_fall_r_a_00",
  "kit01_fall_r_b_00",
  "kit01_fall_turn_00",
  "kit01_feline_change_00",
  "kit01_feline_kick_a_00",
  "kit01_feline_kick_b_00",
  "kit01_feline_stay_00",
  "kit01_felline_dash_00",
  "kit01_float_00",
  "kit01_float_fighting_00",
  "kit01_float_ghost_00",
  "kit01_grasped_00",
  "kit01_greeting_00",
  "kit01_hail_00",
  "kit01_hand_00",
  "kit01_hang_a_00",
  "kit01_hang_b_00",
  "kit01_heavy_damage_middle_00",
  "kit01_heavy_dodge_b_00",
  "kit01_heavy_dodge_f_00",
  "kit01_heavy_dodge_kick_00",
  "kit01_heavy_dodge_l_00",
  "kit01_heavy_dodge_r_00",
  "kit01_heavy_fall_kick_a_00",
  "kit01_heavy_fall_kick_b_00",
  "kit01_heavy_fall_kick_c_00",
  "kit01_heavy_fall_kick_d_00",
  "kit01_heavy_fall_kick_e_00",
  "kit01_heavy_jump_kick_a_00",
  "kit01_heavy_jump_kick_b_00",
  "kit01_heavy_jump_kick_c_00",
  "kit01_heavy_kick_a_00",
  "kit01_heavy_kick_a_01",
  "kit01_heavy_kick_b_00",
  "kit01_heavy_kick_c_00",
  "kit01_heavy_landing_00",
  "kit01_heavy_run_l_00",
  "kit01_heavy_run_r_00",
  "kit01_heavy_run_step_l_00",
  "kit01_heavy_run_step_r_00",
  "kit01_hipattack_00",
  "kit01_inform_00",
  "kit01_jump_a_00",
  "kit01_jump_b_00",
  "kit01_jump_c_00",
  "kit01_jump_d_00",
  "kit01_jump_fall_00",
  "kit01_jump_kick_00",
  "kit01_jump_kick_a_00",
  "kit01_jump_kick_a_hit_00",
  "kit01_jump_kick_hit_00",
  "kit01_jump_kick_quick_00",
  "kit01_jump_kick_quick_hit_00",
  "kit01_jump_kick_quick_landing_00",
  "kit01_kalipose_00",
  "kit01_kick_00",
  "kit01_kick_a_00",
  "kit01_kick_a_01",
  "kit01_kick_a_hit_00",
  "kit01_kick_a_hit_01",
  "kit01_kick_ab_00",
  "kit01_kick_ab_hit_00",
  "kit01_kick_b_00",
  "kit01_kick_b_hit_00",
  "kit01_kick_c_00",
  "kit01_kick_c_hit_00",
  "kit01_kick_d2_00",
  "kit01_kick_d2_hit_00",
  "kit01_kick_d2e_00",
  "kit01_kick_d2e_hit_00",
  "kit01_kick_d_00",
  "kit01_kick_d_hit_00",
  "kit01_kick_e_00",
  "kit01_kick_e_hit_00",
  "kit01_kick_f_00",
  "kit01_kick_f_hit_00",
  "kit01_kick_g_00",
  "kit01_kick_g_hit_00",
  "kit01_kick_gh_00",
  "kit01_kick_gh_hit_00",
  "kit01_kick_h_00",
  "kit01_kick_h_hit_00",
  "kit01_kick_i_00",
  "kit01_kick_i_hit_00",
  "kit01_landing_00",
  "kit01_landing_hard",
  "kit01_landing_head_00",
  "kit01_landing_jump_00",
  "kit01_landing_narrow_00",
  "kit01_landing_norm",
  "kit01_landing_run_01",
  "kit01_landing_run_a_00",
  "kit01_landing_run_b_00",
  "kit01_landing_slide_00",
  "kit01_light_air_kick_bl_00",
  "kit01_light_air_kick_bl_hit_00",
  "kit01_light_air_kick_br_00",
  "kit01_light_air_kick_br_hit_00",
  "kit01_light_air_kick_fl_00",
  "kit01_light_air_kick_fl_hit_00",
  "kit01_light_air_kick_fr_00",
  "kit01_light_air_kick_fr_hit_00",
  "kit01_light_damage_leg_mid_00",
  "kit01_light_damage_middle_00",
  "kit01_light_dash_00",
  "kit01_light_dash_b_00",
  "kit01_light_dodge_00",
  "kit01_light_dodge_hit_00",
  "kit01_light_dodge_kick_00",
  "kit01_light_fall_jump_in_a_00",
  "kit01_light_fall_jump_in_b_00",
  "kit01_light_fall_kick_a_00",
  "kit01_light_fall_kick_b_00",
  "kit01_light_fall_kick_bl_00",
  "kit01_light_fall_kick_bl_hit_00",
  "kit01_light_fall_kick_br_00",
  "kit01_light_fall_kick_br_hit_00",
  "kit01_light_fall_kick_c_00",
  "kit01_light_fall_kick_finish_a_00",
  "kit01_light_fall_kick_finish_b_00",
  "kit01_light_fall_kick_in_00",
  "kit01_light_jump_in_a_00",
  "kit01_light_jump_in_b_00",
  "kit01_light_jump_in_c_00",
  "kit01_light_jump_kick_00",
  "kit01_light_landing_a_00",
  "kit01_light_landing_b_00",
  "kit01_light_roll_00",
  "kit01_light_run_00",
  "kit01_light_run_jump_in_00",
  "kit01_light_run_jump_straight_00",
  "kit01_light_run_jump_straight_attack_00",
  "kit01_light_run_jump_straight_loop_00",
  "kit01_light_run_kick_00",
  "kit01_light_run_kick_hit_00",
  "kit01_light_run_kick_hit_01",
  "kit01_light_run_kick_in_00",
  "kit01_light_run_l_00",
  "kit01_light_run_r_00",
  "kit01_light_run_stop_00",
  "kit01_light_stay_00",
  "kit01_light_stay_in_00",
  "kit01_light_stay_out_00",
  "kit01_meow_00",
  "kit01_modelpose_00",
  "kit01_nage_air_f_00",
  "kit01_nage_f_00",
  "kit01_point_00",
  "kit01_relax_00",
  "kit01_roll_a_00",
  "kit01_roll_b_00",
  "kit01_roll_c_00",
  "kit01_run_dodge_00",
  "kit01_run_down_l_00",
  "kit01_run_down_r_00",
  "kit01_run_hop_00",
  "kit01_run_jump_00",
  "kit01_run_kick_00",
  "kit01_run_kick_hit_00",
  "kit01_run_kick_hit_01",
  "kit01_run_l_00",
  "kit01_run_l_02",
  "kit01_run_r_00",
  "kit01_run_r_02",
  "kit01_run_slow_l_00",
  "kit01_run_slow_r_00",
  "kit01_run_slow_stop_l_00",
  "kit01_run_step_down_l_00",
  "kit01_run_step_down_r_00",
  "kit01_run_step_l_00",
  "kit01_run_step_r_00",
  "kit01_run_stop_00",
  "kit01_run_stop_fighting_00",
  "kit01_run_stop_l_01",
  "kit01_run_stop_wall_00",
  "kit01_salute_00",
  "kit01_shout_00",
  "kit01_sing_00",
  "kit01_skewered_00",
  "kit01_slide_00",
  "kit01_slide_b_00",
  "kit01_slide_f_00",
  "kit01_slide_in_00",
  "kit01_slide_in_l_00",
  "kit01_slide_in_r_00",
  "kit01_slide_kick_00",
  "kit01_slide_l_00",
  "kit01_slide_r_00",
  "kit01_softcream_00",
  "kit01_somersault_kick_00",
  "kit01_spiralclaw_a_00",
  "kit01_spiralclaw_b_00",
  "kit01_spiralclaw_c_00",
  "kit01_stay_00",
  "kit01_stay_fighting_00",
  "kit01_stay_fighting_in_00",
  "kit01_stay_fighting_out_00",
  "kit01_stay_heat_00",
  "kit01_stay_l_00",
  "kit01_stay_narrow_00",
  "kit01_stay_narrow_in_00",
  "kit01_stay_r_00",
  "kit01_stay_slope_00",
  "kit01_stay_slope_in_00",
  "kit01_stay_slope_in_b_00",
  "kit01_stay_slope_in_l_00",
  "kit01_stay_slope_l_00",
  "kit01_stay_slope_r_00",
  "kit01_storm_00",
  "kit01_touch_00",
  "kit01_turn_00",
  "kit01_walk_l_00",
  "kit01_walk_r_00",
  "kit01_walk_start_00",
  "kit01_walk_stop_00",
  "kit01_wall_jump_l_a_00",
  "kit01_wall_jump_l_b_00",
  "kit01_wall_jump_l_c_00",
  "kit01_wall_jump_l_d_00",
  "brd01_base",
  "brd01_eat_00",
  "brd01_fly_00",
  "brd01_landing_00",
  "brd01_stay_00",
  "brd01_takeoff_00",
  "chi01_balloon_stay_00",
  "chi01_balloon_walk_00",
  "chi01_beckon_00",
  "chi01_cry_00",
  "chi01_cry_in_00",
  "chi01_cry_out_00",
  "chi01_dash_00",
  "chi01_down_a_00",
  "chi01_down_a_01",
  "chi01_down_b_00",
  "chi01_down_b_01",
  "chi01_down_c_00",
  "chi01_down_c_01",
  "chi01_down_steped_00",
  "chi01_down_steped_01",
  "chi01_eat_meat_00",
  "chi01_eye_blink_00",
  "chi01_fall_00",
  "chi01_fall_01",
  "chi01_fp_balloon_00",
  "chi01_fp_drink_00",
  "chi01_fp_flyer_00",
  "chi01_fp_food_00",
  "chi01_fp_magichand_00",
  "chi01_fp_softcream_00",
  "chi01_fp_stick_00",
  "chi01_greeting_00",
  "chi01_groggy_00",
  "chi01_groggy_01",
  "chi01_groggy_in_00",
  "chi01_groggy_in_01",
  "chi01_handclap_00",
  "chi01_hit_b_00",
  "chi01_hit_b_r_00",
  "chi01_hit_f_00",
  "chi01_hit_f_r_00",
  "chi01_idle_bu_00",
  "chi01_idle_dt_01",
  "chi01_idle_ep10_00",
  "chi01_idle_ep13_00",
  "chi01_idle_ep23_00",
  "chi01_idle_lo_00",
  "chi01_idle_po_00",
  "chi01_idle_po_01",
  "chi01_idle_up_00",
  "chi01_idle_up_01",
  "chi01_inform_ex_00",
  "chi01_inform_ex_in_00",
  "chi01_inform_ex_out_00",
  "chi01_land_00",
  "chi01_lean_00",
  "chi01_lean_01",
  "chi01_listen_00",
  "chi01_lookaround_00",
  "chi01_lookaround_01",
  "chi01_lookup_00",
  "chi01_magichand_00",
  "chi01_merry_00",
  "chi01_photo_00",
  "chi01_photo_01",
  "chi01_photo_02",
  "chi01_proud_00",
  "chi01_reaction_boo_00",
  "chi01_reaction_goo_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_reaction_ship_00",
  "chi01_regret_00",
  "chi01_relax_00",
  "chi01_reply_no_00",
  "chi01_reply_unknown_00",
  "chi01_reply_yes_00",
  "chi01_run_00",
  "chi01_run_01",
  "chi01_run_afraid_00",
  "chi01_run_afraid_01",
  "chi01_run_down_00",
  "chi01_sad_00",
  "chi01_scared_00",
  "chi01_scared_nevy_00",
  "chi01_scared_nevy_in_00",
  "chi01_scared_nevy_out_00",
  "chi01_shock_00",
  "chi01_sit_00",
  "chi01_sit_01",
  "chi01_sit_02",
  "chi01_sit_floor_00",
  "chi01_sit_floor_01",
  "chi01_sit_floor_02",
  "chi01_sit_floor_in_00",
  "chi01_sit_floor_out_00",
  "chi01_sit_in_00",
  "chi01_sit_in_01",
  "chi01_sit_in_02",
  "chi01_sit_out_00",
  "chi01_sit_out_01",
  "chi01_sit_out_02",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_00",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_sit_ship_01",
  "chi01_slide_00",
  "chi01_slide_03",
  "chi01_sq_magichand_00",
  "chi01_stay_00",
  "chi01_stay_01",
  "chi01_stay_02",
  "chi01_stay_03",
  "chi01_stay_line_00",
  "chi01_stay_line_01",
  "chi01_stoop_00",
  "chi01_stoop_in_00",
  "chi01_stoop_out_00",
  "chi01_stretch_00",
  "chi01_surprise_00",
  "chi01_surprise_01",
  "chi01_talk_00",
  "chi01_talk_01",
  "chi01_talk_angry_00",
  "chi01_talk_laugh_00",
  "chi01_talk_sad_00",
  "chi01_turn_90_l_00",
  "chi01_turn_90_r_00",
  "chi01_turn_l_00",
  "chi01_turn_r_00",
  "chi01_walk_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wave_hand_ship_00",
  "chi01_wavehand_00",
  "dog01_bark_00",
  "dog01_base",
  "dog01_down_00",
  "dog01_down_in_00",
  "dog01_down_out_00",
  "dog01_fall_00",
  "dog01_glad_00",
  "dog01_rest_00",
  "dog01_rest_in_00",
  "dog01_rest_out_00",
  "dog01_run_00",
  "dog01_scratch_00",
  "dog01_sit_00",
  "dog01_sit_in_00",
  "dog01_sit_out_00",
  "dog01_stay_00",
  "dog01_turn_l_00",
  "dog01_turn_r_00",
  "dog01_walk_00",
  "duck01_base",
  "duck01_fall_00",
  "duck01_fly_00",
  "duck01_land_00",
  "duck01_quack_00",
  "duck01_run_00",
  "duck01_run_01",
  "duck01_stay_00",
  "duck01_stay_01",
  "duck01_surprise_00",
  "duck01_turn_l_00",
  "duck01_turn_r_00",
  "duck01_walk_00",
  "gull01_base",
  "gull01_eat_00",
  "gull01_fly_00",
  "gull01_fly_01",
  "gull01_landing_00",
  "gull01_stay_00",
  "gull01_stay_01",
  "gull01_stay_02",
  "gull01_takeoff_00",
  "man01_accordion_00",
  "man01_attack_00",
  "man01_balloon_sell_00",
  "man01_balloon_stay_00",
  "man01_betimid_sm12_00",
  "man01_buyer_idle_00",
  "man01_bye_00",
  "man01_call_00",
  "man01_call_in_00",
  "man01_call_out_00",
  "man01_check_00",
  "man01_check_01",
  "man01_check_in_00",
  "man01_check_out_00",
  "man01_cheer_soft_00",
  "man01_cleaning_00",
  "man01_cook_yakitori_00",
  "man01_count_00",
  "man01_crane_00",
  "man01_damage_middle_b_00",
  "man01_damage_middle_f_00",
  "man01_damage_small_b_00",
  "man01_damage_small_f_00",
  "man01_dash_00",
  "man01_down_a_00",
  "man01_down_a_01",
  "man01_down_b_00",
  "man01_down_b_01",
  "man01_down_c_00",
  "man01_down_c_01",
  "man01_down_steped_00",
  "man01_down_steped_01",
  "man01_drunk_walk_00",
  "man01_eye_blink_00",
  "man01_fall_00",
  "man01_fall_01",
  "man01_feeding_pigeon_00",
  "man01_fp_bag_00",
  "man01_fp_balloon_00",
  "man01_fp_book_00",
  "man01_fp_drink_00",
  "man01_fp_flyer_00",
  "man01_fp_food_00",
  "man01_fp_gun_00",
  "man01_fp_softcream_00",
  "man01_fp_stick_00",
  "man01_gaming_00",
  "man01_gaming_01",
  "man01_getup_back_00",
  "man01_greeting_00",
  "man01_groggy_00",
  "man01_groggy_01",
  "man01_groggy_in_00",
  "man01_groggy_in_01",
  "man01_handclap_00",
  "man01_hit_b_00",
  "man01_hit_b_r_00",
  "man01_hit_f_00",
  "man01_hit_f_r_00",
  "man01_idle_00",
  "man01_idle_bu_00",
  "man01_idle_bu_01",
  "man01_idle_dt_01",
  "man01_idle_dt_02",
  "man01_idle_lo_01",
  "man01_idle_lo_02",
  "man01_idle_po_01",
  "man01_idle_up_00",
  "man01_idle_up_02",
  "man01_inform_00",
  "man01_inform_ex_00",
  "man01_inform_ex_in_00",
  "man01_inform_ex_out_00",
  "man01_inform_in_00",
  "man01_inform_out_00",
  "man01_land_00",
  "man01_lean_00",
  "man01_lean_01",
  "man01_lookaround_00",
  "man01_lookaround_01",
  "man01_lookaround_02",
  "man01_lookaround_03",
  "man01_lookaround_in_00",
  "man01_lookaround_in_02",
  "man01_lookaround_out_00",
  "man01_lookaround_out_02",
  "man01_lookback_00",
  "man01_lookback_01",
  "man01_lookback_in_00",
  "man01_lookback_in_01",
  "man01_lookback_out_00",
  "man01_lookback_out_01",
  "man01_lookup_00",
  "man01_lookup_in_00",
  "man01_lookup_out_00",
  "man01_merry_00",
  "man01_photo_00",
  "man01_photo_01",
  "man01_photo_02",
  "man01_photo_03",
  "man01_photo_couple_00",
  "man01_photo_couple_in_00",
  "man01_photo_couple_out_00",
  "man01_play_guitar_00",
  "man01_play_violin_00",
  "man01_porter_stay_00",
  "man01_porter_walk_00",
  "man01_porter_walk_01",
  "man01_reaction_boo_00",
  "man01_reaction_goo_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reaction_ship_00",
  "man01_reply_no_00",
  "man01_reply_unknown_00",
  "man01_reply_yes_00",
  "man01_rudder_00",
  "man01_run_00",
  "man01_run_01",
  "man01_run_afraid_00",
  "man01_run_afraid_01",
  "man01_run_down_00",
  "man01_scared_00",
  "man01_scared_01",
  "man01_scared_02",
  "man01_scared_03",
  "man01_scared_04",
  "man01_scared_05",
  "man01_scared_in_00",
  "man01_scared_nevy_00",
  "man01_scared_nevy_in_00",
  "man01_scared_nevy_out_00",
  "man01_scared_out_00",
  "man01_shock_00",
  "man01_shock_in_00",
  "man01_shock_out_00",
  "man01_sit_00",
  "man01_sit_01",
  "man01_sit_02",
  "man01_sit_floor_00",
  "man01_sit_floor_01",
  "man01_sit_floor_02",
  "man01_sit_floor_in_00",
  "man01_sit_floor_in_01",
  "man01_sit_floor_in_02",
  "man01_sit_floor_out_00",
  "man01_sit_floor_out_01",
  "man01_sit_floor_out_02",
  "man01_sit_in_00",
  "man01_sit_in_01",
  "man01_sit_in_02",
  "man01_sit_in_turn_00",
  "man01_sit_out_00",
  "man01_sit_out_01",
  "man01_sit_out_02",
  "man01_sit_ship_00",
  "man01_sit_ship_01",
  "man01_sit_table_00",
  "man01_sit_table_01",
  "man01_sit_table_in_00",
  "man01_sit_table_in_01",
  "man01_sit_table_out_00",
  "man01_sit_table_out_01",
  "man01_sit_up_00",
  "man01_slide_00",
  "man01_slide_03",
  "man01_snatcher_01",
  "man01_snatcher_arrest_00",
  "man01_speech_00",
  "man01_stay_00",
  "man01_stay_01",
  "man01_stay_02",
  "man01_stay_line_00",
  "man01_stay_line_01",
  "man01_stay_rescued_00",
  "man01_step_down_00",
  "man01_step_up_00",
  "man01_stoop_00",
  "man01_stoop_in_00",
  "man01_stoop_out_00",
  "man01_surprise_00",
  "man01_surprise_01",
  "man01_talk_00",
  "man01_talk_01",
  "man01_talk_02",
  "man01_talk_03",
  "man01_talk_04",
  "man01_talk_angry_00",
  "man01_talk_angry_01",
  "man01_talk_angry_02",
  "man01_talk_laugh_00",
  "man01_talk_laugh_01",
  "man01_talk_laugh_02",
  "man01_talk_sad_00",
  "man01_talk_sad_01",
  "man01_talk_sad_02",
  "man01_threat_00",
  "man01_threat_01",
  "man01_trouble_00",
  "man01_turn_90_l_00",
  "man01_turn_90_r_00",
  "man01_turn_l_00",
  "man01_turn_r_00",
  "man01_twist_left_00_add",
  "man01_twist_right_00_add",
  "man01_twist_up_00_add",
  "man01_vbike01_stay_00",
  "man01_vbike01_stay_l_in_00",
  "man01_vbike01_stay_l_out_00",
  "man01_vcar01_stay_00",
  "man01_vendor_angry_00",
  "man01_vendor_attract_00",
  "man01_vendor_attract_sq_00",
  "man01_vendors_skewered_00",
  "man01_walk_00",
  "man01_walk_b_00",
  "man01_walk_l_00",
  "man01_walk_l_loop_00",
  "man01_walk_r_00",
  "man01_walk_r_loop_00",
  "man01_watching_soft_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wave_hand_ship_00",
  "man01_wavehand_far_00",
  "man01_wavehand_near_00",
  "wom01_angry_00",
  "wom01_breath_00",
  "wom01_buyer_idle_00",
  "wom01_call_00",
  "wom01_caress_00",
  "wom01_cheer_soft_00",
  "wom01_damage_middle_b_00",
  "wom01_damage_middle_f_00",
  "wom01_damage_small_b_00",
  "wom01_damage_small_f_00",
  "wom01_dash_00",
  "wom01_down_a_00",
  "wom01_down_a_01",
  "wom01_down_b_00",
  "wom01_down_b_01",
  "wom01_down_c_00",
  "wom01_down_c_01",
  "wom01_down_steped_00",
  "wom01_down_steped_01",
  "wom01_fall_00",
  "wom01_fall_01",
  "wom01_fp_bag_00",
  "wom01_fp_balloon_00",
  "wom01_fp_book_00",
  "wom01_fp_drink_00",
  "wom01_fp_flyer_00",
  "wom01_fp_food_00",
  "wom01_fp_softcream_00",
  "wom01_fp_stick_00",
  "wom01_getup_back_00",
  "wom01_greeting_00",
  "wom01_greeting_sq_00",
  "wom01_groggy_00",
  "wom01_groggy_01",
  "wom01_groggy_in_00",
  "wom01_groggy_in_01",
  "wom01_handclap_00",
  "wom01_hit_b_00",
  "wom01_hit_b_r_00",
  "wom01_hit_f_00",
  "wom01_hit_f_r_00",
  "wom01_idle_bu_00",
  "wom01_idle_bu_01",
  "wom01_idle_bu_02",
  "wom01_idle_dt_00",
  "wom01_idle_dt_01",
  "wom01_idle_po_00",
  "wom01_idle_po_01",
  "wom01_idle_po_02",
  "wom01_idle_up_00",
  "wom01_idle_up_01",
  "wom01_idle_up_02",
  "wom01_inform_00",
  "wom01_inform_ex_00",
  "wom01_inform_ex_in_00",
  "wom01_inform_ex_out_00",
  "wom01_inform_in_00",
  "wom01_inform_nevy_00",
  "wom01_inform_nevy_01",
  "wom01_inform_out_00",
  "wom01_land_00",
  "wom01_lean_00",
  "wom01_lean_01",
  "wom01_listen_00",
  "wom01_lookaround_00",
  "wom01_lookaround_01",
  "wom01_lookback_00",
  "wom01_lookback_01",
  "wom01_lookback_in_00",
  "wom01_lookback_in_01",
  "wom01_lookback_out_00",
  "wom01_lookback_out_01",
  "wom01_lookup_00",
  "wom01_lookup_in_00",
  "wom01_lookup_out_00",
  "wom01_merry_00",
  "wom01_photo_00",
  "wom01_photo_01",
  "wom01_photo_02",
  "wom01_photo_03",
  "wom01_photo_couple_00",
  "wom01_photo_couple_in_00",
  "wom01_photo_couple_out_00",
  "wom01_pray_00",
  "wom01_pray_in_00",
  "wom01_pray_out_00",
  "wom01_reaction_boo_00",
  "wom01_reaction_goo_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_ship_00",
  "wom01_reaction_sq_boo_00",
  "wom01_reaction_sq_goo_00",
  "wom01_reply_no_00",
  "wom01_reply_unknown_00",
  "wom01_reply_yes_00",
  "wom01_run_00",
  "wom01_run_afraid_00",
  "wom01_run_afraid_01",
  "wom01_run_down_00",
  "wom01_scared_00",
  "wom01_scared_01",
  "wom01_scared_02",
  "wom01_scared_03",
  "wom01_scared_04",
  "wom01_scared_nevy_00",
  "wom01_scared_nevy_in_00",
  "wom01_scared_nevy_out_00",
  "wom01_search_00",
  "wom01_shock_00",
  "wom01_shock_in_00",
  "wom01_shock_out_00",
  "wom01_sit_00",
  "wom01_sit_01",
  "wom01_sit_in_00",
  "wom01_sit_in_01",
  "wom01_sit_in_turn_00",
  "wom01_sit_out_00",
  "wom01_sit_out_01",
  "wom01_sit_ship_00",
  "wom01_sit_ship_00",
  "wom01_sit_ship_01",
  "wom01_sit_ship_01",
  "wom01_slide_00",
  "wom01_slide_03",
  "wom01_snatched_00",
  "wom01_stay_00",
  "wom01_stay_01",
  "wom01_stay_02",
  "wom01_stay_03",
  "wom01_stay_line_00",
  "wom01_stay_line_01",
  "wom01_stay_rescued_00",
  "wom01_stay_rescued_01",
  "wom01_stoop_00",
  "wom01_stoop_in_00",
  "wom01_stoop_out_00",
  "wom01_surprise_00",
  "wom01_surprise_01",
  "wom01_talk_00",
  "wom01_talk_01",
  "wom01_talk_02",
  "wom01_talk_03",
  "wom01_talk_angry_00",
  "wom01_talk_angry_01",
  "wom01_talk_angry_02",
  "wom01_talk_cid_00",
  "wom01_talk_cid_01",
  "wom01_talk_cid_02",
  "wom01_talk_cid_03",
  "wom01_talk_laugh_00",
  "wom01_talk_laugh_01",
  "wom01_talk_laugh_02",
  "wom01_talk_sad_00",
  "wom01_talk_sad_01",
  "wom01_talk_sad_02",
  "wom01_trouble_00",
  "wom01_turn_90_l_00",
  "wom01_turn_90_r_00",
  "wom01_turn_l_00",
  "wom01_turn_r_00",
  "wom01_twist_left_00_add",
  "wom01_twist_right_00_add",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vbike01_stay_sm21_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vcar01_stay_00",
  "wom01_vendor_angry_00",
  "wom01_vendor_attract_00",
  "wom01_vendor_attract_sq_00",
  "wom01_walk_00",
  "wom01_walk_b_00",
  "wom01_watching_soft_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wave_hand_ship_00",
  "wom01_wavehand_far_00",
  "wom01_wavehand_near_00"
}
gfx_cache_list = {
  "ciapple10_base",
  "ciapple11_base",
  "cifood10_base",
  "cifood11_base",
  "cifood12_base",
  "ciphoto10_base",
  "ciskewered10_base",
  "ciskewered11_base",
  "ciskewered12_base",
  "ciskewered13_base",
  "cisoftcream10_base",
  "cisoftcream11_base",
  "cisoftcream12_base",
  "dus01_base",
  "ef_com_lgt_08",
  "ef_fe_kubi_01",
  "ef_fe_rasen",
  "ef_fel03_head_parts01",
  "ef_fel_atk_01",
  "ef_garu_kick_hsp_01",
  "ef_garu_leg_crow_01",
  "ef_garuda_head_01",
  "ef_gllow_line_01",
  "ef_gllow_line_02",
  "ef_nev_blr_01",
  "ef_pl_bk_lgt_01m",
  "ef_pl_foot_01",
  "ef_pl_foot_02",
  "ef_pl_foot_03",
  "ef_pl_foot_04m",
  "ef_pl_grd_01",
  "ef_pl_hensin_00",
  "ef_pl_hensin_01",
  "ef_pl_hensin_02",
  "ef_pl_lgt_01",
  "ef_pl_wtr_hole_01m",
  "ef_prt_ball_03",
  "ef_prt_brick_01",
  "ef_prt_cone_02",
  "ef_prt_disc_03",
  "ef_prt_disc_05",
  "ef_prt_disc_06",
  "ef_prt_ftl_cir_01",
  "ef_prt_ftl_pln_04",
  "ef_prt_ftl_trnd_02",
  "ef_prt_gravityore_01",
  "ef_prt_grn03_01",
  "ef_prt_grn03_02",
  "ef_prt_grn03_03",
  "ef_prt_ita_01",
  "ef_prt_ita_07",
  "ef_prt_ita_12",
  "ef_prt_ita_13",
  "ef_prt_ita_14",
  "ef_prt_mline_01",
  "ef_prt_own_01",
  "ef_prt_own_02",
  "ef_prt_own_04",
  "ef_prt_own_05",
  "ef_prt_own_08",
  "ef_prt_own_09",
  "ef_prt_rig_01",
  "ef_prt_rockspw_01",
  "ef_prt_spark_line_01",
  "ef_prt_spark_line_02",
  "ef_prt_spark_line_03",
  "ef_prt_spark_line_04",
  "ef_prt_spark_line_l_01",
  "ef_prt_spark_line_l_02",
  "ef_prt_spark_line_l_03",
  "ef_prt_spark_line_m_01",
  "ef_prt_spark_line_m_02",
  "ef_prt_spwdsc_01",
  "ef_prt_torus_01",
  "ef_prt_torus_02",
  "ef_prt_uvdsc_01",
  "ef_prt_uvdsc_06",
  "ef_prt_wind_01",
  "ef_prt_wind_02",
  "ef_prt_wod01_01",
  "ef_prt_wod01_02",
  "ef_prt_wod01_03",
  "ef_shpere_fe_change01",
  "ef_spark_line_01",
  "ef_spark_line_02",
  "ef_spark_line_03",
  "ef_spark_line_04",
  "ef_spark_line_a",
  "eff_pl_72",
  "eff_pl_73",
  "fel01_base",
  "fel02_base",
  "kit01_base",
  "light_point",
  "scene_effectors"
}
pfx_cache_list = {
  "ef_com_deb_02.pfx",
  "ef_com_fgsmk_01.pfx",
  "ef_com_grnpar_01.pfx",
  "ef_com_spk_01.pfx",
  "ef_com_wtr_06.pfx",
  "ef_com_wtr_07.pfx",
  "ef_com_wtr_08.pfx",
  "ef_com_wtr_09.pfx",
  "ef_com_wtr_10.pfx",
  "ef_com_wtr_11.pfx",
  "ef_com_wtr_13.pfx",
  "ef_crw_engball_02.pfx",
  "ef_crw_engball_03.pfx",
  "ef_crw_hit_01.pfx",
  "ef_crw_lgttam_01.pfx",
  "ef_dm_spark_02.pfx",
  "ef_dspar_01.pfx",
  "ef_dspar_02.pfx",
  "ef_fe_atk_01.pfx",
  "ef_fe_atk_02.pfx",
  "ef_fe_head_01.pfx",
  "ef_fe_hit_01.pfx",
  "ef_fe_hit_02.pfx",
  "ef_fe_par_01.pfx",
  "ef_fe_par_02.pfx",
  "ef_fe_par_03.pfx",
  "ef_fe_par_09.pfx",
  "ef_fe_par_10.pfx",
  "ef_fe_par_11.pfx",
  "ef_fe_par_12.pfx",
  "ef_fe_par_13.pfx",
  "ef_fe_par_14.pfx",
  "ef_fe_par_15.pfx",
  "ef_fe_par_16.pfx",
  "ef_fe_par_17.pfx",
  "ef_fe_par_18.pfx",
  "ef_fe_par_19.pfx",
  "ef_fe_par_20.pfx",
  "ef_fe_par_21.pfx",
  "ef_fe_par_22.pfx",
  "ef_fe_par_23.pfx",
  "ef_fe_tam_01.pfx",
  "ef_ga_par_01.pfx",
  "ef_ga_par_02.pfx",
  "ef_ga_par_03.pfx",
  "ef_ga_par_04.pfx",
  "ef_ga_par_05.pfx",
  "ef_ga_par_06.pfx",
  "ef_ga_par_07.pfx",
  "ef_ga_par_08.pfx",
  "ef_ga_par_09.pfx",
  "ef_ga_par_10.pfx",
  "ef_ga_par_11.pfx",
  "ef_ga_par_12.pfx",
  "ef_gd_hit_01.pfx",
  "ef_gd_tam_01.pfx",
  "ef_gmk_gem_01.pfx",
  "ef_gmk_gem_03.pfx",
  "ef_gmk_gem_04.pfx",
  "ef_gmk_gem_06.pfx",
  "ef_gmk_gemget_02.pfx",
  "ef_gmk_gemget_03.pfx",
  "ef_gmk_gemget_04.pfx",
  "ef_gmk_gemget_06.pfx",
  "ef_hum_hit_02.pfx",
  "ef_nev_corehit_01.pfx",
  "ef_nev_death.pfx",
  "ef_pl_aura_01.pfx",
  "ef_pl_aura_02.pfx",
  "ef_pl_ball_01.pfx",
  "ef_pl_bk_in.pfx",
  "ef_pl_bk_out.pfx",
  "ef_pl_deb_16.pfx",
  "ef_pl_deb_17.pfx",
  "ef_pl_deb_18.pfx",
  "ef_pl_deb_20.pfx",
  "ef_pl_deb_22.pfx",
  "ef_pl_dis_02.pfx",
  "ef_pl_disc_02.pfx",
  "ef_pl_dsk_01.pfx",
  "ef_pl_foot_00.pfx",
  "ef_pl_foot_01_par.pfx",
  "ef_pl_grb_body.pfx",
  "ef_pl_grb_spw.pfx",
  "ef_pl_hand_00.pfx",
  "ef_pl_hensin_00_par.pfx",
  "ef_pl_hensin_01_par.pfx",
  "ef_pl_hensin_02_par.pfx",
  "ef_pl_hit_01.pfx",
  "ef_pl_hit_02.pfx",
  "ef_pl_hit_04.pfx",
  "ef_pl_hit_gravityore.pfx",
  "ef_pl_kick01_01.pfx",
  "ef_pl_kick01_02.pfx",
  "ef_pl_kick01_03.pfx",
  "ef_pl_kick01_04.pfx",
  "ef_pl_kick01_05.pfx",
  "ef_pl_kick_01.pfx",
  "ef_pl_kick_01sc.pfx",
  "ef_pl_lgttam_01.pfx",
  "ef_pl_line_01.pfx",
  "ef_pl_micro_bk_01.pfx",
  "ef_pl_micro_bk_02.pfx",
  "ef_pl_micro_bk_03.pfx",
  "ef_pl_micro_bk_04.pfx",
  "ef_pl_micro_bk_06.pfx",
  "ef_pl_micro_bk_07.pfx",
  "ef_pl_micro_bk_08.pfx",
  "ef_pl_micro_bk_13.pfx",
  "ef_pl_nml_body.pfx",
  "ef_pl_own_01.pfx",
  "ef_pl_own_02.pfx",
  "ef_pl_own_03.pfx",
  "ef_pl_own_04.pfx",
  "ef_pl_own_05.pfx",
  "ef_pl_par_01.pfx",
  "ef_pl_par_02.pfx",
  "ef_pl_par_03.pfx",
  "ef_pl_par_04.pfx",
  "ef_pl_par_05.pfx",
  "ef_pl_par_06.pfx",
  "ef_pl_par_07.pfx",
  "ef_pl_piz_01.pfx",
  "ef_pl_sctd_01.pfx",
  "ef_pl_smk_06.pfx",
  "ef_pl_smk_07.pfx",
  "ef_pl_smk_08.pfx",
  "ef_pl_smk_10.pfx",
  "ef_pl_spk_01.pfx",
  "ef_pl_spk_05.pfx",
  "ef_pl_swdsc_01.pfx",
  "ef_pl_trl_02.pfx",
  "ef_pl_typhoon_01.pfx",
  "ef_pl_typhoon_02.pfx",
  "ef_pl_typhoon_03.pfx",
  "ef_pl_typhoon_04.pfx",
  "ef_pl_typhoon_05.pfx",
  "ef_pl_vtx_body.pfx",
  "ef_pl_vtx_hit_01.pfx",
  "ef_pl_vtx_hit_02.pfx",
  "ef_ply_trl_01.pfx",
  "ef_ui_chg_01.pfx",
  "ef_ui_jkpar_01.pfx",
  "ef_ui_smk_01.pfx",
  "eff_pl_54.pfx"
}
pfx_tex_cache_list = {
  "fxt_atk_line_01_bc4.gnf",
  "fxt_atk_uv_01_bc4.gnf",
  "fxt_ball_01_bc4.gnf",
  "fxt_ball_02_bc4.gnf",
  "fxt_ball_06_bc4.gnf",
  "fxt_ftl_bg_02_bc7.gnf",
  "fxt_gradation_02_bc7.gnf",
  "fxt_gradation_08_bc4.gnf",
  "fxt_line_04_bc4.gnf",
  "fxt_line_09_bc7.gnf",
  "fxt_line_10_bc7.gnf",
  "fxt_noize_01_bc4.gnf",
  "fxt_normal_01_bc5.gnf",
  "fxt_normal_02_bc5.gnf",
  "fxt_normal_03_bc5.gnf",
  "fxt_normal_05_bc5.gnf",
  "fxt_normal_06_bc5.gnf",
  "fxt_normal_07_bc5.gnf",
  "fxt_normal_08_bc5.gnf",
  "fxt_normal_09_bc5.gnf",
  "fxt_normal_10_bc5.gnf",
  "fxt_normal_11_bc5.gnf",
  "fxt_normal_12_bc5.gnf",
  "fxt_normal_13_bc5.gnf",
  "fxt_normal_15_bc5.gnf",
  "fxt_normal_16_bc5.gnf",
  "fxt_normal_19_bc5.gnf",
  "fxt_normal_22_bc5.gnf",
  "fxt_normal_23_bc5.gnf",
  "fxt_plz_01_bc7.gnf",
  "fxt_plz_02_bc7.gnf",
  "fxt_plz_03_bc7.gnf",
  "fxt_rainbow_01_bc7.gnf",
  "fxt_rig_13_bc4.gnf",
  "fxt_rndprt_00_bc4.gnf",
  "fxt_rndprt_02_bc4.gnf",
  "fxt_sai_00_bc4.gnf",
  "fxt_smk_03_bc4.gnf",
  "fxt_smk_04_bc4.gnf",
  "fxt_smk_05_bc4.gnf",
  "fxt_smk_06_bc4.gnf",
  "fxt_smk_07_bc4.gnf",
  "fxt_smk_08_bc4.gnf",
  "fxt_smk_09_bc4.gnf",
  "fxt_smk_10_bc4.gnf",
  "fxt_smkuv_02_bc4.gnf",
  "fxt_smkuv_04_bc4.gnf",
  "fxt_smkuv_05_bc4.gnf",
  "fxt_spark_line_01_bc4.gnf",
  "fxt_spk_01_bc4.gnf",
  "fxt_spk_04_bc4.gnf",
  "fxt_spk_05_bc4.gnf",
  "fxt_spk_06_bc4.gnf",
  "fxt_spk_07_bc4.gnf",
  "fxt_spk_08_bc4.gnf",
  "fxt_spk_09_bc4.gnf",
  "fxt_spk_10_bc4.gnf",
  "fxt_spk_11_bc4.gnf",
  "fxt_spk_12_bc4.gnf",
  "fxt_spk_13_bc4.gnf",
  "fxt_spread_01_bc4.gnf",
  "fxt_unv_03_bc7.gnf",
  "fxt_uv_02_bc4.gnf",
  "fxt_uv_03_bc4.gnf",
  "fxt_uv_04_bc4.gnf",
  "fxt_uv_06_bc4.gnf",
  "fxt_uv_07_bc4.gnf",
  "fxt_uv_09_bc4.gnf",
  "fxt_uv_10_bc4.gnf",
  "fxt_uv_11_bc4.gnf",
  "fxt_uv_13_bc4.gnf",
  "fxt_uv_15_bc4.gnf",
  "fxt_uv_16_bc4.gnf",
  "fxt_uv_17_bc4.gnf",
  "fxt_uv_18_bc4.gnf",
  "fxt_uv_19_bc4.gnf",
  "fxt_uv_20_bc4.gnf",
  "fxt_uv_22_bc4.gnf",
  "fxt_uv_23_bc4.gnf",
  "fxt_uv_24_bc4.gnf",
  "fxt_uv_25_bc4.gnf",
  "fxt_uv_26_bc4.gnf",
  "fxt_uv_31_bc4.gnf",
  "fxt_uv_38_bc4.gnf",
  "fxt_uv_39_bc4.gnf",
  "fxt_uv_42_bc4.gnf",
  "fxt_uv_43_bc4.gnf",
  "fxt_uv_47_bc4.gnf",
  "fxt_uv_54_bc4.gnf",
  "ptx_hit_01_cl.gnf",
  "ptx_iwa_00.gnf",
  "ptx_normal_02_nm.gnf",
  "ptx_normal_03_nm.gnf",
  "ptx_normal_07_nm.gnf",
  "ptx_normal_15_nm.gnf",
  "ptx_normal_16_nm.gnf",
  "ptx_normal_22_nm.gnf",
  "ptx_smk_03_cl.gnf",
  "ptx_smk_07_cl.gnf",
  "ptx_smkuv_04_cl.gnf",
  "ptx_spk_09_cl.gnf",
  "ptx_uv_03_cl.gnf",
  "ptx_uv_10_cl.gnf",
  "ptx_uv_16_cl.gnf",
  "ptx_uv_19_cl.gnf",
  "ptx_uv_20_cl.gnf",
  "ptx_uv_25_cl.gnf",
  "ptx_uv_31_cl.gnf",
  "ptx_uv_42_cl.gnf",
  "ptx_uv_44_cl.gnf"
}
tex_cache_list = {
  "0=cifood01_nml",
  "0=decal_md_07_n",
  "0=etx_grd_01_nm",
  "0=etx_kit_foot01_nm",
  "0=etx_noize_02_cl",
  "0=etx_normal_07_nm",
  "0=etx_normal_16_nm",
  "0=etx_uv_02_cl",
  "0=etx_uv_03_cl",
  "0=etx_uv_10_cl",
  "0=etx_uv_22_cl",
  "0=etx_uv_37_cl",
  "0=etx_uv_38_cl",
  "0=fxt_ftl_01_bc4",
  "0=fxt_grd_01_bc5",
  "0=kit01_armor_heavy_nml",
  "0=kit01_armor_light_nml",
  "0=kit01_body_nml",
  "0=kit01_face_nml",
  "1=chara_detail_01",
  "1=chara_detail_02",
  "1=chara_reflection_01",
  "1=cifood01",
  "1=cifoods_01",
  "1=ciphoto01",
  "1=cisoftcream01",
  "1=decal_md_07_ca",
  "1=dus01_body02_interior",
  "1=dus01_body03_interior",
  "1=dus01_body04_interior",
  "1=dus01_body_interior",
  "1=etx_ball_03_cl",
  "1=etx_ball_04_cl",
  "1=etx_grd_01_cl",
  "1=etx_kit_foot01_cl",
  "1=eye_reflection",
  "1=fxt_grd_01_bc7",
  "1=fxt_grd_02_bc7",
  "1=fxt_siro_bc4",
  "1=fxt_uv_26_bc4",
  "1=gravityore_md_01_c",
  "1=kit01_armor_heavy",
  "1=kit01_armor_light",
  "1=kit01_body",
  "1=kit01_eye_01",
  "1=kit01_face_00",
  "1=kit01_face_01",
  "1=kit01_face_01_02",
  "1=kit01_face_01_03",
  "1=kit01_face_02",
  "1=kit01_face_02_02",
  "1=kit01_face_02_03",
  "1=kit01_face_03",
  "1=kit01_face_04",
  "1=kit01_face_04_02",
  "1=kit01_face_04_03",
  "1=kit01_face_05",
  "1=kit01_face_05_02",
  "1=kit01_face_05_03",
  "1=kit01_face_06",
  "1=kit01_face_06_02",
  "1=kit01_face_06_03",
  "1=kit01_face_07",
  "1=kit01_face_07_02",
  "1=kit01_face_07_03",
  "1=kit01_face_08",
  "1=kit01_face_09",
  "1=kit01_face_10",
  "1=kit01_face_11",
  "1=kit01_face_12",
  "1=kit01_face_13",
  "1=kit01_face_14",
  "1=kit01_face_15",
  "1=kit01_face_16",
  "1=kit01_inner",
  "1=vision_d_00",
  "1=vision_d_01",
  "1=vision_d_02",
  "1=vision_d_03",
  "1=vision_d_04",
  "1=vision_d_05",
  "1=vision_d_06",
  "1=vision_d_07",
  "1=vision_d_08",
  "1=vision_d_09",
  "1=vision_d_10",
  "1=vision_d_11",
  "1=vision_d_12",
  "1=vision_d_13",
  "1=vision_d_14",
  "1=vision_d_15",
  "1=vision_d_16",
  "1=vision_empty_17",
  "1=vision_multiple.raw",
  "1=wood_sk_02_c",
  "1=az5_wall_sk_02_c",
  "0=az5_wall_sk_02_n",
  "1=az5_wall_sk_03_c",
  "0=az5_wall_sk_03_n",
  "1=az5_wall_sk_04_c",
  "0=az5_wall_sk_04_n",
  "1=drain_kk_01_c",
  "0=drain_kk_01_n",
  "1=drain_sk_01_c",
  "0=drain_sk_01_n",
  "1=floor_kw_01_c",
  "0=floor_kw_01_n",
  "1=floor_kw_02_c",
  "0=floor_kw_02_n",
  "1=floor_md_01_c",
  "0=floor_md_01_n",
  "1=floor_mk_02_c",
  "0=floor_mk_02_n",
  "1=floor_mk_03_c",
  "0=floor_mk_03_n",
  "0=floor_mk_05_n",
  "1=floor_ms_01_c",
  "0=floor_ms_01_n",
  "1=floor_ms_02_c",
  "0=floor_ms_02_n",
  "1=floor_ms_05_c",
  "0=floor_ms_05_n",
  "1=floor_ms_06_c",
  "0=floor_ms_06_n",
  "1=floor_oc_01_c",
  "0=floor_oc_01_na",
  "1=floor_oc_02_c",
  "0=floor_oc_02_n",
  "1=floor_oc_04_c",
  "1=floor_oc_05_c",
  "1=floor_stone_kw_01_c",
  "0=floor_stone_kw_01_n",
  "1=floor_stone_kw_02_c",
  "0=floor_stone_kw_02_n",
  "1=floor_stone_kw_03_c",
  "0=floor_stone_kw_03_n",
  "1=floor_vi_wr_01_c",
  "0=floor_vi_wr_01_na",
  "1=floor_vi_xyf_01_c",
  "0=floor_vi_xyf_01_n",
  "1=floor_wood_fl_01_c",
  "0=floor_wood_fl_01_n",
  "1=floor_wood_fl_02_c",
  "1=floor_wood_fl_03_c",
  "0=floor_wood_fl_03_n",
  "1=floor_wood_kw_01_c",
  "0=floor_wood_kw_01_n",
  "1=floor_wood_kw_02_c",
  "0=floor_wood_kw_02_n",
  "1=gareki_ms_01_c",
  "0=gareki_ms_01_n",
  "1=grand_nk_05_c",
  "0=grand_nk_05_n",
  "1=grand_nk_06_c",
  "0=grand_nk_06_n",
  "1=ground_kw_01_c",
  "0=ground_kw_01_n",
  "1=ground_md_01_c",
  "0=ground_md_01_n",
  "1=ground_md_02_c",
  "0=ground_md_02_n",
  "1=ground_md_03_c",
  "0=ground_md_03_n",
  "1=ground_md_04_c",
  "0=ground_md_04_n",
  "1=ground_md_05_c",
  "0=ground_md_05_n",
  "1=ground_nt_02_c",
  "0=ground_nt_02_n",
  "1=ground_rk_01_c",
  "0=ground_rk_01_na",
  "1=ground_sk_01_c",
  "0=ground_sk_01_n",
  "1=ground_sk_02_c",
  "0=ground_sk_02_n",
  "1=ground_sk_03_c",
  "0=ground_sk_03_n",
  "1=ground_sk_04_c",
  "0=ground_sk_04_n",
  "1=ground_sk_07_c",
  "0=ground_sk_07_n",
  "1=ground_sk_08_c",
  "0=ground_sk_08_n",
  "1=ground_sk_09_c",
  "0=ground_sk_09_n",
  "1=ground_sk_10_c",
  "0=ground_sk_10_n",
  "1=ground_sk_11_c",
  "0=ground_sk_11_n",
  "1=ground_sk_12_c",
  "0=ground_sk_12_n",
  "1=ground_sk_14_c",
  "0=ground_sk_14_n",
  "1=ground_sk_16_c",
  "0=ground_sk_16_n",
  "1=ground_sk_17_c",
  "0=ground_sk_17_n",
  "1=ground_sk_19_c",
  "0=ground_sk_19_n",
  "1=ground_sk_20_c",
  "0=ground_sk_20_n",
  "1=ground_sk_21_c",
  "0=ground_sk_21_n",
  "1=ground_sk_22_c",
  "0=ground_sk_22_n",
  "1=ground_sk_23_c",
  "0=ground_sk_23_n",
  "1=ground_sk_24_c",
  "0=ground_sk_24_n",
  "1=ground_sk_25_c",
  "0=ground_sk_25_n",
  "1=ground_sk_26_c",
  "0=ground_sk_26_n",
  "1=ground_sk_27_c",
  "0=ground_sk_27_n",
  "1=ground_vi_01_c",
  "0=ground_vi_01_na",
  "1=ground_vi_02_c",
  "0=ground_vi_02_n",
  "1=ground_vi_03_c",
  "0=ground_vi_03_n",
  "0=ground_vi_03_na",
  "1=ground_vi_04_c",
  "0=ground_vi_04_n",
  "1=ground_vi_ljj_01_c",
  "0=ground_vi_ljj_01_n",
  "0=ground_vi_ljj_01_na",
  "1=ground_vi_tkz_07_c",
  "0=ground_vi_tkz_07_n",
  "1=ground_vi_tkz_08_c",
  "0=ground_vi_tkz_08_n",
  "1=ground_vi_tkz_09_c",
  "0=ground_vi_tkz_09_n",
  "1=ground_vi_tkz_10_c",
  "0=ground_vi_tkz_10_n",
  "1=ground_vi_tkz_11_c",
  "0=ground_vi_tkz_11_n",
  "1=ground_vi_tkz_12_c",
  "0=ground_vi_tkz_12_n",
  "1=ground_vi_wr_01_c",
  "0=ground_vi_wr_01_n",
  "1=ground_vi_wr_02_c",
  "0=ground_vi_wr_02_n",
  "0=ground_vi_wr_02_na",
  "1=ground_vi_xyf_01_c",
  "0=ground_vi_xyf_01_n",
  "1=ground_vi_zhq_01_c",
  "0=ground_vi_zhq_01_na",
  "1=ground_vi_zrj_01_c",
  "0=ground_vi_zrj_01_n",
  "1=ground_vi_zxy_02_c",
  "0=ground_vi_zxy_02_na",
  "1=ground_vi_zxy_04_c",
  "0=ground_vi_zxy_04_n",
  "1=gutter_md_01_c",
  "1=pi_walkway_kk_01_c",
  "0=pi_walkway_kk_01_n",
  "1=pi_walkway_kk_02_c",
  "0=pi_walkway_kk_02_n",
  "1=pi_walkway_kk_03_c",
  "0=pi_walkway_kk_03_n",
  "1=pi_walkway_kk_04_c",
  "0=pi_walkway_kk_04_n",
  "1=pi_walkway_kk_05_c",
  "0=pi_walkway_kk_05_n",
  "1=pi_walkway_kk_06_c",
  "0=pi_walkway_kk_06_n",
  "1=pi_walkway_kk_07_c",
  "0=pi_walkway_kk_07_n",
  "1=pi_walkway_kk_08_c",
  "0=pi_walkway_kk_08_n",
  "1=pi_walkway_kk_09_c",
  "0=pi_walkway_kk_09_n",
  "1=soil_fl_01_c",
  "0=soil_fl_01_n",
  "1=soil_fl_02_c",
  "0=soil_fl_02_n",
  "1=soil_fl_03_c",
  "0=soil_fl_03_n",
  "1=soil_fl_04_c",
  "0=soil_fl_04_n",
  "1=soil_fl_05_c",
  "0=soil_fl_05_n",
  "1=soil_fl_06_c",
  "0=soil_fl_06_n",
  "1=soil_fl_07_c",
  "0=soil_fl_07_n",
  "1=soil_fl_08_c",
  "0=soil_fl_08_n",
  "1=soil_fl_09_c",
  "0=soil_fl_09_n",
  "1=soil_fl_10_c",
  "0=soil_fl_10_n",
  "1=soil_fl_10_wa_c",
  "1=soil_fl_11_c",
  "0=soil_fl_11_n",
  "1=soil_up_fl_08_c",
  "0=soil_up_fl_08_n",
  "1=walkway_kk_01_c",
  "0=walkway_kk_01_n",
  "1=walkway_kk_02_c",
  "0=walkway_kk_02_n",
  "1=walkway_kk_03_c",
  "0=walkway_kk_03_n",
  "1=walkway_kk_04_c",
  "0=walkway_kk_04_n",
  "1=walkway_kk_05_c",
  "0=walkway_kk_05_n",
  "1=walkway_kk_06_c",
  "0=walkway_kk_06_n",
  "1=walkway_kk_07_c",
  "0=walkway_kk_07_n",
  "1=walkway_kk_08_c",
  "0=walkway_kk_08_n",
  "1=walkway_kk_09_c",
  "0=walkway_kk_09_n",
  "1=walkway_kk_10_c",
  "0=walkway_kk_10_n",
  "1=walkway_kk_11_c",
  "0=walkway_kk_11_n",
  "1=walkway_kk_12_c",
  "0=walkway_kk_12_n",
  "1=walkway_kk_13_c",
  "0=walkway_kk_13_n",
  "1=walkway_kk_14_c",
  "0=walkway_kk_14_n",
  "1=walkway_kk_15_c",
  "0=walkway_kk_15_n",
  "1=walkway_kk_16_c",
  "0=walkway_kk_16_n",
  "1=walkway_kk_17_c",
  "0=walkway_kk_17_n",
  "1=walkway_kk_18_c",
  "0=walkway_kk_18_n",
  "1=walkway_kk_19_c",
  "0=walkway_kk_19_n",
  "1=walkway_kk_20_c",
  "0=walkway_kk_20_n",
  "1=walkway_kk_21_c",
  "0=walkway_kk_21_n",
  "1=walkway_kk_23_c",
  "0=walkway_kk_23_n",
  "1=walkway_kk_24_c",
  "0=walkway_kk_24_n",
  "1=walkway_kk_25_c",
  "0=walkway_kk_25_n",
  "1=walkway_kk_26_c",
  "0=walkway_kk_26_n",
  "1=walkway_kk_27_c",
  "0=walkway_kk_27_n",
  "1=walkway_kk_28_c",
  "0=walkway_kk_28_n",
  "1=walkway_kk_29_c",
  "0=walkway_kk_29_n",
  "1=walkway_kk_30_c",
  "0=walkway_kk_30_n",
  "1=walkway_kw_01_c",
  "0=walkway_kw_01_n",
  "1=walkway_kw_02_c",
  "0=walkway_kw_02_n",
  "1=walkway_md_01_c",
  "0=walkway_md_01_n",
  "1=walkway_md_03_c",
  "0=walkway_md_03_n",
  "1=walkway_md_04_c",
  "0=walkway_md_04_n",
  "1=walkway_md_05_c",
  "0=walkway_md_05_n",
  "1=az5_wall_kw_01_c",
  "1=beam_woodend_fl_01_c",
  "0=beam_woodend_fl_01_n",
  "1=beam_wood_fl_01_c",
  "0=beam_wood_fl_01_n",
  "1=beam_wood_fl_02_c",
  "0=beam_wood_fl_02_n",
  "1=bricks_kk_01_c",
  "0=bricks_kk_01_n",
  "1=bricks_kk_02_c",
  "0=bricks_kk_02_n",
  "1=bricks_kk_03_c",
  "0=bricks_kk_03_n",
  "1=bricks_kk_04_c",
  "0=bricks_kk_04_n",
  "1=bricks_kk_05_c",
  "0=bricks_kk_05_n",
  "1=bricks_kk_06_c",
  "0=bricks_kk_06_n",
  "1=bricks_kk_07_c",
  "0=bricks_kk_07_n",
  "1=bricks_kk_08_c",
  "0=bricks_kk_08_n",
  "1=bricks_kk_09_c",
  "0=bricks_kk_09_n",
  "1=bricks_kk_10_c",
  "0=bricks_kk_10_n",
  "1=bricks_kk_11_c",
  "0=bricks_kk_11_n",
  "1=bricks_kk_12_c",
  "0=bricks_kk_12_n",
  "1=bricks_kk_13_c",
  "0=bricks_kk_13_n",
  "1=bricks_md_01_c",
  "0=bricks_md_01_n",
  "1=bricks_md_02_c",
  "0=bricks_md_02_n",
  "1=bricks_md_03_c",
  "0=bricks_md_03_n",
  "1=bricks_md_04_c",
  "0=bricks_md_04_n",
  "1=bricks_ms_01_c",
  "0=bricks_ms_01_n",
  "1=bricks_rk_01_c",
  "0=bricks_rk_01_n",
  "0=bricks_rk_01_na",
  "1=brickwall_kw_01_c",
  "0=brickwall_kw_01_n",
  "0=brickwall_kw_01_na",
  "1=brickwall_kw_06_c",
  "0=brickwall_kw_06_n",
  "1=brick_mk_02_c",
  "0=brick_mk_02_n",
  "1=brick_vi_zbk_01_c",
  "0=brick_vi_zbk_01_na",
  "1=brick_vi_zyy_02_c",
  "0=brick_vi_zyy_02_n",
  "1=concrete_kw_01_c",
  "0=concrete_kw_01_n",
  "1=concrete_kw_03_c",
  "0=concrete_kw_03_n",
  "1=concrete_kw_04_c",
  "0=concrete_kw_04_n",
  "1=concrete_kw_05_c",
  "0=concrete_kw_05_n",
  "1=concrete_vi_tkz_01_c",
  "0=concrete_vi_tkz_01_n",
  "1=fabric_fl_01_c",
  "0=fabric_fl_01_n",
  "1=mi_wall_panel_kw_01_c",
  "0=mi_wall_panel_kw_01_n",
  "1=mi_wall_panel_vi_lyb_01_c",
  "0=mi_wall_panel_vi_lyb_01_n",
  "1=mi_wall_panel_vi_lyb_03_c",
  "0=mi_wall_panel_vi_lyb_03_n",
  "1=mi_wall_panel_vi_lyb_06_c",
  "0=mi_wall_panel_vi_lyb_06_n",
  "1=mi_wall_panel_vi_lyb_08_c",
  "0=mi_wall_panel_vi_lyb_08_n",
  "1=mi_wall_panel_vi_lyb_09_c",
  "0=mi_wall_panel_vi_lyb_09_n",
  "1=mi_wall_vi_syc_01_c",
  "0=mi_wall_vi_syc_01_n",
  "1=mi_wall_vi_syc_02_c",
  "0=mi_wall_vi_syc_02_n",
  "1=pattern_md_01_c",
  "0=pattern_md_01_n",
  "1=pi2_wall_kk_01_c",
  "0=pi2_wall_kk_01_na",
  "1=pi2_wall_kk_02_c",
  "0=pi2_wall_kk_02_na",
  "1=pi2_wall_kk_03_c",
  "0=pi2_wall_kk_03_n",
  "1=pi2_wall_kk_04_c",
  "0=pi2_wall_kk_04_na",
  "1=pi2_wall_kk_05_c",
  "0=pi2_wall_kk_05_n",
  "1=pi2_wall_kk_06_c",
  "0=pi2_wall_kk_06_na",
  "1=pillar_kw_01_c",
  "0=pillar_kw_01_n",
  "1=pi_wall_kk_01_c",
  "0=pi_wall_kk_01_n",
  "1=pi_wall_kk_02_c",
  "0=pi_wall_kk_02_n",
  "1=pi_wall_kk_03_c",
  "0=pi_wall_kk_03_n",
  "1=pi_wall_kk_04_c",
  "0=pi_wall_kk_04_n",
  "1=pi_wall_kk_05_c",
  "0=pi_wall_kk_05_n",
  "1=pi_wall_kk_06_c",
  "0=pi_wall_kk_06_n",
  "1=pi_wall_kk_07_c",
  "0=pi_wall_kk_07_n",
  "1=pi_wall_kk_08_c",
  "0=pi_wall_kk_08_n",
  "1=pi_wall_kk_09_c",
  "0=pi_wall_kk_09_n",
  "1=pi_wall_kk_10_c",
  "0=pi_wall_kk_10_n",
  "1=pi_wall_kk_11_c",
  "0=pi_wall_kk_11_n",
  "1=pi_wall_kk_12_c",
  "0=pi_wall_kk_12_n",
  "1=pi_wall_kk_13_c",
  "0=pi_wall_kk_13_n",
  "1=pi_wall_kk_14_c",
  "0=pi_wall_kk_14_n",
  "1=pi_wall_kk_15_c",
  "0=pi_wall_kk_15_n",
  "1=pi_wall_kk_16_c",
  "0=pi_wall_kk_16_n",
  "1=pi_wall_kk_17_c",
  "0=pi_wall_kk_17_n",
  "1=pi_wall_kk_18_c",
  "0=pi_wall_kk_18_n",
  "1=pi_wall_kk_19_c",
  "0=pi_wall_kk_19_n",
  "1=pi_wall_kk_20_c",
  "1=pi_wall_xp_01_c",
  "0=pi_wall_xp_01_n",
  "1=pi_wall_xp_02_c",
  "0=pi_wall_xp_02_n",
  "0=pi_wall_xp_02_na",
  "1=pi_wall_xp_03_c",
  "0=pi_wall_xp_03_n",
  "1=pi_wall_xp_04_c",
  "0=pi_wall_xp_04_n",
  "1=pi_wall_xp_05_c",
  "0=pi_wall_xp_05_n",
  "1=rockoc_sk_02_c",
  "0=rockoc_sk_02_n",
  "1=rollup_vi_jxy_01_c",
  "0=rollup_vi_jxy_01_n",
  "1=wallwood_fl_02_c",
  "0=wallwood_fl_02_n",
  "1=wallwood_fl_03_c",
  "0=wallwood_fl_03_n",
  "1=wall_az6_ms_02_c",
  "0=wall_az6_ms_02_n",
  "1=wall_az6_ms_03_c",
  "1=wall_crack_kw_01_c",
  "0=wall_crack_kw_01_n",
  "1=wall_crack_kw_02_c",
  "0=wall_crack_kw_02_n",
  "1=wall_kk_01_c",
  "0=wall_kk_01_n",
  "1=wall_kk_02_c",
  "0=wall_kk_02_n",
  "1=wall_kk_03_c",
  "0=wall_kk_03_n",
  "1=wall_kk_04_c",
  "0=wall_kk_04_n",
  "1=wall_kk_05_c",
  "0=wall_kk_05_n",
  "1=wall_kk_06_c",
  "0=wall_kk_06_n",
  "1=wall_kk_07_c",
  "0=wall_kk_07_n",
  "1=wall_kk_08_c",
  "0=wall_kk_08_n",
  "1=wall_kk_09_c",
  "0=wall_kk_09_n",
  "1=wall_kk_10_c",
  "0=wall_kk_10_n",
  "1=wall_kk_11_c",
  "0=wall_kk_11_n",
  "1=wall_kk_12_c",
  "0=wall_kk_12_n",
  "1=wall_kk_13_c",
  "0=wall_kk_13_n",
  "1=wall_kk_14_c",
  "0=wall_kk_14_n",
  "1=wall_kk_15_c",
  "0=wall_kk_15_n",
  "1=wall_kk_16_c",
  "0=wall_kk_16_n",
  "1=wall_kk_17_c",
  "0=wall_kk_17_n",
  "1=wall_kk_18_c",
  "0=wall_kk_18_n",
  "1=wall_kk_19_c",
  "0=wall_kk_19_n",
  "1=wall_kk_20_c",
  "0=wall_kk_20_n",
  "1=wall_kk_21_c",
  "0=wall_kk_21_n",
  "1=wall_kk_22_c",
  "0=wall_kk_22_n",
  "1=wall_kk_23_c",
  "0=wall_kk_23_n",
  "1=wall_kk_24_c",
  "0=wall_kk_24_n",
  "1=wall_kk_25_c",
  "0=wall_kk_25_n",
  "1=wall_kk_26_c",
  "0=wall_kk_26_n",
  "1=wall_kw_01_c",
  "0=wall_kw_01_n",
  "1=wall_kw_02_c",
  "0=wall_kw_02_n",
  "1=wall_kw_03_c",
  "0=wall_kw_03_n",
  "1=wall_kw_04_c",
  "0=wall_kw_04_n",
  "1=wall_kw_05_c",
  "0=wall_kw_05_n",
  "1=wall_kw_06_c",
  "0=wall_kw_06_n",
  "1=wall_kw_07_c",
  "0=wall_kw_07_n",
  "1=wall_kw_08_c",
  "0=wall_kw_08_n",
  "1=wall_kw_09_c",
  "0=wall_kw_09_n",
  "1=wall_kw_10_c",
  "0=wall_kw_10_n",
  "1=wall_md_01_c",
  "0=wall_md_01_n",
  "1=wall_md_02_c",
  "0=wall_md_02_n",
  "1=wall_md_05_c",
  "0=wall_md_05_n",
  "1=wall_md_06_c",
  "0=wall_md_06_n",
  "1=wall_md_07_c",
  "0=wall_md_07_n",
  "1=wall_md_08_c",
  "0=wall_md_08_n",
  "1=wall_md_09_c",
  "0=wall_md_09_n",
  "1=wall_md_10_c",
  "0=wall_md_10_n",
  "1=wall_md_11_c",
  "0=wall_md_11_n",
  "1=wall_md_12_c",
  "0=wall_md_12_n",
  "0=wall_md_12_na",
  "1=wall_md_14_c",
  "0=wall_md_14_n",
  "1=wall_md_15_c",
  "0=wall_md_15_n",
  "1=wall_md_16_c",
  "0=wall_md_16_n",
  "1=wall_md_17_c",
  "0=wall_md_17_n",
  "1=wall_md_19_c",
  "0=wall_md_19_n",
  "1=wall_md_20_c",
  "0=wall_md_20_n",
  "1=wall_md_22_c",
  "0=wall_md_22_n",
  "1=wall_md_23_c",
  "0=wall_md_23_n",
  "1=wall_md_24_c",
  "0=wall_md_24_n",
  "1=wall_md_25_c",
  "0=wall_md_25_n",
  "1=wall_md_26_c",
  "0=wall_md_26_n",
  "1=wall_md_27_c",
  "0=wall_md_27_n",
  "1=wall_md_28_c",
  "0=wall_md_28_n",
  "1=wall_md_29_c",
  "0=wall_md_29_n",
  "1=wall_md_30_c",
  "0=wall_md_30_n",
  "1=wall_md_31_c",
  "0=wall_md_31_n",
  "1=wall_md_32_c",
  "0=wall_md_32_n",
  "1=wall_md_33_c",
  "0=wall_md_33_n",
  "1=wall_md_34_c",
  "0=wall_md_34_n",
  "1=wall_md_35_c",
  "0=wall_md_35_n",
  "1=wall_md_39_c",
  "0=wall_md_39_n",
  "1=wall_md_40_c",
  "0=wall_md_40_n",
  "1=wall_md_41_c",
  "0=wall_md_41_n",
  "1=wall_md_42_c",
  "0=wall_md_42_n",
  "1=wall_md_44_c",
  "0=wall_md_44_n",
  "1=wall_md_45_c",
  "0=wall_md_45_n",
  "1=wall_md_50_c",
  "0=wall_md_50_n",
  "1=wall_md_51_c",
  "0=wall_md_51_n",
  "1=wall_md_55_c",
  "0=wall_md_55_n",
  "1=wall_md_56_c",
  "0=wall_md_56_n",
  "1=wall_mk_02_c",
  "0=wall_mk_02_n",
  "1=wall_mk_03_c",
  "0=wall_mk_03_n",
  "1=wall_mk_04_c",
  "0=wall_mk_04_n",
  "1=wall_ms_02_c",
  "0=wall_ms_02_n",
  "1=wall_ms_03_c",
  "0=wall_ms_03_n",
  "1=wall_ms_04_c",
  "0=wall_ms_04_n",
  "1=wall_ms_12_c",
  "0=wall_ms_12_n",
  "1=wall_ms_13_c",
  "0=wall_ms_13_n",
  "1=wall_ms_15_c",
  "0=wall_ms_15_n",
  "1=wall_ms_16_c",
  "0=wall_ms_16_n",
  "1=wall_nk_11_c",
  "0=wall_nk_11_n",
  "0=wall_nrack_kw_01_n",
  "0=wall_nrack_kw_02_n",
  "1=wall_nt_01_c",
  "0=wall_nt_01_n",
  "1=wall_nt_02_c",
  "0=wall_nt_02_n",
  "1=wall_rk_01_c",
  "0=wall_rk_01_n",
  "1=wall_rk_03_c",
  "0=wall_rk_03_n",
  "1=wall_rk_04_c",
  "0=wall_rk_04_n",
  "1=wall_rk_06_c",
  "0=wall_rk_06_n",
  "1=wall_sk_01_c",
  "0=wall_sk_01_n",
  "1=wall_sk_02_c",
  "0=wall_sk_02_n",
  "1=wall_sk_03_c",
  "0=wall_sk_03_n",
  "1=wall_sk_04_c",
  "0=wall_sk_04_n",
  "1=wall_sk_05_c",
  "0=wall_sk_05_n",
  "1=wall_sk_06_c",
  "0=wall_sk_06_n",
  "1=wall_sk_07_c",
  "0=wall_sk_07_n",
  "1=wall_sk_10_c",
  "0=wall_sk_10_n",
  "1=wall_sk_13_c",
  "0=wall_sk_13_n",
  "1=wall_sk_14_c",
  "0=wall_sk_14_n",
  "1=wall_sk_16_c",
  "0=wall_sk_16_n",
  "1=wall_sk_17_c",
  "0=wall_sk_17_n",
  "1=wall_vi_03_c",
  "0=wall_vi_03_n",
  "1=wall_vi_04_c",
  "0=wall_vi_04_n",
  "1=wall_vi_07_c",
  "0=wall_vi_07_n",
  "1=wall_vi_09_c",
  "0=wall_vi_09_n",
  "0=wall_vi_09_na",
  "1=wall_vi_11_c",
  "0=wall_vi_11_n",
  "1=wall_vi_12_c",
  "0=wall_vi_12_n",
  "0=wall_vi_12_na",
  "0=wall_vi_13_c",
  "1=wall_vi_13_n",
  "0=wall_vi_13_na",
  "1=wall_vi_14_c",
  "0=wall_vi_14_n",
  "1=wall_vi_15_c",
  "1=wall_vi_cnb_05_c",
  "1=wall_vi_cnb_07_c",
  "1=wall_vi_cnb_13_c",
  "0=wall_vi_cnb_13_na",
  "1=wall_vi_flb_04_c",
  "0=wall_vi_flb_04_n",
  "1=wall_vi_flb_05_c",
  "0=wall_vi_flb_05_n",
  "1=wall_vi_flb_06_c",
  "0=wall_vi_flb_06_n",
  "1=wall_vi_flb_07_c",
  "0=wall_vi_flb_07_n",
  "1=wall_vi_hhq_01_c",
  "0=wall_vi_hhq_01_na",
  "1=wall_vi_hhq_02_c",
  "0=wall_vi_hhq_02_n",
  "0=wall_vi_hhq_02_na",
  "1=wall_vi_hhq_03_c",
  "1=wall_vi_hhq_04_c",
  "0=wall_vi_hhq_04_n",
  "1=wall_vi_hhq_05_c",
  "0=wall_vi_hhq_05_n",
  "1=wall_vi_hhq_06_c",
  "0=wall_vi_hhq_06_n",
  "1=wall_vi_jhq_03_c",
  "0=wall_vi_jhq_03_n",
  "1=wall_vi_jxy_04_c",
  "0=wall_vi_jxy_04_na",
  "1=wall_vi_jxy_07_c",
  "0=wall_vi_jxy_07_n",
  "1=wall_vi_jxy_14_c",
  "0=wall_vi_jxy_14_na",
  "1=wall_vi_jxy_15_c",
  "0=wall_vi_jxy_15_n",
  "1=wall_vi_jxy_16_c",
  "0=wall_vi_jxy_16_n",
  "1=wall_vi_lp_02_c",
  "0=wall_vi_lp_02_n",
  "1=wall_vi_lp_03_c",
  "0=wall_vi_lp_03_n",
  "1=wall_vi_lp_04_c",
  "0=wall_vi_lp_04_na",
  "1=wall_vi_lp_06_c",
  "0=wall_vi_lp_06_n",
  "1=wall_vi_lp_07_c",
  "0=wall_vi_lp_07_n",
  "1=wall_vi_lyb_10_c",
  "0=wall_vi_lyb_10_n",
  "1=wall_vi_lyb_11_c",
  "0=wall_vi_lyb_11_n",
  "0=wall_vi_nnb_05_n",
  "0=wall_vi_nnb_07_n",
  "1=wall_vi_syc_01_c",
  "0=wall_vi_syc_01_na",
  "1=wall_vi_syc_02_c",
  "0=wall_vi_syc_02_n",
  "0=wall_vi_syc_02_na",
  "1=wall_vi_syc_03_c",
  "0=wall_vi_syc_03_n",
  "1=wall_vi_syc_04_c",
  "0=wall_vi_syc_04_n",
  "1=wall_vi_tkz_02_c",
  "0=wall_vi_tkz_02_n",
  "1=wall_vi_tkz_03_c",
  "0=wall_vi_tkz_03_n",
  "1=wall_vi_tkz_04_c",
  "0=wall_vi_tkz_04_n",
  "0=wall_vi_tkz_04_na",
  "1=wall_vi_tkz_05_c",
  "0=wall_vi_tkz_05_n",
  "1=wall_vi_tkz_06_c",
  "0=wall_vi_tkz_06_n",
  "1=wall_vi_tkz_07_c",
  "0=wall_vi_tkz_07_n",
  "1=wall_vi_tkz_08_c",
  "0=wall_vi_tkz_08_n",
  "1=wall_vi_tkz_09_c",
  "0=wall_vi_tkz_09_na",
  "1=wall_vi_tkz_12_c",
  "0=wall_vi_tkz_12_n",
  "1=wall_vi_tkz_13_c",
  "0=wall_vi_tkz_13_n",
  "1=wall_vi_tkz_14_c",
  "0=wall_vi_tkz_14_n",
  "1=wall_vi_tkz_15_c",
  "0=wall_vi_tkz_15_n",
  "1=wall_vi_tkz_16_c",
  "0=wall_vi_tkz_16_n",
  "1=wall_vi_tkz_17_c",
  "0=wall_vi_tkz_17_n",
  "1=wall_vi_tkz_18_c",
  "0=wall_vi_tkz_18_n",
  "1=wall_vi_tkz_19_c",
  "0=wall_vi_tkz_19_na",
  "1=wall_vi_tkz_21_c",
  "0=wall_vi_tkz_21_n",
  "1=wall_vi_tkz_c",
  "0=wall_vi_tkz_n",
  "1=wall_vi_wmx_01_c",
  "0=wall_vi_wmx_01_na",
  "1=wall_vi_wmx_02_c",
  "0=wall_vi_wmx_02_n",
  "1=wall_vi_wmx_03_c",
  "0=wall_vi_wmx_03_n",
  "1=wall_vi_wmx_08_c",
  "0=wall_vi_wmx_08_n",
  "1=wall_vi_wr_01_c",
  "0=wall_vi_wr_01_na",
  "1=wall_vi_wr_02_c",
  "0=wall_vi_wr_02_n",
  "1=wall_vi_wr_03_c",
  "0=wall_vi_wr_03_n",
  "1=wall_vi_wr_04_c",
  "0=wall_vi_wr_04_na",
  "1=wall_vi_wr_05_c",
  "0=wall_vi_wr_05_na",
  "1=wall_vi_wr_06_c",
  "0=wall_vi_wr_06_na",
  "1=wall_vi_wr_07_c",
  "0=wall_vi_wr_07_n",
  "0=wall_vi_wr_07_na",
  "1=wall_vi_xyf_01_c",
  "0=wall_vi_xyf_01_n",
  "1=wall_vi_xyf_03_c",
  "0=wall_vi_xyf_03_n",
  "1=wall_vi_xyf_09_c",
  "0=wall_vi_xyf_09_n",
  "1=wall_vi_xyf_10_c",
  "1=wall_vi_xyf_11_c",
  "0=wall_vi_xyf_11_n",
  "1=wall_vi_xyf_15_c",
  "0=wall_vi_xyf_15_na",
  "1=wall_vi_xyf_16_c",
  "0=wall_vi_xyf_16_na",
  "1=wall_vi_xzs_01_c",
  "0=wall_vi_xzs_01_n",
  "1=wall_vi_xzs_02_c",
  "0=wall_vi_xzs_02_n",
  "1=wall_vi_xzs_03_c",
  "0=wall_vi_xzs_03_n",
  "1=wall_vi_xzs_04_c",
  "0=wall_vi_xzs_04_n",
  "1=wall_vi_xzs_07_c",
  "0=wall_vi_xzs_07_n",
  "1=wall_vi_xzs_08_c",
  "0=wall_vi_xzs_08_n",
  "1=wall_vi_zbk_02_c",
  "0=wall_vi_zbk_02_n",
  "1=wall_vi_zbk_10_c",
  "0=wall_vi_zbk_10_n",
  "1=wall_vi_zbk_11_c",
  "0=wall_vi_zbk_11_n",
  "1=wall_vi_zbk_14_c",
  "0=wall_vi_zbk_14_n",
  "1=wall_vi_zbk_17_c",
  "0=wall_vi_zbk_17_n",
  "1=wall_vi_zbk_20_c",
  "0=wall_vi_zbk_20_n",
  "1=wall_vi_zbk_21_c",
  "0=wall_vi_zbk_21_n",
  "1=wall_vi_zbk_22_c",
  "0=wall_vi_zbk_22_n",
  "1=wall_vi_zbk_23_c",
  "0=wall_vi_zbk_23_n",
  "1=wall_vi_zbk_24_c",
  "0=wall_vi_zbk_24_n",
  "1=wall_vi_zhq_01_c",
  "0=wall_vi_zhq_01_n",
  "1=wall_vi_zhq_02_c",
  "0=wall_vi_zhq_02_na",
  "1=wall_vi_zhq_03_c",
  "0=wall_vi_zhq_03_n",
  "0=wall_vi_zhq_03_na",
  "1=wall_vi_zhq_04_c",
  "0=wall_vi_zhq_04_n",
  "0=wall_vi_zhq_04_na",
  "1=wall_vi_zhq_05_c",
  "0=wall_vi_zhq_05_n",
  "1=wall_vi_zhq_07_c",
  "0=wall_vi_zhq_07_n",
  "0=wall_vi_zhq_07_na",
  "1=wall_vi_zhq_12_c",
  "0=wall_vi_zhq_12_n",
  "0=wall_vi_zhq_12_na",
  "1=wall_vi_zhq_14_c",
  "0=wall_vi_zhq_14_n",
  "1=wall_vi_zhx_01_c",
  "0=wall_vi_zhx_01_n",
  "0=wall_vi_zhx_01_na",
  "1=wall_vi_zhx_02_c",
  "0=wall_vi_zhx_02_na",
  "1=wall_vi_zhx_03_c",
  "0=wall_vi_zhx_03_n",
  "1=wall_vi_zrj_02_c",
  "0=wall_vi_zrj_02_n",
  "1=wall_vi_zrj_03_c",
  "0=wall_vi_zrj_03_na",
  "1=wall_vi_zrj_05_c",
  "0=wall_vi_zrj_05_n",
  "1=wall_vi_zrj_06_c",
  "0=wall_vi_zrj_06_n",
  "1=wall_vi_zrj_07_c",
  "0=wall_vi_zrj_07_n",
  "1=wall_vi_zrj_08_c",
  "0=wall_vi_zrj_08_n",
  "1=wall_vi_zrj_09_c",
  "0=wall_vi_zrj_09_n",
  "1=wall_vi_zrj_11_c",
  "0=wall_vi_zrj_11_n",
  "0=wall_vi_zrj_11_na",
  "1=wall_vi_zrj_12_c",
  "0=wall_vi_zrj_12_n",
  "0=wall_vi_zrj_12_na",
  "1=wall_vi_zrj_14_c",
  "0=wall_vi_zrj_14_n",
  "1=wall_vi_zxy_01_c",
  "0=wall_vi_zxy_01_n",
  "1=wall_vi_zxy_03_c",
  "0=wall_vi_zxy_03_n",
  "1=wall_vi_zxy_07_c",
  "0=wall_vi_zxy_07_n",
  "1=wall_vi_zxy_08_c",
  "0=wall_vi_zxy_08_n",
  "1=wall_vi_zxy_09_c",
  "0=wall_vi_zxy_09_n",
  "1=wall_vi_zxy_12_c",
  "0=wall_vi_zxy_12_n",
  "1=wall_vi_zyy_01_c",
  "0=wall_vi_zyy_01_n",
  "1=wall_vi_zyy_02_c",
  "0=wall_vi_zyy_02_na",
  "1=wall_wood_fl_01_c",
  "0=wall_wood_fl_01_n",
  "1=wall_wood_kw_01_c",
  "0=wall_wood_kw_01_n",
  "1=wall_xp_02_c",
  "0=wall_xp_02_n",
  "1=wall_xp_03_c",
  "0=wall_xp_03_n",
  "1=wall_xp_04_c",
  "0=wall_xp_04_n",
  "1=wall_xp_05_c",
  "0=wall_xp_05_n",
  "1=wall_xp_07_c",
  "0=wall_xp_07_n",
  "1=wall_xp_08_c",
  "0=wall_xp_08_n",
  "1=wall_xp_09_c",
  "0=wall_xp_09_n",
  "0=wall_xp_09_na",
  "1=wall_xp_10_c",
  "0=wall_xp_10_n",
  "1=wall_xp_13_c",
  "0=wall_xp_13_n",
  "1=wall_xp_14_c",
  "0=wall_xp_14_n",
  "1=wall_xp_15_c",
  "0=wall_xp_15_n",
  "1=wall_xp_16_c",
  "0=wall_xp_16_n",
  "1=wall_xp_18_c",
  "1=wall_xp_19_c",
  "0=wall_xp_19_n",
  "1=wall_xp_20_c",
  "0=wall_xp_20_n",
  "1=wall_xp_re_09_c",
  "0=wall_xp_re_09_n",
  "1=wood_fl_01_c",
  "0=wood_fl_01_n",
  "1=wood_nk_02_c"
}
gcd_mdl_cache_list = {
  "boss_naviangle",
  "boss_navipoint",
  "camera_keep_out",
  "camera_shutter",
  "camera_view",
  "caption",
  "countdown",
  "counter_99_99",
  "counter_bar",
  "counter_gem",
  "counter_kazari",
  "counter_score",
  "counter_tarisman",
  "counter_timer",
  "film_pic_loading",
  "hud_gg",
  "hud_hp",
  "hud_mp",
  "hud_target",
  "hud_target_grav",
  "hud_target_lock",
  "key_guide",
  "loading_icon",
  "navi_point",
  "object",
  "pause_button",
  "pause_layout",
  "photo_item_header",
  "photo_item_num",
  "stack",
  "stack_layout",
  "tekinaviangle",
  "tekinavipoint",
  "top_menu_screen"
}
gcd_tex_cache_list = {
  "bk_kerare.gnf",
  "boss_point.gnf",
  "boss_point_add.gnf",
  "button_circle.gnf",
  "camera_cover.gnf",
  "camera_shutter.gnf",
  "caption_baloon_base.gnf",
  "challenge_number_2.gnf",
  "cmn_spherein.gnf",
  "cntparticle_05.gnf",
  "cntparticle_06.gnf",
  "cntparticle_07.gnf",
  "cntparticle_08.gnf",
  "cntparticle_09.gnf",
  "cntparticle_10.gnf",
  "cntparticle_11.gnf",
  "cntparticle_12.gnf",
  "cntparticle_13.gnf",
  "cntparticle_14.gnf",
  "cntparticle_15.gnf",
  "cntparticle_16.gnf",
  "cntparticle_17.gnf",
  "cntparticle_18.gnf",
  "cntparticle_19.gnf",
  "cntparticle_20.gnf",
  "cntparticle_21.gnf",
  "cntparticle_22.gnf",
  "cntparticle_23.gnf",
  "color_white.gnf",
  "common_large_number.gnf",
  "common_line_neon.gnf",
  "common_parcent_bar.gnf",
  "common_post_01.gnf",
  "common_post_02.gnf",
  "common_post_03.gnf",
  "common_selects.gnf",
  "common_selects_light.gnf",
  "common_star6.gnf",
  "counter_kazari.gnf",
  "counter_number.gnf",
  "enemy_arrow_01.gnf",
  "enemy_arrow_02.gnf",
  "enemy_arrow_03.gnf",
  "enemy_arrow_04.gnf",
  "enemy_point.gnf",
  "enemy_point_add.gnf",
  "enemy_sc_01.gnf",
  "enemy_sc_01_add.gnf",
  "ex_icon_01.gnf",
  "finish_c_01.gnf",
  "finish_c_01_add.gnf",
  "finish_c_01_mask.gnf",
  "finish_lock_01.gnf",
  "finish_s_01.gnf",
  "finish_s_01_add.gnf",
  "finish_s_02_add.gnf",
  "gem_icon.gnf",
  "key_guide2_base.gnf",
  "key_guide_base.gnf",
  "key_guide_base_bloom.gnf",
  "loading_icon.gnf",
  "loading_icon_pic.gnf",
  "map_header_base_2.gnf",
  "mask_wide.gnf",
  "navi_circle_add.gnf",
  "navi_circle_mult2.gnf",
  "navi_ef01_00.gnf",
  "navi_number.gnf",
  "navi_number_y.gnf",
  "oshirase_icon.gnf",
  "picture_frame.gnf",
  "point_arrow.gnf",
  "pup_skill_icon_01.gnf",
  "talisman_color_ef_2.gnf",
  "talisman_color_ef_3.gnf",
  "tarisman_cnt_icon.gnf",
  "wipe_mask.gnf"
}
cache_list = {
  mot = eaf_cache_list,
  gfxmdl = gfx_cache_list,
  PFXFile = pfx_cache_list
}
gcd_cache_list = {
  CDgcd = gcd_mdl_cache_list,
  CDtex = gcd_tex_cache_list
}
tex_cache_list = {
  gfxtex = tex_cache_list,
  PfxLinearTextureType = pfx_tex_cache_list
}
all_cache_list = {
  cache_list,
  gcd_cache_list,
  tex_cache_list
}
function do_cache()
  local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35
  while true do
    if not L0_21 then
      L0_21(L1_22)
    end
  end
  for L3_24, L4_25 in L0_21(L1_22) do
    for L8_29, L9_30 in L5_26(L6_27) do
      for L13_34, L14_35 in L10_31(L11_32) do
        cache_asset_table[cache_asset_count] = loadFileAsset(L8_29, L14_35)
        cache_asset_count = cache_asset_count + 1
        if cache_asset_count % 3 == 0 then
          wait()
        end
        while isBusyFileIO(0.3) do
          wait()
        end
      end
    end
  end
end
function main()
  HUD:blackout(0)
  if _tropyUpdate then
    invokeSystemTask(function()
      _tropyUpdateCode = 1
      while _tropyUpdateCode > 0 do
        _tropyUpdateCode = Net:trophyUpdate()
        wait()
      end
    end)
  end
  invokeSystemTask(openText)
  invokeSystemTask(autoSave)
  invokeSystemTask(accessIndicator)
  wait()
  if _do_cache then
    invokeSystemTask(do_cache)
  end
  Debug:disableGameOver(false)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "All Reset"
  })
  if not _DEBUG_DISP then
    Debug:setSwitch({"Display", "Debug Draw"}, false)
    Debug:setSwitch({
      "Display",
      "Screen Console"
    }, false)
    Debug:setSwitch({"Display", "FPS"}, false)
    Debug:setSwitch({
      "Display",
      "FIOS2Driver Status"
    }, false)
    Debug:setSwitch({
      "Display",
      "HUD",
      "Off debug print"
    }, true)
  else
    Debug:setSwitch({"Display", "Debug Draw"}, true)
    Debug:setSwitch({
      "Display",
      "Screen Console"
    }, true)
    Debug:setSwitch({
      "Display",
      "DebugDrawGroup",
      "ScriptQuery"
    }, true)
    Debug:setSwitch({
      "Display",
      "DebugDrawGroup",
      "ScriptDebugDraw"
    }, true)
  end
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  debugDisp()
  HUD:menuOpen("Main")
  HUD:menuOpen("Gameover")
  HUD:setGameoverCallbackToTitle(gameOver)
  HUD:menuSetCallback(HUD.kCallback_ReturnTitle, gameOver)
  HUD:menuSetCallback(HUD.kCallback_LoadGame, gameLoad)
  HUD:menuSetCallback(HUD.kCallback_TokenReward, tokenRewardCallback)
  Sound:loadResource("voice")
  _sb_soundManager = createSandbox2("soundManager")
  _sb_soundManager:setString("g_filename", "/Game/Event2/soundmanager.lua")
  _sb_soundManager:try_init()
  _sb_soundManager:waitForReady()
  _sb_soundManager:try_start()
  _sb_demoManager = createSandbox2("demoManager")
  _sb_demoManager:setString("g_filename", "/Game/Event2/demomanager.lua")
  _sb_demoManager:try_init()
  _sb_demoManager:waitForReady()
  _sb_demoManager:setGameObject("root", g_own)
  _sb_demoManager:setGameObject("soundManager", _sb_soundManager)
  _sb_demoManager:setGameObject("enemyManager", g_own:getGameObject("enemyManager"))
  _sb_demoManager:try_start()
  if _network then
    Net:checkAvailability()
    invokeSystemTask(function()
      while Net:checkAvailabilityUpdate() ~= 0 do
        wait()
      end
    end)
  end
  gameStart()
end
function exitsandbox()
  print("root exit")
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, false)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "All Reset"
  })
  Debug:setSwitch({"Display", "FPS"}, true)
  Debug:setSwitch({
    "Display",
    "FIOS2Driver Status"
  }, true)
  Debug:setSwitch({
    "Display",
    "HUD",
    "Off debug print"
  }, false)
  HUD:delGameoverCallbackToTitle(gameOver)
  HUD:menuDelCallback(HUD.kCallback_ReturnTitle)
  HUD:menuDelCallback(HUD.kCallback_LoadGame)
  HUD:menuSetCallback(HUD.kCallback_TokenReward)
  closeText()
  _exit_sandbox = true
end
setExitCallback(exitsandbox)
_savedata_reset_table = {
  ggd.Savedata__PlayerAbility,
  ggd.Savedata__Player,
  ggd.Savedata__Camera,
  ggd.Savedata__PhotoFilter,
  ggd.Savedata__MissionPhoto,
  ggd.Savedata__Gesture,
  ggd.Savedata__Option,
  ggd.Savedata__Menu,
  ggd.Savedata__EventManageFlags,
  ggd.Savedata__FreeTimeFlags,
  ggd.Savedata__EventClearFlags,
  ggd.Savedata__EventFinishedFlags,
  ggd.Savedata__EventFlags,
  ggd.Savedata__Info,
  ggd.Savedata__BrokenObj,
  ggd.Savedata__InfoActor,
  ggd.Savedata__TalismanOreGacha,
  ggd.Savedata__TalismanOre,
  ggd.Savedata__TalismanEquipped,
  ggd.Savedata__TalismanSkillNewarrivals,
  ggd.Savedata__PhotoItem,
  ggd.Savedata__CostumeUnlock,
  ggd.Savedata__GemInfo,
  ggd.Savedata__MyDeathGhost,
  ggd.Savedata__HomeInfo,
  ggd.Savedata__ChallengeClearState,
  ggd.Savedata__Collection,
  ggd.Savedata__Mine,
  ggd.Savedata__News,
  ggd.Savedata__CreneShipFlags,
  ggd.Savedata__Mine99,
  ggd.Savedata__TreasureFlags,
  ggd.Savedata__RewardFlags,
  ggd.Savedata__MineInfo,
  ggd.Savedata__StatisticalChart,
  "wait",
  ggd.Savedata__Talisman,
  "wait",
  ggd.Savedata__Gem,
  "wait",
  ggd.Savedata__GravityOre
}
function resetSaveData()
  local L0_36, L2_37, L3_38
  for _FORV_3_ = 1, #L2_37 do
    if _savedata_reset_table[_FORV_3_] == "wait" then
      wait()
    else
      GameDatabase:reset(_savedata_reset_table[_FORV_3_])
    end
  end
end
g_customDebugMenu = {
  {
    name = "PhaseDisp",
    callback = function()
      local L1_39
      L1_39 = _debugDisp
      L1_39 = not L1_39
      _debugDisp = L1_39
    end
  }
}
_debugDisp = false
_debugLine = 0
function debugDisp()
  invokeSystemTask(function()
    local L0_40, L1_41, L2_42, L3_43, L4_44
    while true do
      L0_40 = _exit_sandbox
      if not L0_40 then
        L0_40 = _debugDisp
        if L0_40 then
          _debugLine = 0
          L0_40 = GameDatabase
          L1_41 = L0_40
          L0_40 = L0_40.get
          L2_42 = ggd
          L2_42 = L2_42.Savedata__EventManageFlags__CurrentMissionName
          L0_40 = L0_40(L1_41, L2_42)
          L1_41 = GameDatabase
          L2_42 = L1_41
          L1_41 = L1_41.get
          L3_43 = ggd
          L3_43 = L3_43.Savedata__EventManageFlags__CurrentFreeMode
          L1_41 = L1_41(L2_42, L3_43)
          L2_42 = GameDatabase
          L3_43 = L2_42
          L2_42 = L2_42.get
          L4_44 = ggd
          L4_44 = L4_44.Savedata__EventManageFlags__CurrentCommonSb
          L2_42 = L2_42(L3_43, L4_44)
          L3_43 = GameDatabase
          L4_44 = L3_43
          L3_43 = L3_43.get
          L3_43 = L3_43(L4_44, ggd.Savedata__EventManageFlags__WarShip)
          L4_44 = GameDatabase
          L4_44 = L4_44.get
          L4_44 = L4_44(L4_44, ggd.Savedata__EventManageFlags__WarShipCannon)
          if L0_40 == "eventheader" then
            L0_40 = L1_41
          end
          debugDispPirint("phase     = [ " .. tostring(L0_40) .. " ]")
          debugDispPirint("common sb = [ " .. tostring(L2_42) .. " ]")
          debugDispPirint("free time = [ " .. tostring(L1_41) .. " ]")
          debugDispPirint("ws patrol = [ " .. tostring(L3_43) .. " ]")
          debugDispPirint("ws attack = [ " .. tostring(L4_44) .. " ]")
        end
        L0_40 = wait
        L0_40()
      end
    end
  end)
end
function debugDispPirint(A0_45)
  if A0_45 then
    if Debug:isDebugMenuOpen() == true then
      Font:debugPrint(250, 30 + 16 * _debugLine, A0_45)
    else
      Font:debugPrint(30, 30 + 16 * _debugLine, A0_45)
    end
  end
  _debugLine = _debugLine + 1
end
function debugDispPhase()
  local L1_46
  L1_46 = _debugDisp
  L1_46 = not L1_46
  _debugDisp = L1_46
end
