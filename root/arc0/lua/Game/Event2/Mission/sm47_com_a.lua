dofile("/Game/Event2/Common/HeaderCommon.lua")
_bag_hdl = {}
_ve_a = nil
_dym_obj = {}
_no_ship = false
_bag_create_flg = false
_bag_create_end = false
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2
  while true do
    L0_2 = _no_ship
    if L0_2 then
      L0_2 = createGameObject2
      L0_2 = L0_2("Area")
      _ve_a = L0_2
      L0_2 = _ve_a
      L0_2 = L0_2.setName
      L0_2(L0_2, "ve_a")
      L0_2 = _ve_a
      L0_2 = L0_2.try_init
      L0_2(L0_2)
      L0_2 = _ve_a
      L0_2 = L0_2.waitForReady
      L0_2(L0_2)
      L0_2 = _ve_a
      L0_2 = L0_2.try_start
      L0_2(L0_2)
      L0_2 = _ve_a
      L0_2 = L0_2.setWorldTransform
      L0_2(L0_2, findGameObject2("Node", "locator2_ve_a_01"):getWorldTransform())
      L0_2 = _ve_a
      L0_2 = L0_2.setActive
      L0_2(L0_2, true)
      L0_2 = {}
      L0_2.xz = {
        rand = 1,
        sign = 1,
        max_a = 1,
        min_a = 0.5,
        max_t = 50,
        min_t = 40
      }
      L0_2.y = {
        rand = 0.5,
        sign = 1,
        max_a = 0.2,
        min_a = 0.1,
        max_t = 5,
        min_t = 3
      }
      L0_2.angle = {
        rand = 0,
        sign = 0,
        max_a = 0,
        min_a = 0,
        max_t = 60,
        min_t = 50
      }
      _ve_a:setDriftParams(L0_2)
      start_game_obj()
      _no_ship = false
    end
    L0_2 = _bag_create_flg
    if L0_2 then
      L0_2 = {
        Fn_createGimmickBg("locator2_box_01", "bag", "chair_yj_01_brk_dy", true, "chair_yj_01_brk_dy_event"),
        Fn_createGimmickBg("locator2_box_02", "bag", "chair_yj_04_brk_dy", true, "chair_yj_04_brk_dy_event"),
        Fn_createGimmickBg("locator2_box_03", "bag", "woodbox_sk_01", true, "woodbox_sk_01_event"),
        Fn_createGimmickBg("locator2_box_04", "bag", "table_sk_02", true, "photo_table_sk_02_event"),
        Fn_createGimmickBg("locator2_box_05", "bag", "bench_kk_03_brk_dy", true, "bench_kk_03_brk_dy_event"),
        Fn_createGimmickBg("locator2_box_06", "bag", "piano_md_01", true, "piano_md_01_event"),
        Fn_createGimmickBg("locator2_box_07", "bag", "woodbox_ms_01", true, "woodbox_ms_01_event"),
        Fn_createGimmickBg("locator2_box_08", "bag", "woodbox_kk_02", true, "woodbox_kk_02_event"),
        Fn_createGimmickBg("locator2_box_09", "bag", "woodbox_kk_05", true, "woodbox_kk_05_event"),
        Fn_createGimmickBg("locator2_box_10", "bag", "woodbox_kk_05", true, "woodbox_kk_05_event")
      }
      _bag_hdl = L0_2
      _bag_create_end = true
      _bag_create_flg = false
    end
    L0_2 = wait
    L0_2()
  end
end
function Finalize()
  local L0_3, L1_4
end
function requestShipCreate()
  local L0_5, L1_6
  _no_ship = true
end
function requestBagCreate()
  local L0_7, L1_8
  _bag_create_flg = true
end
function resetShipPosition()
  _ve_a:setWorldTransform(findGameObject2("Node", "locator2_ve_a_01"):getWorldTransform())
  _ve_a:setForceMove()
end
function assignDymObj(A0_9, A1_10)
  _dym_obj[A1_10] = A0_9
end
function isBagCreateEnd()
  local L0_11, L1_12
  L0_11 = _bag_create_end
  return L0_11
end
function getBagHdl()
  local L0_13, L1_14
  L0_13 = _bag_hdl
  return L0_13
end
function getVeHdl()
  local L0_15, L1_16
  L0_15 = _ve_a
  return L0_15
end
function getDymObj()
  local L0_17, L1_18
  L0_17 = _dym_obj
  return L0_17
end
