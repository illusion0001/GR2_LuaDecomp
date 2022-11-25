local L1_1
GEM_S = 1
GEM_M = 2
GEM_L = 3
GEM_ENERGY = 4
GEM_VITAL = 5
GEM_SPECIAL = 6
L0_0 = {}
L1_1 = {}
L1_1.dynamic = true
L0_0.gellyfish = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.gellyfish_strong = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.gellyfish_dark = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.gellyfish_shine = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.gellyfish_high = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.gellyfish_rare = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.imp = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.imp_strong = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.imp_dark = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.imp_shine = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.imp_high = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.imp_rare = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lasercannon = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lasercannon_strong = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lasercannon_dark = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lasercannon_shine = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lasercannon_high = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lasercannon_rare = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lunafishowner = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lunafish_strong = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lunafish_dark = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lunafish_shine = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lunafish_high = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.lunafishowner_rare = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.jammer = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.jammer_rare = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.hand = L1_1
L1_1 = {}
L1_1.dynamic = false
L0_0.mothership = L1_1
L1_1 = {}
L1_1.dynamic = false
L0_0.mothership_strong = L1_1
L1_1 = {}
L1_1.dynamic = false
L0_0.mothership_dark = L1_1
L1_1 = {}
L1_1.dynamic = false
L0_0.mothership_shine = L1_1
L1_1 = {}
L1_1.dynamic = false
L0_0.mothership_high = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.mechsky = L1_1
L1_1 = {}
L1_1.dynamic = true
L0_0.stingray = L1_1
L1_1 = {}
L1_1.dynamic = false
L0_0.bub = L1_1
float_gem_tbl = L0_0
L0_0 = {}
__pop_tbl = L0_0
__rnd_sec = 0
function L0_0(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  function L3_5(A0_11, A1_12, A2_13)
    if __pop_tbl[A2_13] ~= nil then
      for _FORV_6_, _FORV_7_ in pairs(__pop_tbl[A2_13].name) do
        if _FORV_7_ == A1_12.brain:getName() then
          __pop_tbl[A2_13].cnt = __pop_tbl[A2_13].cnt + 1
          if __pop_tbl[A2_13].max <= __pop_tbl[A2_13].cnt then
            invokeTask(function()
              local L0_14, L1_15
              L0_14 = createGameObject2
              L1_15 = "Gem"
              L0_14 = L0_14(L1_15)
              L1_15 = L0_14.setGemModelNo
              L1_15(L0_14, __pop_tbl[A2_13].gem)
              L1_15 = __rnd_sec
              if L1_15 <= 0 then
                L1_15 = L0_14.setWorldTransform
                L1_15(L0_14, A1_12.pos)
                __rnd_sec = 1
                L1_15 = invokeTask
                L1_15(function()
                  repeat
                    __rnd_sec = __rnd_sec - 0.1
                    waitSeconds(0.1)
                  until __rnd_sec <= 0
                end)
              else
                L1_15 = L0_14.setWorldTransform
                L1_15(L0_14, A1_12.pos + Vector(RandF(-0.5, 0.5), RandF(-0.5, 0.5), RandF(-0.5, 0.5)))
              end
              L1_15 = float_gem_tbl
              L1_15 = L1_15[A1_12.type]
              if L1_15 ~= nil then
                L1_15 = float_gem_tbl
                L1_15 = L1_15[A1_12.type]
                L1_15 = L1_15.dynamic
                L0_14:setDynamic(L1_15)
                if L1_15 == true then
                  L0_14:setFallParameter(0.1, 0.2)
                end
              else
                L1_15 = L0_14.setDynamic
                L1_15(L0_14, true)
              end
              L1_15 = L0_14.try_init
              L1_15(L0_14)
              L1_15 = L0_14.waitForReadyAsync
              L1_15(L0_14, function()
                L0_14:try_start()
                if float_gem_tbl[A1_12.type] == nil or float_gem_tbl[A1_12.type] ~= nil and float_gem_tbl[A1_12.type].dynamic == true then
                  L0_14:setImpulse(A1_12.impulse)
                end
              end)
            end)
            __pop_tbl[A2_13].cnt = 0
          end
          break
        end
      end
    end
  end
  enemy_ash_pop_gem = L3_5
  L3_5 = A0_2.getName
  L3_5 = L3_5(L4_6)
  if A2_4 ~= nil then
    for L7_9, L8_10 in L4_6(L5_7) do
      enemy_ash_pop_gem(A0_2, A1_3, L3_5 .. "_" .. L8_10)
    end
  else
    L7_9 = L3_5
    L4_6(L5_7, L6_8, L7_9)
  end
end
Fn_enemyAshPopGem = L0_0
function L0_0(A0_16, A1_17, A2_18, A3_19, A4_20)
  local L5_21
  L5_21 = A0_16.getName
  L5_21 = L5_21(A0_16)
  if A4_20 ~= nil and A4_20 ~= "" then
    L5_21 = L5_21 .. "_" .. A4_20
  end
  __pop_tbl[L5_21] = {
    name = A1_17,
    cnt = 0,
    max = A2_18,
    gem = A3_19,
    group = A4_20
  }
end
Fn_enemyPopGemSetup = L0_0
