import("Font")
import("HUD")
function main()
  Font:openTextSet("Ingame")
  HUD:captionBegin("ic_areaname_01")
  setExitCallback(function()
    HUD:captionEnd()
  end)
end
