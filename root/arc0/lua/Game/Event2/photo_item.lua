import("PhotoMgr")
import("GameDatabase")
function main()
  invokeTask(function()
    while true do
      if GameDatabase:get(ggd.GlobalSystemFlags__PhotoItemLoad) then
        GameDatabase:set(ggd.GlobalSystemFlags__PhotoItemLoad, false)
        PhotoMgr:StartLoad()
        print(" - photo_item - : start load")
      end
      wait()
    end
  end)
end
