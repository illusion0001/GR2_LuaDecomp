test_area = "bu_d_root"
map_name = "bu_01"
driftParams = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 0.5,
    min_a = 0.2,
    max_t = 10,
    min_t = 5
  },
  y = {
    rand = 0.5,
    sign = 0.85,
    max_a = 1,
    min_a = 0.5,
    max_t = 10,
    min_t = 5
  },
  angle = {
    rand = 0.5,
    sign = 0.5,
    max_a = 15,
    min_a = 0,
    max_t = 60,
    min_t = 30
  }
}
dofile("/Game/TestArea/test_area.lua")
