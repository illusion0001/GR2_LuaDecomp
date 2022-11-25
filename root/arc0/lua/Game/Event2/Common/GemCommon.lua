import("GlobalGem")
function global_gem_initialize()
  GlobalGem:SetPreciousGemAddCallback("OnPreciousGemAdd")
  GlobalGem:SetTalismanGetCallback("OnTalismanGet")
end
function OnPreciousGemAdd(A0_0)
  print(A0_0:getName())
  print("OnPreciousGemAdd")
end
function OnTalismanGet(A0_1)
  print(A0_1:getUnknownName())
  print("OnTalismanGet")
end
