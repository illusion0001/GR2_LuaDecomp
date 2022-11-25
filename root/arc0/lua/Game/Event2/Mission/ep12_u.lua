dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/EnemyCommon.lua")
_crush_start = false
_road_passing = nil
_puppet_crow = nil
_brain_crow = nil
_movingwall = false
_move_end = false
_movingwall_max = 39
_movingwall2_start = 22
_movingwall2_max = 39
_wall_break_start = false
_movingwall2 = false
_wall_cruch = false
_cruch_count = 0
_sensor_first = nil
_sensorcount = nil
_movingwall_table1 = {
  movingwall_01 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 10,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 10,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 10,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 10,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_02 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 20,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 20,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 20,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 20,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_03 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 40,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 40,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 40,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 40,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_04 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 50,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 50,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 50,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 50,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_05 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 0
    }
  },
  movingwall_06 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_07 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_08 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_09 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_10 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_11 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_12 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_13 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_14 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_15 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 0
    }
  },
  movingwall_16 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_17 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_18 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_19 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 0
    }
  },
  movingwall_20 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_21 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.5
    }
  },
  movingwall_22 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_23 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_24 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 0
    }
  },
  movingwall_25 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_26 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_27 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_28 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 0
    }
  },
  movingwall_29 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_30 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 0
    }
  },
  movingwall_31 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1.3
    }
  },
  movingwall_32 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_33 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_34 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_35 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_36 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_37 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_38 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  },
  movingwall_39 = {
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false
    },
    {
      move = "locator",
      pos = Vector(0, 0, 0),
      duration = 90,
      hashfunc = "EaseOut",
      flag = false,
      wait = 1
    }
  }
}
enmgen_moving_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_moving_01_01",
      name = "enm_moving_01"
    },
    {
      type = "gellyfish",
      locator = "locator_moving_01_02",
      name = "enm_moving_02"
    },
    {
      type = "defender",
      locator = "locator_moving_01_03",
      name = "enm_moving_03"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onSpawn = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum - 1
    if A0_6:getSpecTable().enemyDeadNum < 0 then
      A0_6:getSpecTable().enemyDeadNum = 0
    end
    A0_6:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
    A0_10:getSpecTable().enemyDeadNum = A0_10:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      "enm_moving_01"
    }, 1, 4)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_16)
    return #A0_16.spawnSet
  end,
  getEnemyDeadNum = function(A0_17)
    local L1_18
    L1_18 = A0_17.enemyDeadNum
    return L1_18
  end,
  isEnemyAllDead = function(A0_19)
    local L2_20
    L2_20 = A0_19.enemyDeadNum
    L2_20 = L2_20 >= #A0_19.spawnSet
    return L2_20
  end
}
enmgen_moving_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_moving_02_01",
      name = "enm_moving_04"
    },
    {
      type = "gellyfish",
      locator = "locator_moving_02_02",
      name = "enm_moving_05"
    },
    {
      type = "gellyfish",
      locator = "locator_moving_02_03",
      name = "enm_moving_06"
    }
  },
  onUpdate = function(A0_21)
    local L1_22
  end,
  onEnter = function(A0_23)
    local L1_24
  end,
  onLeave = function(A0_25)
    local L1_26
  end,
  onSpawn = function(A0_27, A1_28)
    A0_27:getSpecTable().enemyDeadNum = A0_27:getSpecTable().enemyDeadNum - 1
    if A0_27:getSpecTable().enemyDeadNum < 0 then
      A0_27:getSpecTable().enemyDeadNum = 0
    end
    A0_27:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_29, A1_30)
  end,
  onObjectAsh = function(A0_31, A1_32)
    A0_31:getSpecTable().enemyDeadNum = A0_31:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_33, A1_34)
    Fn_enemyPopGemSetup(A0_33, {
      "enm_moving_04",
      "enm_moving_05",
      "enm_moving_06"
    }, 1, 4)
  end,
  onPopGem = function(A0_35, A1_36)
    Fn_enemyAshPopGem(A0_35, A1_36)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_37)
    return #A0_37.spawnSet
  end,
  getEnemyDeadNum = function(A0_38)
    local L1_39
    L1_39 = A0_38.enemyDeadNum
    return L1_39
  end,
  isEnemyAllDead = function(A0_40)
    local L2_41
    L2_41 = A0_40.enemyDeadNum
    L2_41 = L2_41 >= #A0_40.spawnSet
    return L2_41
  end
}
enmgen_moving_03 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_moving_03_01",
      name = "enm_moving_07"
    },
    {
      type = "stalker",
      locator = "locator_moving_03_02",
      name = "enm_moving_08"
    },
    {
      type = "stalker",
      locator = "locator_moving_03_03",
      name = "enm_moving_09"
    },
    {
      type = "stalker",
      locator = "locator_moving_03_04",
      name = "enm_moving_10"
    },
    {
      type = "stalker",
      locator = "locator_moving_03_05",
      name = "enm_moving_11"
    },
    {
      type = "stalker",
      locator = "locator_moving_03_06",
      name = "enm_moving_12"
    },
    {
      type = "stalker",
      locator = "locator_moving_03_07",
      name = "enm_moving_13"
    }
  },
  onUpdate = function(A0_42)
    local L1_43
  end,
  onEnter = function(A0_44)
    local L1_45
  end,
  onLeave = function(A0_46)
    local L1_47
  end,
  onSpawn = function(A0_48, A1_49)
    A0_48:getSpecTable().enemyDeadNum = A0_48:getSpecTable().enemyDeadNum - 1
    if A0_48:getSpecTable().enemyDeadNum < 0 then
      A0_48:getSpecTable().enemyDeadNum = 0
    end
    A0_48:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_50, A1_51)
  end,
  onObjectAsh = function(A0_52, A1_53)
    A0_52:getSpecTable().enemyDeadNum = A0_52:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_54, A1_55)
    Fn_enemyPopGemSetup(A0_54, {
      "enm_moving_07",
      "enm_moving_08",
      "enm_moving_09",
      "enm_moving_10",
      "enm_moving_11",
      "enm_moving_12",
      "enm_moving_13"
    }, 3, 4)
  end,
  onPopGem = function(A0_56, A1_57)
    Fn_enemyAshPopGem(A0_56, A1_57)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_58)
    return #A0_58.spawnSet
  end,
  getEnemyDeadNum = function(A0_59)
    local L1_60
    L1_60 = A0_59.enemyDeadNum
    return L1_60
  end,
  isEnemyAllDead = function(A0_61)
    local L2_62
    L2_62 = A0_61.enemyDeadNum
    L2_62 = L2_62 >= #A0_61.spawnSet
    return L2_62
  end
}
enmgen_moving_04 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "runner",
      locator = "locator_moving_04_01",
      name = "enm_moving_14"
    },
    {
      type = "stalker",
      locator = "locator_moving_04_02",
      name = "enm_moving_15"
    },
    {
      type = "defender",
      locator = "locator_moving_04_03",
      name = "enm_moving_16"
    }
  },
  onUpdate = function(A0_63)
    local L1_64
  end,
  onEnter = function(A0_65)
    local L1_66
  end,
  onLeave = function(A0_67)
    local L1_68
  end,
  onSpawn = function(A0_69, A1_70)
    A0_69:getSpecTable().enemyDeadNum = A0_69:getSpecTable().enemyDeadNum - 1
    if A0_69:getSpecTable().enemyDeadNum < 0 then
      A0_69:getSpecTable().enemyDeadNum = 0
    end
    A0_69:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_71, A1_72)
  end,
  onObjectAsh = function(A0_73, A1_74)
    A0_73:getSpecTable().enemyDeadNum = A0_73:getSpecTable().enemyDeadNum + 1
  end,
  onSetupGem = function(A0_75, A1_76)
    Fn_enemyPopGemSetup(A0_75, {
      "enm_moving_14",
      "enm_moving_15",
      "enm_moving_16"
    }, 1, 5)
  end,
  onPopGem = function(A0_77, A1_78)
    Fn_enemyAshPopGem(A0_77, A1_78)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_79)
    return #A0_79.spawnSet
  end,
  getEnemyDeadNum = function(A0_80)
    local L1_81
    L1_81 = A0_80.enemyDeadNum
    return L1_81
  end,
  isEnemyAllDead = function(A0_82)
    local L2_83
    L2_83 = A0_82.enemyDeadNum
    L2_83 = L2_83 >= #A0_82.spawnSet
    return L2_83
  end
}
enmgen_moving_05 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_moving_05_01",
      name = "enm_moving_17"
    },
    {
      type = "gellyfish",
      locator = "locator_moving_05_02",
      name = "enm_moving_18"
    },
    {
      type = "gellyfish",
      locator = "locator_moving_05_03",
      name = "enm_moving_19"
    },
    {
      type = "gellyfish",
      locator = "locator_moving_05_04",
      name = "enm_moving_20"
    }
  },
  onUpdate = function(A0_84)
    local L1_85
  end,
  onEnter = function(A0_86)
    local L1_87
  end,
  onLeave = function(A0_88)
    local L1_89
  end,
  onSpawn = function(A0_90, A1_91)
    A0_90:getSpecTable().enemyDeadNum = A0_90:getSpecTable().enemyDeadNum - 1
    if A0_90:getSpecTable().enemyDeadNum < 0 then
      A0_90:getSpecTable().enemyDeadNum = 0
    end
    A0_90:setEnemyMarker(false)
  end,
  onObjectDead = function(A0_92, A1_93)
  end,
  onObjectAsh = function(A0_94, A1_95)
    A0_94:getSpecTable().enemyDeadNum = A0_94:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_96)
    return #A0_96.spawnSet
  end,
  getEnemyDeadNum = function(A0_97)
    local L1_98
    L1_98 = A0_97.enemyDeadNum
    return L1_98
  end,
  isEnemyAllDead = function(A0_99)
    local L2_100
    L2_100 = A0_99.enemyDeadNum
    L2_100 = L2_100 >= #A0_99.spawnSet
    return L2_100
  end
}
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  _crush_start_sdemo = SDemo.create("crush_start")
  _crush_start_sdemo:set(findGameObject2("Node", "locator2_crush_start_cam"), findGameObject2("Node", "locator2_crush_start_aim"))
  Fn_vctrlOff("vctrl2_crush")
  _area_09_hdl = Fn_findAreaHandle("az4_a_09")
  _enm_moving_01_h = findGameObject2("EnemyGenerator", "enmgen2_moving_01")
  _enm_moving_02_h = findGameObject2("EnemyGenerator", "enmgen2_moving_02")
  _enm_moving_03_h = findGameObject2("EnemyGenerator", "enmgen2_moving_03")
  _enm_moving_04_h = findGameObject2("EnemyGenerator", "enmgen2_moving_04")
  _enm_moving_05_h = findGameObject2("EnemyGenerator", "enmgen2_moving_05")
  Fn_pcSensorOff("pccubesensor2_navi_01")
end
function Ingame()
  Fn_setCatWarp(false)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  Fn_missionStart()
  Fn_userCtrlOn()
  Player:setStay(false)
  Fn_sendEventComSb("aisleMissionView")
  _navi_task = invokeTask(function()
    waitSeconds(1.3)
    Fn_sendEventComSb("guide_navi", 1)
  end)
  invokeTask(function()
    repeat
      wait()
    until _movingwall
    Fn_naviKill()
    invokeTask(crushCheck)
    movesWallStart(_movingwall_table1, 1, _movingwall_max)
  end)
  prog_manage()
  while _crush_start == false do
    wait()
  end
  Fn_userCtrlAllOff()
  Player:setStay(true)
  _brain_crow:setIdling(true)
  Fn_sendEventComSb("requestCrowWarp", "locator2_crow_lead_pos_01", "ground")
  repeat
    wait()
  until Fn_sendEventComSb("isCrowMoveEnd")
  Fn_sendEventComSb("crowLeadStart")
  Fn_sendEventComSb("closeShutter")
  _crush_start_sdemo:play()
  Fn_sendEventComSb("guideEffAllOff", 7)
  waitSeconds(5)
  Fn_kaiwaDemoView("ep12_00320k")
  _crush_start_sdemo:stop(0)
  Fn_userCtrlOn()
  Player:setStay(false)
  Fn_vctrlOn("vctrl2_crush")
  waitSeconds(1.5)
  Fn_vctrlOff("vctrl2_crush")
  invokeTask(function()
    repeat
      wait()
    until requestCrushOut()
    print("***** cruch *****")
    _road_passing = false
  end)
  Fn_pcSensorOn("pccubesensor2_navi_01")
  Fn_sendEventComSb("requestHandle", "Node", "pccubesensor2_navi_08_02_01"):setActive(false)
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_navi_01"))
  repeat
    if _road_passing == false then
      print("***** _restart!!! *****")
      Fn_missionRetry(true)
      _road_passing = nil
    end
    wait()
  until _road_passing
  _brain_crow:resetExceptAbility()
  _brain_crow:setIdling(false)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_crush_start_OnEnter()
  _crush_start = true
  Fn_pcSensorOff("pccubesensor2_crush_start")
  _movingwall = true
end
function pccubesensor2_crush_end_OnEnter()
  Fn_pcSensorOff("pccubesensor2_crush_end")
  _road_passing = true
  Fn_sendEventComSb("requestMoveRubble", "ANY_MOVE", "movingwall_end", 4, 0.5, "EaseInOut", true)
end
function pccubesensor2_movingwall_OnEnter(A0_101, A1_102)
  local L2_103, L3_104
  L2_103 = print
  L3_104 = "sensor in :"
  L3_104 = L3_104 .. A0_101:getName()
  L2_103(L3_104)
  L3_104 = A0_101
  L2_103 = A0_101.getName
  L2_103 = L2_103(L3_104)
  L3_104 = tonumber
  L3_104 = L3_104(string.sub(L2_103, -5, -4))
  if L3_104 <= _movingwall_max then
    _movingwall_table1[string.format("movingwall_%02d", L3_104)][tonumber(string.sub(L2_103, -2))].flag = true
  else
    _movingwall_table2[string.format("movingwall_%02d", L3_104)][tonumber(string.sub(L2_103, -2))].flag = true
  end
end
function pccubesensor2_movingwall_OnLeave(A0_105, A1_106)
  local L2_107, L3_108
  L2_107 = print
  L3_108 = "sensor out :"
  L3_108 = L3_108 .. A0_105:getName()
  L2_107(L3_108)
  L3_108 = A0_105
  L2_107 = A0_105.getName
  L2_107 = L2_107(L3_108)
  L3_108 = tonumber
  L3_108 = L3_108(string.sub(L2_107, -5, -4))
  if L3_108 <= _movingwall_max then
    _movingwall_table1[string.format("movingwall_%02d", L3_108)][tonumber(string.sub(L2_107, -2))].flag = false
  else
    _movingwall_table2[string.format("movingwall_%02d", L3_108)][tonumber(string.sub(L2_107, -2))].flag = false
  end
end
function pccubesensor2_movingwall_00_OnEnter(A0_109, A1_110)
  print("sensor in :" .. A0_109:getName())
  Fn_pcSensorOff(A0_109)
  invokeTask(function()
    local L0_111, L1_112, L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130
    L0_111 = 1
    L1_112 = "EaseOut"
    L2_113 = tonumber
    L3_114 = string
    L3_114 = L3_114.sub
    L19_130 = L3_114(L4_115, L5_116, L6_117)
    L2_113 = L2_113(L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120, L10_121, L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L3_114(L4_115, L5_116, L6_117))
    L3_114 = string
    L3_114 = L3_114.format
    L3_114 = L3_114(L4_115, L5_116)
    for L7_118 = 1, 4 do
      L8_119 = findGameObject2
      L9_120 = "Node"
      L10_121 = string
      L10_121 = L10_121.format
      L11_122 = "locator2_%s_%02d_00"
      L12_123 = L3_114
      L13_124 = L7_118
      L19_130 = L10_121(L11_122, L12_123, L13_124)
      L8_119 = L8_119(L9_120, L10_121, L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L10_121(L11_122, L12_123, L13_124))
      if L8_119 ~= nil then
        L9_120 = print
        L10_121 = "******* <<"
        L11_122 = string
        L11_122 = L11_122.format
        L12_123 = "locator2_%s_%02d_00"
        L13_124 = L3_114
        L14_125 = L7_118
        L11_122 = L11_122(L12_123, L13_124, L14_125)
        L12_123 = ">> *******"
        L10_121 = L10_121 .. L11_122 .. L12_123
        L9_120(L10_121)
        L9_120 = findGameObject2
        L10_121 = "Node"
        L11_122 = string
        L11_122 = L11_122.format
        L12_123 = "bg2_%s_%02d"
        L13_124 = L3_114
        L14_125 = L7_118
        L19_130 = L11_122(L12_123, L13_124, L14_125)
        L9_120 = L9_120(L10_121, L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L11_122(L12_123, L13_124, L14_125))
        L10_121 = findGameObject2
        L11_122 = "Node"
        L12_123 = string
        L12_123 = L12_123.format
        L13_124 = "pccubesensor2_%s_%02d"
        L14_125 = L3_114
        L15_126 = L7_118
        L19_130 = L12_123(L13_124, L14_125, L15_126)
        L10_121 = L10_121(L11_122, L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L12_123(L13_124, L14_125, L15_126))
        L11_122 = findGameObject2
        L12_123 = "Node"
        L13_124 = string
        L13_124 = L13_124.format
        L14_125 = "locator2_%s_%02d"
        L15_126 = L3_114
        L16_127 = L7_118
        L19_130 = L13_124(L14_125, L15_126, L16_127)
        L11_122 = L11_122(L12_123, L13_124, L14_125, L15_126, L16_127, L17_128, L18_129, L19_130, L13_124(L14_125, L15_126, L16_127))
        L13_124 = L11_122
        L12_123 = L11_122.getWorldPos
        L12_123 = L12_123(L13_124)
        L14_125 = L9_120
        L13_124 = L9_120.appendChild
        L15_126 = L10_121
        L16_127 = true
        L13_124(L14_125, L15_126, L16_127)
        L14_125 = L9_120
        L13_124 = L9_120.getWorldPos
        L13_124 = L13_124(L14_125)
        L15_126 = L9_120
        L14_125 = L9_120.getWorldRot
        L14_125 = L14_125(L15_126)
        L16_127 = L8_119
        L15_126 = L8_119.getWorldPos
        L15_126 = L15_126(L16_127)
        L17_128 = L8_119
        L16_127 = L8_119.getWorldRot
        L16_127 = L16_127(L17_128)
        L17_128 = print
        L18_129 = "start_pos[ "
        L19_130 = L12_123.DistanceTo
        L19_130 = L19_130(L12_123, L13_124)
        L18_129 = L18_129 .. L19_130 .. " ] | end_pos[ " .. L12_123:DistanceTo(L15_126) .. " ]"
        L17_128(L18_129)
        L18_129 = L12_123
        L17_128 = L12_123.DistanceTo
        L19_130 = L13_124
        L17_128 = L17_128(L18_129, L19_130)
        L19_130 = L12_123
        L18_129 = L12_123.DistanceTo
        L18_129 = L18_129(L19_130, L15_126)
        if L17_128 > L18_129 then
          L17_128 = print
          L18_129 = "\229\163\129\227\129\174\227\129\140\233\129\160\227\129\132\227\129\174\227\129\167\229\139\149\227\129\139\227\129\153"
          L17_128(L18_129)
          L17_128 = false
          L19_130 = L9_120
          L18_129 = L9_120.isCurveMoving
          L18_129 = L18_129(L19_130)
          if L18_129 then
            L18_129 = print
            L19_130 = "\229\163\129\227\129\175\231\167\187\229\139\149\228\184\173"
            L18_129(L19_130)
            L17_128 = true
          end
          L19_130 = L9_120
          L18_129 = L9_120.clearCurve
          L18_129(L19_130)
          L19_130 = L9_120
          L18_129 = L9_120.appendCurvePoint
          L18_129(L19_130, L13_124, L14_125, L0_111, L1_112, true)
          L19_130 = L9_120
          L18_129 = L9_120.appendCurvePoint
          L18_129(L19_130, L15_126, L16_127, L0_111, L1_112, true)
          L18_129 = Sound
          L19_130 = L18_129
          L18_129 = L18_129.playSEHandle
          L18_129 = L18_129(L19_130, "ep12_road_open", 1, "", L9_120)
          L19_130 = invokeTask
          L19_130(wall_se_off, L9_120, L18_129)
          if L17_128 then
            L19_130 = wait
            L19_130()
            repeat
              L19_130 = wait
              L19_130()
              L19_130 = L9_120.isCurveMoving
              L19_130 = L19_130(L9_120)
            until L19_130 == false
            L19_130 = print
            L19_130("\231\167\187\229\139\149\231\181\130\228\186\134 " .. L3_114)
            L19_130 = L9_120.getWorldPos
            L19_130 = L19_130(L9_120)
            L13_124 = L19_130
            L19_130 = L9_120.getWorldRot
            L19_130 = L19_130(L9_120)
            L14_125 = L19_130
            L19_130 = L11_122.getWorldPos
            L19_130 = L19_130(L11_122)
            L15_126 = L19_130
            L19_130 = L11_122.getWorldRot
            L19_130 = L19_130(L11_122)
            L16_127 = L19_130
            L19_130 = print
            L19_130("<<<<<<<<<<<< " .. string.format("%s_%02d", L3_114, L7_118) .. " | start : " .. tostring(L13_124) .. " | end : " .. tostring(L15_126) .. " >>>>>>>>>>>>>")
            L19_130 = wait
            L19_130()
            L19_130 = L9_120.clearCurve
            L19_130(L9_120)
            L19_130 = L9_120.appendCurvePoint
            L19_130(L9_120, L13_124, L14_125, _movingwall_table1[L3_114][L7_118].duration, _movingwall_table1[L3_114][L7_118].hashfunc, true)
            L19_130 = L9_120.appendCurvePoint
            L19_130(L9_120, L15_126, L16_127, _movingwall_table1[L3_114][L7_118].duration, _movingwall_table1[L3_114][L7_118].hashfunc, true)
            L19_130 = Sound
            L19_130 = L19_130.playSEHandle
            L19_130 = L19_130(L19_130, "ep12_road_open", 1, "", L9_120)
            invokeTask(wall_se_off, L9_120, L19_130)
          end
        else
          L17_128 = print
          L18_129 = "\229\163\129\227\129\174\227\129\140\232\191\145\227\129\132\227\129\174\227\129\167\231\167\187\229\139\149\227\129\149\227\129\155\227\129\170\227\129\132"
          L17_128(L18_129)
        end
      end
    end
  end)
end
function movesWallStart(A0_131, A1_132, A2_133)
  local L3_134, L4_135, L5_136, L6_137, L7_138, L8_139, L9_140, L10_141, L11_142, L12_143, L13_144, L14_145, L15_146, L16_147, L17_148, L18_149, L19_150
  _cruch_out = false
  for L6_137 = A1_132, A2_133 do
    L7_138 = string
    L7_138 = L7_138.format
    L7_138 = L7_138(L8_139, L9_140)
    for L11_142, L12_143 in L8_139(L9_140) do
      L13_144 = findGameObject2
      L14_145 = "Node"
      L15_146 = string
      L15_146 = L15_146.format
      L16_147 = "bg2_%s_%02d"
      L17_148 = L7_138
      L18_149 = L11_142
      L19_150 = L15_146(L16_147, L17_148, L18_149)
      L13_144 = L13_144(L14_145, L15_146, L16_147, L17_148, L18_149, L19_150, L15_146(L16_147, L17_148, L18_149))
      L14_145 = findGameObject2
      L15_146 = "Node"
      L16_147 = string
      L16_147 = L16_147.format
      L17_148 = "pccubesensor2_%s_%02d"
      L18_149 = L7_138
      L19_150 = L11_142
      L19_150 = L16_147(L17_148, L18_149, L19_150)
      L14_145 = L14_145(L15_146, L16_147, L17_148, L18_149, L19_150, L16_147(L17_148, L18_149, L19_150))
      L16_147 = L13_144
      L15_146 = L13_144.appendChild
      L17_148 = L14_145
      L18_149 = true
      L15_146(L16_147, L17_148, L18_149)
      L16_147 = L13_144
      L15_146 = L13_144.getWorldPos
      L15_146 = L15_146(L16_147)
      L17_148 = L13_144
      L16_147 = L13_144.getWorldRot
      L16_147 = L16_147(L17_148)
      L17_148, L18_149 = nil, nil
      L19_150 = L12_143.move
      if L19_150 == "locator" then
        L19_150 = findGameObject2
        L19_150 = L19_150("Node", string.format("locator2_%s_%02d", L7_138, L11_142))
        L17_148 = L19_150:getWorldPos()
        L18_149 = L19_150:getWorldRot()
      else
        L19_150 = L12_143.move
        if L19_150 == "pos" then
          L19_150 = L12_143.pos
          L17_148 = L15_146 - L19_150
          L18_149 = L16_147
        end
      end
      L19_150 = print
      L19_150("<<<<<< " .. L7_138 .. " | start : " .. tostring(L15_146) .. " | end : " .. tostring(L17_148) .. " >>>>>>")
      L19_150 = L13_144.clearCurve
      L19_150(L13_144)
      L19_150 = L13_144.appendCurvePoint
      L19_150(L13_144, L15_146, L16_147, L12_143.duration, L12_143.hashfunc, true)
      L19_150 = L13_144.appendCurvePoint
      L19_150(L13_144, L17_148, L18_149, L12_143.duration, L12_143.hashfunc, true)
      L19_150 = Sound
      L19_150 = L19_150.playSEHandle
      L19_150 = L19_150(L19_150, "ep12_road_open", 1, "", L13_144)
      invokeTask(wall_se_off, L13_144, L19_150)
      if L12_143.wait then
        waitSeconds(L12_143.wait)
      end
    end
  end
end
function wall_se_off(A0_151, A1_152)
  repeat
    wait()
  until A0_151:isCurveMoving()
  Sound:stopSEHandle(A1_152)
end
function wallMovePos(A0_153, A1_154)
  local L2_155
  L2_155 = wall_hdl
  return L2_155
end
function crushCheck()
  local L0_156, L1_157, L2_158, L3_159, L4_160, L5_161, L6_162, L7_163, L8_164
  L0_156 = print
  L1_157 = "***** crushCheck START! *****"
  L0_156(L1_157)
  L0_156 = {}
  L1_157 = {}
  L2_158 = 600
  while true do
    if L3_159 == false then
      for L6_162 = 1, _movingwall_max do
        L7_163 = 0
        L8_164 = L0_156[L6_162]
        if L8_164 == nil then
          L0_156[L6_162] = L2_158
        end
        L8_164 = L1_157[L6_162]
        if L8_164 == nil then
          L1_157[L6_162] = 0
        end
        L8_164 = string
        L8_164 = L8_164.format
        L8_164 = L8_164("movingwall_%02d", L6_162)
        if _movingwall_table1[L8_164][1].flag == true then
          L7_163 = L7_163 + 1
        end
        if _movingwall_table1[L8_164][2].flag == true then
          L7_163 = L7_163 + 1
        end
        if _movingwall_table1[L8_164][3].flag == true then
          L7_163 = L7_163 + 1
        end
        if _movingwall_table1[L8_164][4].flag == true then
          L7_163 = L7_163 + 1
        end
        if L7_163 >= 1 then
          print("sensor", L8_164, L7_163, L0_156[L6_162])
        end
        if L7_163 >= 2 then
          L0_156[L6_162] = L0_156[L6_162] - 1
          L1_157[L6_162] = 0
        elseif L1_157[L6_162] > 5 then
          L0_156[L6_162] = L2_158
          L1_157[L6_162] = 0
        else
          L1_157[L6_162] = L1_157[L6_162] + 1
        end
        if L7_163 == 4 or L0_156[L6_162] <= 0 then
          _wall_cruch = true
          print(string.format("***** kitten crush [ %s ] *****", L8_164, L0_156[L6_162]))
          break
        end
      end
      L3_159()
    end
  end
end
function requestCrushOut()
  local L0_165, L1_166
  L0_165 = _wall_cruch
  return L0_165
end
function prog_manage()
  print("ep12_u : prog_manage")
  if _enm_moving_02_h ~= nil then
    _enm_moving_02_h:requestSpawn()
  end
  if _enm_moving_03_h ~= nil then
    _enm_moving_03_h:requestSpawn()
  end
  if _enm_moving_04_h ~= nil then
    _enm_moving_04_h:requestSpawn()
  end
  if _enm_moving_05_h ~= nil then
    _enm_moving_05_h:requestSpawn()
  end
end
function guide_navi(A0_167)
  local L1_168
  L1_168 = findGameObject2
  L1_168 = L1_168("Node", string.format("pccubesensor2_navi_%02d", A0_167))
  if L1_168 ~= nil then
    print("***** guide_navi [ " .. A0_167 .. "] *****")
    Fn_pcSensorOn(L1_168)
    Fn_naviSet(L1_168)
  else
    Fn_naviKill()
  end
end
function pccubesensor2_navi_OnEnter(A0_169, A1_170)
  local L2_171
  L2_171 = Fn_pcSensorOff
  L2_171(A0_169)
  L2_171 = tonumber
  L2_171 = L2_171(string.sub(A0_169:getName(), -2))
  L2_171 = L2_171 + 1
  invokeTask(guide_navi, L2_171)
end
function requestAreaMannager(A0_172)
  if _request_area_manager then
    _request_area_manager = false
    _area_manege = true
    _area_manage_part = A0_172
  end
end
function Finalize()
  if _navi_task ~= nil then
    _navi_task:abort()
  end
end
