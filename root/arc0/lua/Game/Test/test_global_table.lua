import("DeltaTimer")
import("GameDatabase")
import("Debug")
function test_call(A0_0)
  return A0_0 + 1
end
function main()
  local L0_1, L1_2
  L0_1 = ggd
  if L0_1 ~= nil then
    L0_1 = print
    L1_2 = ggd
    L1_2 = L1_2.Debug__PlayerLevel
    L0_1(L1_2)
    L0_1 = print
    L1_2 = ggd
    L1_2 = L1_2.Debug__TitleSkip
    L0_1(L1_2)
  end
  L0_1 = Debug
  L1_2 = L0_1
  L0_1 = L0_1.setValue
  L0_1(L1_2, {
    "Development",
    "Console",
    "Script"
  }, true)
  L0_1 = DeltaTimer
  L1_2 = L0_1
  L0_1 = L0_1.new
  L0_1 = L0_1(L1_2)
  L1_2 = 0
  L0_1:start()
  while L1_2 < 100000 do
    L1_2 = test_call(L1_2)
  end
  L0_1:stop()
  print("TIME = " .. L0_1:getMSecond())
end
