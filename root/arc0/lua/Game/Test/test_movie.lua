import("HUD")
function main()
  invokeTask(function()
    local L0_0, L1_1
    L0_0 = 0
    while true do
      if L0_0 == 0 then
        L1_1 = HUD
        L1_1 = L1_1.setCheckDirectory
        L1_1(L1_1, "mp4", "mp4", true)
        L0_0 = 1
      elseif L0_0 == 1 then
        L1_1 = HUD
        L1_1 = L1_1.menuStatus
        L1_1 = L1_1(L1_1, "Debug")
        L1_1 = L1_1.state
        if L1_1 ~= "running" then
          L1_1 = HUD
          L1_1 = L1_1.getSelectFileName
          L1_1 = L1_1(L1_1)
          if L1_1 == "" then
            L0_0 = 0
          else
            print("##############################")
            print(L1_1)
            print("##############################")
            HUD:prepareMovie(L1_1)
            HUD:menuReserve("Movie")
            while not HUD:menuIsReserveReady("Movie") do
              wait()
              print("movie wait ...")
            end
            HUD:setMovieCallback(function(A0_2)
              print("[Capture in Movie]" .. A0_2)
              invokeSystemTask(function()
                HUD:menuNeedScriptingCapture()
              end)
            end)
            HUD:menuOpen("Movie")
            wait()
            HUD:menuNotifyReadyCapture()
            L0_0 = 2
          end
        end
      elseif L0_0 == 2 then
        L1_1 = HUD
        L1_1 = L1_1.menuStatus
        L1_1 = L1_1(L1_1, "Movie")
        L1_1 = L1_1.state
        if L1_1 ~= "running" then
          L1_1 = HUD
          L1_1 = L1_1.fadein
          L1_1(L1_1, 0)
          L0_0 = 0
        end
      end
      L1_1 = wait
      L1_1()
    end
  end)
end
