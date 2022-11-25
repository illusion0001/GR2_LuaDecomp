test_area = "az5_c_root"
sky_name = "sky_md_04"
driftParams = {
  xz = {
    rand = 0.5,
    sign = 0.5,
    max_a = 1,
    min_a = 0.5,
    max_t = 30,
    min_t = 10
  },
  y = {
    rand = 0.5,
    sign = 0.85,
    max_a = 1,
    min_a = 0.3,
    max_t = 60,
    min_t = 30
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
dofile("/Game/TestArea/test_area.lua")
