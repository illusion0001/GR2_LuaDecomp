local L1_1
function L0_0()
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
playFirstAmb = L0_0
function L0_0(A0_2, A1_3)
  if _amb_handle == nil then
    _amb_handle = Sound:playSEHandle(A0_2, 1, A1_3)
    debugPrint("amb\229\134\141\231\148\159 " .. ":" .. (A0_2 or "nil") .. ":" .. (A1_3 or "nil"))
  end
end
playAmb = L0_0
function L0_0(A0_4, A1_5)
  if _amb_handle then
    Sound:setVariableHandle(_amb_handle, label, A1_5)
    debugPrint("amb\229\164\137\230\155\180 " .. ":" .. (A0_4 or "nil") .. ":" .. (A1_5 or "nil"))
  end
end
variableAmb = L0_0
function L0_0()
  if _amb_handle then
    Sound:stopSEHandle(_amb_handle)
    _amb_handle = nil
    debugPrint("amb\229\129\156\230\173\162")
  end
end
stopAmb = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "eaves_small")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_eaves_small = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "eaves_large")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_eaves_large = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "tonnel_small")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_tonnel_small = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "tonnel_large")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_tonnel_large = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "pit")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_pit = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "another_zone")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_another_zone = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "cave")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_cave = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "cave_room")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_cave_room = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "world_column")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_world_column = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "world_column_limb")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_world_column_limb = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "room")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_room = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "corridor")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_corridor = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "boulevard")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_boulevard = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "chamber")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_chamber = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "between")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
Revset_between = L0_0
function L0_0()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
Revset_OnLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\170\227\131\171\227\131\137\227\131\142\227\131\175\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb012", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
cc_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\170\227\131\171\227\131\137\227\131\142\227\131\175\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
cc_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\151\227\131\172\227\130\184\227\131\165\227\131\188\227\131\140\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb013", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
ed_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\151\227\131\172\227\130\184\227\131\165\227\131\188\227\131\140\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
ed_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\164\227\131\179\227\131\128\227\130\185\227\131\136\227\131\170\227\130\168\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb014", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
id_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\164\227\131\179\227\131\128\227\130\185\227\131\136\227\131\170\227\130\168\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
id_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\128\227\130\166\227\131\179\227\130\191\227\130\166\227\131\179\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb015", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
dt_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\128\227\130\166\227\131\179\227\130\191\227\130\166\227\131\179\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
dt_onLeave = L0_0
function L0_0()
  stopAmb()
  playAmb("amb001", "wind_strength 1.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
po_out_onEnter = L0_0
function L0_0()
  stopAmb()
  playAmb("amb001", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
po_out_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \228\184\173\230\181\129\229\177\164\239\188\139\230\184\175\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb001", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
po_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \228\184\173\230\181\129\229\177\164\239\188\139\230\184\175\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
po_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \229\175\140\232\163\149\229\177\164\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb006", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
up_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \229\175\140\232\163\149\229\177\164\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
up_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \232\178\167\230\176\145\229\177\164\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb007", "wind_strength 0.5")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
lo_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \232\178\167\230\176\145\229\177\164\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
lo_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\183\143\231\157\163\229\186\156\239\188\139\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb008", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
go_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \231\183\143\231\157\163\229\186\156\239\188\139\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
go_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\144\227\131\179\227\130\172\233\155\134\232\144\189\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb004", "wind_strength 0.0")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
bu_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\144\227\131\179\227\130\172\233\155\134\232\144\189\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  variableAmb("amb004", "wind_strength 0.5")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
bu_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\146\176\229\162\131\233\159\179\227\130\146\230\173\162\227\130\129\227\130\139")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\170\227\131\171\227\131\137\227\131\142\227\131\175\227\129\174\229\144\185\227\129\141\230\138\156\227\129\145\227\129\171\229\133\165\227\129\163\227\129\159")
  Sound:setGlobalVariable("reverb_set", "filter_cc")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_on")
end
filter_cc_OnEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\170\227\131\171\227\131\137\227\131\142\227\131\175\227\129\174\229\144\185\227\129\141\230\138\156\227\129\145\227\129\139\227\130\137\229\135\186\227\129\159")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
filter_cc_OnLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\128\227\130\166\227\131\179\227\130\191\227\130\166\227\131\179\227\129\174\228\184\139\229\177\164\227\129\171\229\133\165\227\129\163\227\129\159")
  Sound:setGlobalVariable("reverb_set", "filter_dt")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_on")
end
filter_dt_OnEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\131\128\227\130\166\227\131\179\227\130\191\227\130\166\227\131\179\227\129\174\228\184\139\229\177\164\227\129\139\227\130\137\229\135\186\227\129\159")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
filter_dt_OnLeave = L0_0
function L0_0()
  print("SoundFunc.lua \230\142\161\230\142\152\229\160\180\228\184\138\231\169\186\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb002")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_st_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \230\142\161\230\142\152\229\160\180\228\184\138\231\169\186\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_st_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \230\142\161\230\142\152\229\160\180\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb003")
  Sound:setGlobalVariable("reverb_set", "pit")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_pi_01_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \230\142\161\230\142\152\229\160\180\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_pi_01_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\149\176\230\172\161\229\133\1311\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb005")
  Sound:setGlobalVariable("reverb_set", "another_zone")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_az1_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \231\149\176\230\172\161\229\133\1311\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_az1_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\149\176\230\172\161\229\133\1312\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb009")
  Sound:setGlobalVariable("reverb_set", "another_zone")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_az2_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \231\149\176\230\172\161\229\133\1312\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_az2_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\149\176\230\172\161\229\133\1313\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb011")
  Sound:setGlobalVariable("reverb_set", "another_zone")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_az3_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \231\149\176\230\172\161\229\133\1313\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_az3_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \228\186\161\233\156\138\233\131\189\229\184\130\229\134\133\233\131\168\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb010")
  Sound:setGlobalVariable("reverb_set", "cave")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_az4_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \228\186\161\233\156\138\233\131\189\229\184\130\229\134\133\233\131\168\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_az4_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \228\184\150\231\149\140\227\129\174\230\159\177\229\134\133\233\131\168\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb017")
  Sound:setGlobalVariable("reverb_set", "world_column_limb")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_co_a_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \228\184\150\231\149\140\227\129\174\230\159\177\229\164\150\233\131\168\227\129\171\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb016")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_co_a_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \228\184\150\231\149\140\227\129\174\230\159\177\233\160\130\228\184\138\239\188\136\231\142\139\229\174\174\227\129\174\229\164\150\233\131\168\239\188\137\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb018")
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_ve_et_a_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \228\184\150\231\149\140\227\129\174\230\159\177\233\160\130\228\184\138\239\188\136\231\142\139\229\174\174\227\129\174\229\164\150\233\131\168\239\188\137\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_ve_et_a_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\142\139\229\174\174\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb019")
  Sound:setGlobalVariable("reverb_set", "room")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_et2_a_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \231\142\139\229\174\174\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_et2_a_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \231\139\173\233\150\147\227\129\174\228\184\150\231\149\140\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("amb020")
  Sound:setGlobalVariable("reverb_set", "between")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_et3_a_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \231\139\173\233\150\147\227\129\174\228\184\150\231\149\140\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_et3_a_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \232\168\152\230\134\182\227\129\174\232\161\151\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("dm_amb001")
  Sound:setGlobalVariable("reverb_set", "between")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_dm_amb001_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \232\168\152\230\134\182\227\129\174\232\161\151\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_dm_amb001_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\178\227\130\164\227\131\137\227\129\174\228\184\173\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("dm_amb002")
  Sound:setGlobalVariable("reverb_set", "another_zone")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_dm_amb002_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \227\130\178\227\130\164\227\131\137\227\129\174\228\184\173\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_dm_amb002_onLeave = L0_0
function L0_0()
  print("SoundFunc.lua \230\153\130\227\129\140\230\173\162\227\129\190\227\129\163\227\129\159\232\161\151\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  stopAmb()
  playAmb("dm_amb003")
  Sound:setGlobalVariable("reverb_set", "between")
  Sound:setRuntimeEffect("rev_lev", 1)
  Sound:setRuntimeEffect("rev_on")
end
amb_dm_amb003_onEnter = L0_0
function L0_0()
  print("SoundFunc.lua \230\153\130\227\129\140\230\173\162\227\129\190\227\129\163\227\129\159\232\161\151\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  stopAmb()
  Sound:setGlobalVariable("reverb_set", "default")
  Sound:setRuntimeEffect("rev_lev", 0)
  Sound:setRuntimeEffect("rev_off")
end
amb_dm_amb003_onLeave = L0_0
function L0_0()
  variableAmb("amb001", "wind_strength 0.0")
end
variable_amb001_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb001", "wind_strength 0.5")
end
variable_amb001_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb001", "wind_strength 1.0")
end
variable_amb001_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 0.0")
end
variable_amb004_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 0.5")
end
variable_amb004_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 1.0")
end
variable_amb004_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb006", "wind_strength 0.0")
end
variable_amb006_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb006", "wind_strength 0.5")
end
variable_amb006_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb006", "wind_strength 1.0")
end
variable_amb006_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb007", "wind_strength 0.0")
end
variable_amb007_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb007", "wind_strength 0.5")
end
variable_amb007_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb007", "wind_strength 1.0")
end
variable_amb007_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb008", "wind_strength 0.0")
end
variable_amb008_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb008", "wind_strength 0.5")
end
variable_amb008_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb008", "wind_strength 1.0")
end
variable_amb008_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb012", "wind_strength 0.0")
end
variable_amb012_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb012", "wind_strength 0.5")
end
variable_amb012_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb012", "wind_strength 1.0")
end
variable_amb012_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb013", "wind_strength 0.0")
end
variable_amb013_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb013", "wind_strength 0.5")
end
variable_amb013_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb013", "wind_strength 1.0")
end
variable_amb013_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb014", "wind_strength 0.0")
end
variable_amb014_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb014", "wind_strength 1.0")
end
variable_amb014_set_10_OnEnter = L0_0
function L0_0()
  variableAmb("amb015", "wind_strength 0.0")
end
variable_amb015_set_0_OnEnter = L0_0
function L0_0()
  variableAmb("amb015", "wind_strength 0.5")
end
variable_amb015_set_05_OnEnter = L0_0
function L0_0()
  variableAmb("amb015", "wind_strength 1.0")
end
variable_amb015_set_10_OnEnter = L0_0
function L0_0()
  playAmb("amb004", "wind_strength 0.0")
end
playFirstAmb_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 0.5")
end
variable_wind_strength03_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 1.0")
end
variable_wind_strength10_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 0.0")
end
variable_wind_strength0_OnEnter = L0_0
function L0_0()
  stopAmb()
  playAmb("amb004", "wind_strength 1.0")
end
amb004_OnEnter = L0_0
function L0_0()
  variableAmb("amb004", "wind_strength 0.3")
end
amb004_OnLeave = L0_0
function L0_0()
  stopAmb()
end
ep26Stopamb = L0_0
