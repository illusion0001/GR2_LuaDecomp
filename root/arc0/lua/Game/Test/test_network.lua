import("HUD")
import("Ugc")
s_mineinfo = {
  {
    id = 0,
    total = 0,
    limit = 10
  },
  {
    id = 1,
    total = 5,
    limit = 20
  },
  {
    id = 2,
    total = 10,
    limit = 30
  }
}
function send_call()
  local L0_0, L1_1
  L0_0 = s_mineinfo
  return L0_0
end
function recv_call(A0_2, A1_3)
  local L2_4
  L2_4(string.format("recv_call = %d:%d", A0_2, A1_3))
  for _FORV_5_ = 1, #s_mineinfo do
    if s_mineinfo[_FORV_5_].id == A0_2 then
      s_mineinfo[_FORV_5_].total = s_mineinfo[_FORV_5_].total + A1_3
    end
  end
end
function main()
  Ugc:mineSetSendCallback(send_call)
  Ugc:mineSetRecvCallback(recv_call)
  Ugc:serviceStart()
  invokeTask(function()
    s_enter = 0
    s_mineId = 2
    while true do
      if Ugc:getParamTable() ~= nil then
        if Ugc:getParamTable():getRoot().version ~= nil then
          print(string.format("version = %f", Ugc:getParamTable():getRoot().version))
        else
          print("is network table!")
        end
      else
        print("yet!")
      end
      wait()
    end
  end)
end
