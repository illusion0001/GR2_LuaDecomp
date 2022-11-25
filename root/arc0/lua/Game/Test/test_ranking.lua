local L1_1, L2_2, L3_3
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
function L0_0()
  HUD:menuOpen("RankingLogin")
  while true do
    menuStatus = HUD:menuStatus("RankingLogin")
    if menuStatus.state == "no entry" then
      print("RankingLogin END")
      break
    end
    wait()
  end
end
function L1_1(A0_4, A1_5)
  ret = nil
  HUD:rankingUpload(A0_4, A1_5)
  while true do
    menuStatus = HUD:menuStatus("RankingUpload")
    if menuStatus.state == "no entry" then
      ret = HUD:rankingUploadResult()
      break
    end
    wait()
  end
  return ret
end
function L2_2(A0_6)
  ret = nil
  HUD:rankingOpen(A0_6)
  while true do
    menuStatus = HUD:menuStatus("Ranking")
    if menuStatus.state == "no entry" then
      ret = HUD:rankingResult()
      break
    end
    wait()
  end
  return ret
end
function L3_3(A0_7)
  ret = nil
  HUD:rankingDownload(A0_7)
  while true do
    if HUD:rankingDownloadEnd() == true then
      ret = HUD:rankingGetDownloadData()
      break
    end
    wait()
  end
  return ret
end
function main()
  local L0_8, L1_9, L2_10, L3_11
  L0_8 = "cm90"
  L1_9 = 10
  L2_10, L3_11 = nil, nil
  L0_0()
  L2_10 = L2_2(L0_8)
  if L2_10.ErrorCode == 0 then
    print("RankingResult OnlineID : " .. L2_10.OnlineID)
    L3_11 = L3_3(L2_10.filepath)
    if 0 <= L3_11.result then
      print("SetGhost")
      L3_11.ghost = nil
    end
  elseif L2_10.ErrorCode == 1 then
    print("RankingResult Cancel")
  end
end
