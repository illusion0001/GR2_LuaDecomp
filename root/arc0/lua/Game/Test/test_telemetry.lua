import("Pad")
import("Debug")
import("Net")
import("HUD")
import("Analytics")
function main()
  invokeTask(function()
    s_errorCode = 0
    while true do
      if s_errorCode >= 0 then
        s_errorCode = Net:telemetryUpdate()
      end
      x = 16
      y = 32
      y = y + 16
      Debug:screenPrint(x, y, "Telemetry Test.")
      if s_errorCode < 0 then
        y = y + 16
        Debug:screenPrint(x, y, string.format("Error: %d", s_errorCode))
      end
      if HUD:testViewerGetKey("Circle") then
        Analytics:missionStatus(Analytics.kMissionStart)
      elseif HUD:testViewerGetKey("Square") then
        Analytics:missionStatus(Analytics.kMissionClear, 10000)
      end
      wait()
    end
    print("LOOP END")
  end)
end
