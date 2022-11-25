import("Debug")
DebugShortcutKey = {
  setup = function(A0_0, A1_1, A2_2, A3_3)
  end
}
if Debug:isDebugShortcutKeyUsable() then
  DebugShortcutKey = {
    _gameobject_class = "DebugShortcutKey",
    _gameobject_name_prefix = "dbg_shortcutkey_",
    _scripts_base_dir_default = "/Debug/ShortcutKey/",
    _scripts_base_dir = "",
    _setup_func = nil,
    _setup_name = "",
    _revert_key_defualt = "f2",
    _revert_key = "",
    _keymaps = {},
    setup = function(A0_4, A1_5, A2_6, A3_7)
      A0_4._scripts_base_dir = A0_4._scripts_base_dir_default
      createGameObject2(A0_4._gameobject_class):setName(A0_4._gameobject_name_prefix .. A1_5)
      createGameObject2(A0_4._gameobject_class):try_init()
      createGameObject2(A0_4._gameobject_class):waitForReady()
      createGameObject2(A0_4._gameobject_class):try_start()
      if A3_7 == nil then
        A3_7 = A0_4._revert_key_defualt
      end
      A0_4._setup_name = A1_5
      A0_4._setup_func = A2_6
      A0_4._revert_key = A3_7
      A0_4:callSetupFunc()
    end,
    callSetupFunc = function(A0_8)
      if A0_8._setup_func ~= nil then
        A0_8._setup_func()
      end
    end,
    setScriptsBasePath = function(A0_9, A1_10)
      A0_9._scripts_base_dir = A1_10
    end,
    getScriptsBasePath = function(A0_11)
      local L1_12
      L1_12 = A0_11._scripts_base_dir
      return L1_12
    end,
    revertScriptsBasePathToDefault = function(A0_13, A1_14)
      A0_13._scripts_base_dir = A0_13._scripts_base_dir_default
    end,
    dofile = function(A0_15, A1_16)
      dofile(A0_15._scripts_base_dir .. A1_16 .. ".lua")
    end,
    _deleteKeyMap = function(A0_17, A1_18)
      if A0_17._keymaps[A1_18]._is_protected then
        return
      end
      A0_17._keymaps[A1_18] = {}
      Debug:deleteShortcutKeyMap(A0_17._setup_name, A1_18, false)
    end,
    deleteKeyMap = function(A0_19, A1_20)
      local L2_21, L3_22, L4_23, L5_24
      if A1_20 == "" then
        for L5_24, _FORV_6_ in L2_21(L3_22) do
          A0_19:_deleteKeyMap(L5_24)
        end
      else
        for L5_24, _FORV_6_ in L2_21(L3_22) do
          if L5_24 == A1_20 then
            A0_19:_deleteKeyMap(L5_24)
            break
          end
        end
      end
    end,
    registerKeyMap = function(A0_25, A1_26, A2_27, A3_28, A4_29)
      if A3_28 == nil then
        A3_28 = false
      end
      if A4_29 == nil then
        A4_29 = false
      end
      A0_25._keymaps[A1_26] = A2_27
      Debug:registerShortcutKeyMap(A0_25._setup_name, A1_26, A2_27, A3_28)
      A0_25._keymaps[A1_26]._is_protected = A4_29
    end,
    revertKeyMapsOnAllSandboxes = function(A0_30, A1_31)
      A0_30:deleteKeyMap("")
      if A0_30._revert_key == A1_31 then
        A0_30:callSetupFunc()
      end
    end,
    resolveKey = function(A0_32, A1_33, A2_34)
      for _FORV_6_, _FORV_7_ in pairs(A0_32._keymaps) do
        if A1_33 == _FORV_6_ and _FORV_7_[A2_34] ~= nil then
          _FORV_7_[A2_34].proc()
          return true
        end
      end
      return false
    end
  }
end
