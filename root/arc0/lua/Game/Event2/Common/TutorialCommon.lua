import("Pad")
__tutorialCaptionHandle = nil
__tutorialTaskAvailable = true
function Fn_tutorialCaption(A0_0)
  if __tutorialCaptionHandle ~= nil then
    print("Fn_tutorialCaption: Handle Already Exists.")
    return
  end
  print("Fn_tutorialCaption: Task Start.")
  __tutorialTaskAvailable = true
  __tutorialCaptionHandle = invokeTask(function()
    local L0_1
    L0_1 = nil
    while true do
      if A0_0 == "gravity" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00120"
          elseif Player:getAction() == Player.kAction_Idle then
            L0_1 = "ic_tutorial_00130"
          end
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "gravity_r1_only" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00140"
          elseif Player:getAction() == Player.kAction_Idle then
            L0_1 = "ic_tutorial_00130"
          end
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "camera" then
        L0_1 = "ic_tutorial_00902"
      elseif A0_0 == "camera_reset" then
        L0_1 = "ic_tutorial_00070"
      elseif A0_0 == "gravityfirst" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00135"
          elseif Player:getAction() == Player.kAction_Idle then
            L0_1 = "ic_tutorial_00130"
          else
            L0_1 = nil
          end
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "gravitysecond" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00911"
          elseif Player:getAction() == Player.kAction_Idle then
            L0_1 = "ic_tutorial_00130"
          else
            L0_1 = nil
          end
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "gravity_ep02_01" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            wait(2)
            L0_1 = "ic_tutorial_00140"
          else
            L0_1 = "ic_tutorial_00800"
          end
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "gravity_ep02_02" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00140"
          else
            L0_1 = nil
          end
        else
          L0_1 = nil
        end
      elseif A0_0 == "camera_ep02_01" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00901"
          else
            L0_1 = "ic_tutorial_00902"
          end
        else
          L0_1 = "ic_tutorial_00901"
        end
      elseif A0_0 == "gravity_ep02_03" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00145"
          else
            L0_1 = "ic_tutorial_00155"
          end
        else
          L0_1 = nil
        end
      elseif A0_0 == "gravity_ep02_04" then
        if Player:isGravityControlMode() then
          L0_1 = "ic_tutorial_00120"
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "move_ep02_01" then
        L0_1 = "ic_tutorial_00904"
      elseif A0_0 == "gyro_ep02_01" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00910"
          elseif Player:getAction() == Player.kAction_Idle then
            L0_1 = "ic_tutorial_00130"
          else
            L0_1 = "ic_tutorial_00903"
          end
        else
          L0_1 = "ic_tutorial_00130"
        end
      elseif A0_0 == "gravitycancel_ep02_01" then
        L0_1 = "ic_tutorial_00150"
      elseif A0_0 == "gravitymove" then
        if Player:isGravityControlMode() then
          L0_1 = "ic_tutorial_00900"
        end
      elseif A0_0 == "battle_ep02_01" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          L0_1 = "ic_tutorial_00212"
          once = false
        else
          L0_1 = nil
        end
      elseif A0_0 == "battle_ep02_02" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          L0_1 = "ic_tutorial_00220"
        else
          L0_1 = nil
        end
      elseif A0_0 == "ep02_grab" then
        if Player:getGrabStatus() == Player.kGrabStatus_Holding then
          L0_1 = "ic_tutorial_00420"
        else
          L0_1 = "ic_tutorial_00410"
        end
      elseif A0_0 == "battle_ep02_03" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAction() == Player.kAction_Idle or Player:getAction() == Player.kAction_Run or Player:getAction() == Player.kAction_Jump then
            L0_1 = "ic_tutorial_00907"
          elseif Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00908"
            once = false
          else
            L0_1 = nil
          end
        else
          L0_1 = nil
        end
      elseif A0_0 == "battle_ep02_04" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          L0_1 = "ic_tutorial_00909"
        else
          L0_1 = nil
        end
      elseif A0_0 == "gravitythird" then
        if Player:isGravityControlMode() then
          if Player:getAction() == Player.kAction_Float then
            L0_1 = "ic_tutorial_00145"
          else
            L0_1 = "ic_tutorial_00155"
          end
        else
          L0_1 = nil
        end
      elseif A0_0 == "move" then
        L0_1 = "ic_tutorial_00904"
      elseif A0_0 == "move_only" then
        L0_1 = "ic_tutorial_00905"
      elseif A0_0 == "jump" then
        L0_1 = "ic_tutorial_00906"
        once = false
      elseif A0_0 == "kick" then
        L0_1 = "ic_tutorial_00212"
      elseif A0_0 == "kick_escape" then
        L0_1 = "ic_tutorial_00921"
      elseif A0_0 == "gravitykick" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAction() == Player.kAction_Idle or Player:getAction() == Player.kAction_Run or Player:getAction() == Player.kAction_Jump then
            L0_1 = "ic_tutorial_00907"
          elseif Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00908"
            once = false
          else
            L0_1 = "ic_tutorial_00130"
            once = false
          end
        else
          L0_1 = nil
        end
      elseif A0_0 == "attack" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00200"
          else
            L0_1 = "ic_tutorial_00212"
          end
        end
      elseif A0_0 == "escape" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          L0_1 = "ic_tutorial_00220"
        end
      elseif A0_0 == "gravitykick_ep01" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            if Player:getAction() == Player.kAction_Float then
              L0_1 = "ic_tutorial_00200"
            elseif Player:getAction() == Player.kAction_AnyGravKick then
              L0_1 = nil
            else
              L0_1 = "ic_tutorial_00130"
            end
          else
            L0_1 = "ic_tutorial_00130"
          end
        end
      elseif A0_0 == "airdodge" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          L0_1 = "ic_tutorial_00909"
        end
      elseif A0_0 == "an_allattack" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00205"
          else
            L0_1 = "ic_tutorial_00210"
          end
        end
      elseif A0_0 == "tune_norm_mars" then
        L0_1 = "ic_tutorial_00912"
      elseif A0_0 == "tune_norm_mars_jupt" then
        L0_1 = "ic_tutorial_00913"
      elseif A0_0 == "mars_shift" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00500"
        else
          L0_1 = nil
        end
      elseif A0_0 == "mars" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00500"
        else
          L0_1 = "ic_tutorial_00510"
        end
      elseif A0_0 == "mars_sidejump" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00500"
        else
          L0_1 = "ic_tutorial_00520"
        end
      elseif A0_0 == "mars_bigjump" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00500"
        else
          L0_1 = "ic_tutorial_00530"
        end
      elseif A0_0 == "mars_bigjump_dodge" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00500"
        else
          L0_1 = "ic_tutorial_00535"
        end
      elseif A0_0 == "mars_move" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00500"
        else
          L0_1 = "ic_tutorial_00540"
        end
      elseif A0_0 == "mars_kick" then
        if Player:getAttrTune() == Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00211"
        else
          L0_1 = "ic_tutorial_00550"
        end
      elseif A0_0 == "mars_grab" then
        if Player:getAttrTune() == Player.kAttrTune_Mars then
          L0_1 = "ic_tutorial_00560"
        else
          L0_1 = "ic_tutorial_00550"
        end
      elseif A0_0 == "marsgrav_kick" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAttrTune() == Player.kAttrTune_Mars and Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00570"
          elseif Player:getAttrTune() == Player.kAttrTune_Mars then
            L0_1 = "ic_tutorial_00130"
          elseif Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00550"
          else
            L0_1 = "ic_tutorial_00580"
          end
        end
      elseif A0_0 == "jupiter_shift" then
        if Player:getAttrTune() ~= Player.kAttrTune_Jupiter then
          L0_1 = "ic_tutorial_00610"
        else
          L0_1 = nil
        end
      elseif A0_0 == "jupiter_first" then
        if Player:getAttrTune() == Player.kAttrTune_Jupiter then
          L0_1 = "ic_tutorial_00600"
        else
          L0_1 = "ic_tutorial_00610"
        end
      elseif A0_0 == "jupiter" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAttrTune() == Player.kAttrTune_Jupiter and Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00620"
          elseif Player:getAttrTune() == Player.kAttrTune_Jupiter then
            L0_1 = "ic_tutorial_00130"
          elseif Player:isGravityControlMode() then
            L0_1 = "ic_tutorial_00610"
          else
            L0_1 = "ic_tutorial_00630"
          end
        else
          L0_1 = "ic_tutorial_00640"
        end
      elseif A0_0 == "jupiter_kick" then
        if Player:getAttrTune() == Player.kAttrTune_Jupiter then
          L0_1 = "ic_tutorial_00212"
        else
          L0_1 = "ic_tutorial_00610"
        end
      elseif A0_0 == "jupiter_grab" then
        if Player:getAttrTune() == Player.kAttrTune_Jupiter then
          L0_1 = "ic_tutorial_00650"
        else
          L0_1 = "ic_tutorial_00610"
        end
      elseif tyep == "jupiter_sp_grab" then
        if Player:getAttrTune() == Player.kAttrTune_Jupiter then
          if Player:getGrabStatus() == Player.kGrabStatus_Holding then
            L0_1 = "ic_tutorial_00915"
          else
            L0_1 = "ic_tutorial_00916"
          end
        end
      elseif A0_0 == "jup_sli" then
        if Player:getAttrTune() ~= Player.kAttrTune_Jupiter then
          L0_1 = "ic_tutorial_00660"
        else
          L0_1 = "ic_tutorial_00670"
        end
      elseif A0_0 == "normal" then
        if Player:getAttrTune() ~= Player.kAttrTune_Normal then
          L0_1 = "ic_tutorial_00400"
        end
      elseif A0_0 == "grab" then
        L0_1 = "ic_tutorial_00410"
      elseif A0_0 == "throw" then
        if Player:getGrabStatus() == Player.kGrabStatus_Holding then
          L0_1 = "ic_tutorial_00420"
        else
          L0_1 = "ic_tutorial_00410"
        end
      elseif A0_0 == "sp_grab" then
        if Player:getGrabStatus() == Player.kGrabStatus_Holding then
          L0_1 = "ic_tutorial_00420"
        else
          L0_1 = "ic_tutorial_00425"
        end
      elseif A0_0 == "sp_attack" then
        L0_1 = "ic_tutorial_00430"
      elseif A0_0 == "sp_gem" then
        L0_1 = "ic_tutorial_00435"
      elseif A0_0 == "crow_jup_gravkick" then
        if Player:getAttrTune() ~= Player.kAttrTune_Jupiter then
          L0_1 = "ic_tutorial_00660"
        else
          L0_1 = "ic_tutorial_00700"
        end
      elseif A0_0 == "slider" then
        L0_1 = "ic_tutorial_00914"
      elseif A0_0 == "normal_sp" then
        if Player:getAttrTune() ~= Player.kAttrTune_Normal then
          L0_1 = "ic_tutorial_00400"
        else
          L0_1 = "ic_tutorial_00710"
        end
      elseif A0_0 == "pause_skip" then
        L0_1 = "ic_tutorial_00715"
      elseif A0_0 == "camera_setting" then
        L0_1 = "ic_tutorial_00720"
      elseif A0_0 == "map" then
        L0_1 = "ic_tutorial_00730"
      elseif A0_0 == "Qte_R1" then
        L0_1 = "ic_tutorial_00917"
      elseif A0_0 == "Qte_Camera" then
        L0_1 = "ic_tutorial_00918"
      elseif A0_0 == "Qte_Square" then
        L0_1 = "ic_tutorial_00919"
      elseif A0_0 == "options" then
        L0_1 = "ic_tutorial_00920"
      elseif A0_0 == "feline" then
        L0_1 = "ic_tutorial_00923"
      elseif A0_0 == "puzzle" then
        L0_1 = "ic_tutorial_00922"
      elseif A0_0 == "puzzle_tutorial" then
        L0_1 = "ic_tutorial_00924"
      end
      if L0_1 ~= nil and __tutorialTaskAvailable then
        if L0_1 ~= nil then
          Fn_captionView(L0_1, 0)
        else
          Fn_captionViewEnd()
          print("Fn_tutorialCaption: Id is nil.")
        end
      end
      wait()
    end
  end)
end
function Fn_tutorialCaptionKill()
  if __tutorialCaptionHandle ~= nil then
    if not __tutorialTaskAvailable then
      print("Fn_tutorialCaptionKill: Now Closing Task.")
      return
    end
    __tutorialTaskAvailable = false
    invokeTask(function()
      __tutorialCaptionHandle:abort()
      while __tutorialCaptionHandle:isRunning() do
        wait()
      end
      Fn_captionViewEnd()
      __tutorialCaptionHandle = nil
      print("Fn_tutorialCaptionKill: Task aborted.")
    end)
  else
    print("Fn_tutorialCaptionKill: Handle Not Found.")
  end
end
