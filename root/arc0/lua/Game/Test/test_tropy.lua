import("Pad")
import("Debug")
import("Net")
import("HUD")
function main()
  invokeTask(function()
    s_trophyId = 1
    s_errorCode = 0
    while true do
      if s_errorCode >= 0 then
        s_errorCode = Net:trophyUpdate()
      end
      x = 16
      y = 32
      y = y + 16
      Debug:screenPrint(x, y, "Trophy Test.")
      y = y + 16
      Debug:screenPrint(x, y, string.format("selectID : %d", s_trophyId))
      if s_errorCode < 0 then
        y = y + 16
        Debug:screenPrint(x, y, string.format("Error: %d", s_errorCode))
      end
      if HUD:testViewerGetKey("Circle") then
        Net:trophyUnlock(s_trophyId)
        s_trophyId = s_trophyId + 1
      end
      wait()
    end
    print("LOOP END")
  end)
end
