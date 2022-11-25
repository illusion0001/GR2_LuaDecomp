import("HUD")
function main()
  HUD:menuOpen("Title")
  repeat
    wait()
    result = HUD:menuStatus("Title")
    if result.state ~= "running" or result.touch == "newgame" then
    elseif result.touch == "loadgame" then
    elseif result.touch == "staffcredit" then
    end
  until result.state == "no entry"
end
