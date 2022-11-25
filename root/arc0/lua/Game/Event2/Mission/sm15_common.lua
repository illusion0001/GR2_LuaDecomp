local L1_1
function L0_0(A0_2, A1_3)
  return (invokeTask(function()
    while true do
      if _is_area_distant then
        if A1_3 ~= nil then
          if type(A1_3) == "string" then
            Fn_naviSet(findGameObject2("Node", A1_3))
          else
            Fn_naviSet(A1_3)
          end
        end
        Fn_captionViewWait(A0_2)
        while _is_area_distant do
          wait()
        end
        if A1_3 ~= nil then
          Fn_naviKill()
        end
      end
      wait()
    end
  end))
end
warningAreaDistant = L0_0
