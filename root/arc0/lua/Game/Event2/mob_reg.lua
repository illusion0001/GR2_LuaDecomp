function Area.on_started(A0_0)
  if mob_sandbox then
    mob_sandbox:sendEvent("on_area_started", A0_0)
  end
end
