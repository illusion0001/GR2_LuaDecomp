_drift_param = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1,
    min_a = 0.1,
    max_t = 30,
    min_t = 10
  },
  y = {
    rand = 1,
    sign = 0.85,
    max_a = 2,
    min_a = 0.5,
    max_t = 10,
    min_t = 5
  },
  angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0,
    min_a = 0,
    max_t = 120,
    min_t = 30
  }
}
_drift_sub_table = {}
_drift_sub_param = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.8,
    min_a = 0.1,
    max_t = 30,
    min_t = 10
  },
  y = {
    rand = 1,
    sign = 0.85,
    max_a = 1,
    min_a = 0.5,
    max_t = 10,
    min_t = 5
  },
  angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0,
    min_a = 0,
    max_t = 120,
    min_t = 30
  }
}
_drift_unique = {}
DRIFT_PARAM_UNIQUE_AREA_az_a_xx = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 2.5,
    min_a = 1.2,
    max_t = 20,
    min_t = 10
  },
  y = {
    rand = 1,
    sign = 0.85,
    max_a = 8.5,
    min_a = 1.5,
    max_t = 30,
    min_t = 10
  },
  angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 15,
    min_a = 0,
    max_t = 120,
    min_t = 30
  }
}
dofile("/Game/Event2/bgset/bg_mine_base.lua")
_evb_list = {
  "city_block_st_a"
}
