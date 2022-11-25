import("Player")
import("Debug")
import("Font")
import("Pad")
import("Wind")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
DEMO_NO = 0
REC_ON = false
LOAD_WAIT = 30
DEMO_CAT_TBL = {
  "tgs2015_a_c02_a",
  "tgs2015_a_c02_b",
  "tgs2015_a_c02_c",
  "tgs2015_a_c03",
  "tgs2015_a_c04",
  "tgs2015_a_c05"
}
DEMO_OTP_TBL = {
  tgs2015_a_c02_a = {
    node = "locator2_cat_02",
    wind = 0.4,
    far = 25,
    aera_stop = true
  },
  tgs2015_a_c02_b = {
    node = "locator2_cat_03",
    wind = 0.4,
    far = 23,
    aera_stop = true
  },
  tgs2015_a_c02_c = {
    node = "locator2_cat_04",
    wind = 0.4,
    far = 25,
    aera_stop = true
  },
  tgs2015_a_c03 = {
    node = "locator2_cat_05",
    wind = 0.4,
    far = 30,
    aera_stop = true
  },
  tgs2015_a_c04 = {
    node = "locator2_cat_06",
    wind = 0.5,
    far = 18,
    aera_stop = false
  },
  tgs2015_a_c05 = {
    node = "locator2_cat_07",
    wind = 0.5,
    far = 18,
    aera_stop = false
  }
}
DEMO_CAT_MIN = 1
DEMO_CAT_MAX = #DEMO_CAT_TBL
_polydemo = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = mother2
  L1_1 = L0_0
  L0_0 = L0_0.sendEvent
  L2_2 = "getBackgroundElement2Handle"
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L2_2 = L0_0
  L1_1 = L0_0.findSubArea
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = L0_0.findSubArea
  L2_2 = L2_2(L3_3, L4_4)
  L3_3()
  if L3_3 > 0 then
    DEMO_CAT_MIN = L3_3
    DEMO_CAT_MAX = L3_3
  end
  for L6_6 = DEMO_CAT_MIN, DEMO_CAT_MAX do
    L7_7 = DEMO_CAT_TBL
    L7_7 = L7_7[L6_6]
    _polydemo[L6_6] = createGameObject2("PolyDemo")
    if loadFileAsset("evd", "/pdemo/" .. L7_7) ~= nil then
      loadFileAsset("evd", "/pdemo/" .. L7_7):wait()
      _polydemo[L6_6]:setDescription(loadFileAsset("evd", "/pdemo/" .. L7_7):getRoot())
    end
    if loadFileAsset("evd", "/pdemo/" .. L7_7 .. "_eff") ~= nil then
      loadFileAsset("evd", "/pdemo/" .. L7_7 .. "_eff"):wait()
      _polydemo[L6_6]:setEffectDescription(loadFileAsset("evd", "/pdemo/" .. L7_7 .. "_eff"):getRoot())
    end
    _polydemo[L6_6]:setName(L7_7)
    _polydemo[L6_6]:setManualSwitchCamera(true)
    if L7_7 == "tgs2015_a_c02_a" then
      L2_2:appendChild(_polydemo[L6_6])
    else
      L1_1:appendChild(_polydemo[L6_6])
    end
    _polydemo[L6_6]:setVisible(false)
  end
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13
  L0_8 = Debug
  L0_8 = L0_8.setValue
  L4_12 = "FIOS2Driver Status"
  L0_8(L1_9, L2_10, L3_11)
  L0_8 = Debug
  L0_8 = L0_8.setValue
  L4_12 = "FPS"
  L0_8(L1_9, L2_10, L3_11)
  L0_8 = Debug
  L0_8 = L0_8.setValue
  L4_12 = "SetPerformParam(Maximum)"
  L0_8(L1_9, L2_10)
  L0_8 = Fn_getPlayer
  L0_8 = L0_8()
  L1_9(L2_10, L3_11)
  L1_9(L2_10, L3_11)
  L1_9(L2_10)
  L1_9()
  L1_9(L2_10)
  for L4_12 = DEMO_CAT_MIN, DEMO_CAT_MAX do
    while true do
      L5_13 = _polydemo
      L5_13 = L5_13[L4_12]
      L5_13 = L5_13.isSetupDone
      L5_13 = L5_13(L5_13)
      if L5_13 == false then
        L5_13 = wait
        L5_13()
      end
    end
  end
  L1_9(L2_10)
  L4_12 = 0
  L1_9(L2_10, L3_11, L4_12)
  L1_9()
  L1_9(L2_10, L3_11)
  for L4_12 = DEMO_CAT_MIN, DEMO_CAT_MAX do
    L5_13 = Wind
    L5_13 = L5_13.setIntensity
    L5_13(L5_13, DEMO_OTP_TBL[DEMO_CAT_TBL[L4_12]].wind)
    L5_13 = Debug
    L5_13 = L5_13.setValue
    L5_13(L5_13, {
      "Gfx",
      "Character",
      "Contour Far"
    }, DEMO_OTP_TBL[DEMO_CAT_TBL[L4_12]].far)
    L5_13 = findGameObject2
    L5_13 = L5_13("Node", DEMO_OTP_TBL[DEMO_CAT_TBL[L4_12]].node)
    if L5_13 ~= nil then
      Player:reset(Player.kReset_Standing, L5_13:getWorldTransform())
      Area:setAnimMoveDriftEnable(true, true, true)
      if DEMO_OTP_TBL[DEMO_CAT_TBL[L4_12]].aera_stop == true and Fn_getParentArea(L5_13) ~= nil then
        Fn_getParentArea(L5_13):setDriftEnable(false)
      end
    end
    if 0 < LOAD_WAIT then
      for _FORV_9_ = 1, LOAD_WAIT do
        Font:testPrint(320, 100, "\227\130\171\227\131\131\227\131\136\229\144\141\239\188\154" .. DEMO_CAT_TBL[L4_12])
        Font:testPrint(320, 150, "\227\131\173\227\131\188\227\131\137\229\190\133\227\129\161\228\184\173\226\128\166\230\174\139\227\130\138\239\188\154" .. string.format("%02d", LOAD_WAIT - _FORV_9_))
        Font:testPrint(320, 200, "\227\129\147\227\129\174\227\131\134\227\130\173\227\130\185\227\131\136\227\129\140\230\182\136\227\129\136\227\129\159\229\190\140 \227\128\135\227\131\156\227\130\191\227\131\179\227\129\167\233\128\178\227\129\191\227\129\190\227\129\153")
        wait()
      end
    end
    while true do
      if _FOR_:getButton(Pad.kButton_Enter) == false then
        wait()
      end
    end
    _polydemo[L4_12]:play()
    if REC_ON == true then
      Debug:setValue({
        "Capture / ScreenShot",
        "Capture Movie"
      })
    end
    while _polydemo[L4_12]:isDemoEnd() == false do
      wait()
    end
    if REC_ON == true then
      Debug:setValue({
        "Capture / ScreenShot",
        "Capture Movie"
      })
    end
    if L4_12 < DEMO_CAT_MAX then
      _polydemo[L4_12 + 1]:switchCamera(true, 0)
      wait()
      _polydemo[L4_12]:setVisible(false)
      _polydemo[L4_12 + 1]:setVisible(true)
      _polydemo[L4_12]:try_term()
    end
  end
  L1_9(L2_10)
  L1_9(L2_10, L3_11)
  L1_9(L2_10, L3_11)
  L0_8 = nil
  L1_9(L2_10)
  L4_12 = 20
  L5_13 = 20
  L5_13 = L3_11(L4_12, L5_13, 20)
  L1_9(L2_10, L3_11, L4_12, L5_13, L3_11(L4_12, L5_13, 20))
  L1_9(L2_10)
  L1_9()
  L1_9()
end
function Finalize()
  Fn_userCtrlOn()
  _polydemo = nil
end
