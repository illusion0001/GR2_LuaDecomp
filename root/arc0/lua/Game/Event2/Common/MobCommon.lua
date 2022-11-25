import("Mob")
function Fn_mobWaitForReady()
  local L0_0, L1_1, L2_2
  L0_0 = 200
  L1_1 = 0
  L2_2 = 0
  while true do
    if GameDatabase:get(ggd.Savedata__EventManageFlags__Mob) == true then
      if Mob:probeInternal() then
        if L1_1 < 30 then
          if L2_2 < Mob:probeInternal().reserveWait then
            L2_2 = Mob:probeInternal().reserveWait
            print("ev header : mob kwait", L2_2)
          end
        elseif L2_2 / 4 >= Mob:probeInternal().reserveWait then
          print("ev header : mob kwait decrease", L2_2, L1_1)
          break
        else
          print("ev header : mob waiting...")
        end
        L1_1 = L1_1 + 1
        if L0_0 <= L1_1 then
          print("ev header : mob kwait timeout")
          break
        end
        wait()
    end
    else
      print("ev header : mob not found!")
    end
  end
end
