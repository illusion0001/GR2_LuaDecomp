import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("Player")
import("Camera")
import("DebugDraw")
import("math")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
fix_gimmick_list = {
  "barrel_kk_01",
  "box_ms_01",
  "box_ms_01"
}
gimmick_list = {
  "az_grab_cactus_a",
  "az_haworthia_boss",
  "az2_a_12",
  "az2_a_13",
  "az2_a_14",
  "az2_a_15",
  "az2_anmo_01",
  "az2_anmo_01_brk_dy",
  "az3_himmeli_oc_01",
  "az3_himmeli_oc_02",
  "az3_himmeli_oc_03",
  "az3_himmeli_oc_04",
  "az3_himmeli_oc_05",
  "az3_himmeli_oc_06",
  "az3_himmeli_oc_06_brk_dy",
  "az3_wall_oc_02_a",
  "az4_breakableobj_a",
  "az4_breakableobj_a_brk_dy",
  "az4_breakableobj_b",
  "az4_breakableobj_b_brk_dy",
  "az4_breakableobj_c",
  "az4_breakableobj_c_brk_dy",
  "az4_breakableobj_d",
  "az4_stopobj_a",
  "az4_trapfloor_a",
  "az5_b_05",
  "az5_b_05_brk_md01",
  "az5_b_05_brk_md02",
  "az5_b_05_brk_md03",
  "az5_b_05_brk_md04",
  "az5_item_swing_kw_a",
  "barrel_kk_01",
  "beacon_md_01",
  "beacon_md_01_sm27",
  "cicapsule01_base",
  "bed_yj_01",
  "bed_yj_02",
  "bed_yj_03",
  "bed_yj_04",
  "bomb_yj_01",
  "bookshelf_yj_01",
  "box_ms_01",
  "box_ms_02",
  "box_ms_02_event_01",
  "box_ms_02_event_02",
  "box_ms_02_event_03",
  "box_ms_02_event_04",
  "bucket_ms_01",
  "building_fl_09",
  "building_kk_36",
  "building_kk_37",
  "building_kk_38",
  "building_kk_51",
  "building_nk_01",
  "building_nk_01_brk",
  "building_nk_01_fan",
  "building_nk_08",
  "building_nk_08_door_01",
  "building_nk_08_door_02",
  "bulletinboard_kw_01",
  "can_md_01",
  "can_ms_01",
  "cardboardbox_kw_01",
  "carpet_yj_01",
  "carpet_yj_02",
  "carpet_yj_03",
  "carpet_yj_04",
  "cbtrash_ms_01",
  "cbtrash_ms_02",
  "chair_kw_01",
  "chair_kw_01_brk_dy",
  "chair_ms_01",
  "chair_ms_02",
  "chair_sk_01",
  "chair_sk_02",
  "chair_yj_01",
  "chair_yj_01_brk_dy",
  "chair_yj_02",
  "chair_yj_03",
  "chair_yj_04",
  "chair_yj_04_brk_dy",
  "chantyhouse_fl_01",
  "chantyhouse_fl_02",
  "chantyhouse_fl_03",
  "chantyway_fl_02",
  "ciangcage01_base",
  "ciangshield01_base",
  "cibell01_base",
  "cigun01_base",
  "cigun02_base",
  "cigun03_base",
  "cigun04_base",
  "cilauncher01_base",
  "cimicromissile01_base",
  "cipergun01_base",
  "cipergun02_base",
  "cirocket01_base",
  "cisteelpipe01_base",
  "ciunibit01_base",
  "ciunibit02_base",
  "co_a_07_dummy",
  "co_a_11_dummy",
  "co_a_12_dummy",
  "co_hole_oc_01_center",
  "co_hole_oc_02_center",
  "constfence_oc_01",
  "constfence_oc_02",
  "container_kk_01",
  "container_kk_01_brk_dy",
  "container_kk_01_empty",
  "container_kk_02",
  "container_kk_02_brk_dy",
  "container_kk_02_empty",
  "container_kk_03",
  "container_kk_03_brk_dy",
  "container_kk_03_empty",
  "container_kk_04",
  "container_kk_04_empty",
  "container_kk_05",
  "container_kk_05_empty",
  "container_ms_01",
  "container_ms_02",
  "container_ms_03",
  "container_ms_04",
  "cranehead_kw_01",
  "cranerope_kw_01",
  "cranerope_ms_01",
  "curtain_yj_01",
  "curtain_yj_02",
  "curtain_yj_03",
  "curtain_yj_04",
  "et2_chair_oc_03",
  "et2_chandelier_oc_01_off",
  "et2_chandelier_oc_02_off",
  "et2_door_oc_01",
  "et2_door_oc_02",
  "et2_door_oc_03",
  "et2_door_oc_04",
  "et2_lamp_oc_01",
  "et2_window_oc_03",
  "et2_window_oc_04",
  "et3_cube_oc_01b",
  "et3_cube_oc_02b",
  "firehydrant_kw_01",
  "fun_yj_01",
  "g1_bell_kk_01",
  "g1_building_es_ferriswheel_01",
  "g1_building_es_gondola_01",
  "g1_building_es_gondola_02",
  "g1_building_es_gondola_03",
  "g1_building_kw_01r_bell",
  "g1_building_pd_77b",
  "g1_building_sf_16b",
  "g1_cross_kk_01",
  "g1_elevator_sk_01",
  "g1_elevator_sk_01_01a",
  "g1_elevator_sk_01_01b",
  "g1_fireplug_kk_01",
  "g1_las_01_d_base_brk",
  "g1_manekin_pd_01",
  "g1_manekin_pd_02",
  "g1_monument_yo_01",
  "g1_pole_pd_01",
  "g1_prop_kk_10",
  "g1_ropeway_pd_01",
  "g1_ropeway_pd_02",
  "g1_tree_pd_04",
  "g1_tree_pd_05",
  "g1_tree_yy_08",
  "g1_tree_yy_09",
  "g1_tv1",
  "g1_tv2",
  "g1_tv3",
  "g1_tv4",
  "g1_tv5",
  "g1_tv6",
  "garbage_kw_01",
  "garbage_kw_01_brk_dy",
  "garbage_kw_02",
  "garbage_kw_02_brk_dy",
  "garbage_kw_03",
  "garbage_kw_03_brk_dy",
  "garbage_kw_03_brk_md01",
  "garbagecan_kw_01",
  "garbagecan_kw_01_brk_md01",
  "garbagecan_kw_02",
  "garbagecan_kw_02_brk_md01",
  "gasbombe_oc_01",
  "gasbombe_oc_02",
  "gasbombe_oc_03",
  "gasbombe_oc_04",
  "gate_md_01",
  "gate_md_01_brk_md01",
  "gate_md_01_brk_md02",
  "gate_md_01_brk_md03",
  "gate_md_01_brk_md04",
  "gate_md_01_brk_md05",
  "gate_md_01_brk_md06",
  "gate_md_01_brk_md07",
  "gate_md_01_brk_md08",
  "gate_md_01_brk_md09",
  "gate_md_01_brk_md10",
  "gate_md_01_brk_md11",
  "go_fountain_a",
  "go_fountain_a_brk_md01",
  "go_fountain_a_brk_md02",
  "go_jailcage_a",
  "go_jailcage_a_brk_md01",
  "grab_water",
  "tree_leaf",
  "grabrock_ms_01",
  "grabrock_ms_02",
  "gravityore_md_01",
  "gravityore_mk_01",
  "gravityore_mk_02",
  "gravityore_mk_03",
  "grigobase_01",
  "hanger_yj_01",
  "invisible_col",
  "invisible_water_col",
  "event_obj_01",
  "event_obj_02",
  "chair_yj_01_brk_dy_event",
  "chair_yj_04_brk_dy_event",
  "woodbox_sk_01_event",
  "photo_table_sk_02_event",
  "bench_kk_03_brk_dy_event",
  "piano_md_01_event",
  "woodbox_ms_01_event",
  "woodbox_kk_02_event",
  "woodbox_kk_05_event",
  "lamp_kw_01",
  "lamp_kw_02",
  "lamp_kw_02b",
  "lamp_mk_01",
  "lamp_mk_02",
  "light_fl_01",
  "light_fl_02",
  "light_fl_03",
  "light_fl_04",
  "light_yj_01",
  "light_yj_02",
  "mclrg01explosion",
  "mcbom01_base",
  "mclrg01_missile",
  "mclrg01_missile_elek",
  "mcgrenade01_base",
  "mcmissile01_base",
  "mcsml01explosion",
  "mcsml01explosion_arml",
  "mcsml01explosion_armr",
  "mcsml01explosion_engine",
  "mcsml01explosion_hatch",
  "md_nvgia01_armor_body_001",
  "md_nvgia01_armor_body_004",
  "md_nvgia01_armor_body_005",
  "md_nvgia01_armor_body_009",
  "md_nvgia01_armor_body_010",
  "md_nvgia01_armor_body_012",
  "md_nvgia01_armor_body_013",
  "md_nvgia01_armor_body_014",
  "md_nvgia01_armor_body_015",
  "md_nvgia01_armor_body_021",
  "md_nvgia01_armor_body_022",
  "md_nvgia01_armor_body_023",
  "md_nvgia01_armor_shoul_001",
  "md_nvgia01_armor_shoul_002",
  "md_nvgia01_armor_shoul_003",
  "md_nvgia01_armor_shoul_004",
  "md_nvgia01_armor_shoul_007",
  "md_nvgia01_armor_shoul_008",
  "md_nvgia01_armor_shoul_009",
  "md_nvgia01_armor_shoul_011",
  "md_nvgia01_armor_shoul_012",
  "md_nvgia01_armor_shoul_013",
  "md_nvgia01_armor_shoul_014",
  "md_nvgia01_armor_shoul_015",
  "md_nvgia01_armor_shoul_016",
  "md_nvgia01_armor_shoul_018",
  "md_nvgia01_armor_shoul_019",
  "md_nvgia01_armor_shoul_020",
  "md_nvgia02_armor_body_001",
  "md_nvgia02_armor_body_004",
  "md_nvgia02_armor_body_005",
  "md_nvgia02_armor_body_009",
  "md_nvgia02_armor_body_010",
  "md_nvgia02_armor_body_012",
  "md_nvgia02_armor_body_013",
  "md_nvgia02_armor_body_014",
  "md_nvgia02_armor_body_015",
  "md_nvgia02_armor_body_021",
  "md_nvgia02_armor_body_022",
  "md_nvgia02_armor_body_023",
  "md_nvgia02_armor_shoul_001",
  "md_nvgia02_armor_shoul_002",
  "md_nvgia02_armor_shoul_003",
  "md_nvgia02_armor_shoul_004",
  "md_nvgia02_armor_shoul_007",
  "md_nvgia02_armor_shoul_008",
  "md_nvgia02_armor_shoul_009",
  "md_nvgia02_armor_shoul_011",
  "md_nvgia02_armor_shoul_012",
  "md_nvgia02_armor_shoul_013",
  "md_nvgia02_armor_shoul_014",
  "md_nvgia02_armor_shoul_015",
  "md_nvgia02_armor_shoul_016",
  "md_nvgia02_armor_shoul_018",
  "md_nvgia02_armor_shoul_019",
  "md_nvgia02_armor_shoul_020",
  "md_nvgia03_armor_body_001",
  "md_nvgia03_armor_body_004",
  "md_nvgia03_armor_body_005",
  "md_nvgia03_armor_body_009",
  "md_nvgia03_armor_body_010",
  "md_nvgia03_armor_body_012",
  "md_nvgia03_armor_body_013",
  "md_nvgia03_armor_body_014",
  "md_nvgia03_armor_body_015",
  "md_nvgia03_armor_body_021",
  "md_nvgia03_armor_body_022",
  "md_nvgia03_armor_body_023",
  "md_nvgia03_armor_shoul_001",
  "md_nvgia03_armor_shoul_002",
  "md_nvgia03_armor_shoul_003",
  "md_nvgia03_armor_shoul_004",
  "md_nvgia03_armor_shoul_007",
  "md_nvgia03_armor_shoul_008",
  "md_nvgia03_armor_shoul_009",
  "md_nvgia03_armor_shoul_011",
  "md_nvgia03_armor_shoul_012",
  "md_nvgia03_armor_shoul_013",
  "md_nvgia03_armor_shoul_014",
  "md_nvgia03_armor_shoul_015",
  "md_nvgia03_armor_shoul_016",
  "md_nvgia03_armor_shoul_018",
  "md_nvgia03_armor_shoul_019",
  "md_nvgia03_armor_shoul_020",
  "md_nvgia04_armor_body_001",
  "md_nvgia04_armor_body_004",
  "md_nvgia04_armor_body_005",
  "md_nvgia04_armor_body_009",
  "md_nvgia04_armor_body_010",
  "md_nvgia04_armor_body_012",
  "md_nvgia04_armor_body_013",
  "md_nvgia04_armor_body_014",
  "md_nvgia04_armor_body_015",
  "md_nvgia04_armor_body_021",
  "md_nvgia04_armor_body_022",
  "md_nvgia04_armor_body_023",
  "md_nvgia04_armor_shoul_001",
  "md_nvgia04_armor_shoul_002",
  "md_nvgia04_armor_shoul_003",
  "md_nvgia04_armor_shoul_004",
  "md_nvgia04_armor_shoul_007",
  "md_nvgia04_armor_shoul_008",
  "md_nvgia04_armor_shoul_009",
  "md_nvgia04_armor_shoul_011",
  "md_nvgia04_armor_shoul_012",
  "md_nvgia04_armor_shoul_013",
  "md_nvgia04_armor_shoul_014",
  "md_nvgia04_armor_shoul_015",
  "md_nvgia04_armor_shoul_016",
  "md_nvgia04_armor_shoul_018",
  "md_nvgia04_armor_shoul_019",
  "md_nvgia04_armor_shoul_020",
  "mi_elevatorbox_kw_01",
  "mi_elevatorbox_kw_01_01a",
  "mi_elevatorbox_kw_01_01b",
  "mi_elevatorbox_kw_01_02a",
  "mi_elevatorbox_kw_01_03a",
  "mi_elevatorbox_kw_01_04a",
  "mi_statue_kw_02",
  "mirro_yj_01",
  "mirro_yj_02",
  "mirro_yj_03",
  "mirro_yj_04",
  "missile_md_01",
  "missile_md_01_brk_dy",
  "missile_md_01_head",
  "monument_kk_01",
  "musicbox_md_01",
  "musicbox_md_01b",
  "g1_fence_sk_06",
  "nvbmm01_sickle",
  "nvbmm01_throwsickle",
  "nvbmm02_sickle",
  "nvbmm02_throwsickle",
  "nvtre01rock01",
  "nvtre01rock02",
  "nvtre01rock03",
  "nvtre01rock04",
  "nvtre02rock01",
  "nvtre02rock02",
  "nvtre02rock03",
  "nvtre02rock04",
  "nvtre03rock01",
  "nvtre03rock02",
  "nvtre03rock03",
  "nvtre03rock04",
  "nvtre01rock01b",
  "nvtre01rock02b",
  "nvtre01rock03b",
  "nvtre01rock04b",
  "nvtre02rock01b",
  "nvtre02rock02b",
  "nvtre02rock03b",
  "nvtre02rock04b",
  "nvtre03rock01b",
  "nvtre03rock02b",
  "nvtre03rock03b",
  "nvtre03rock04b",
  "obj_nk_17",
  "obj_nk_18",
  "object_yj_01",
  "object_yj_02",
  "object_yj_03",
  "ornament_yj_01",
  "ornament_yj_02",
  "ornament_yj_03",
  "ornament_yj_04",
  "pallet_oc_01",
  "pallet_oc_01_brk_dy",
  "pallet_oc_02",
  "pallet_oc_02_brk_dy",
  "pan_ms_01",
  "photo_airconditioner_md_04",
  "photo_barrel_kk_01",
  "photo_box_ms_02",
  "photo_broom_kw_01",
  "photo_bucket_ms_01",
  "photo_chair_kw_01",
  "photo_cone_kk_01",
  "photo_food_radish_kw_01",
  "photo_food_tomato_kw_01",
  "photo_food_watermelon_kw_01",
  "photo_frypan_chinese_kw_01",
  "photo_frypan_m_kw_01",
  "photo_garbagecan_kw_01",
  "photo_gasbombe_oc_04",
  "photo_go_jailtoilet_a",
  "photo_parasol_sk_01",
  "photo_pot_kk_04",
  "photo_pot_kk_05",
  "photo_signboard_ms_01",
  "photo_steeldrum_kk_01",
  "photo_table_sk_02",
  "photo_vendingmachine_ks_02",
  "photo_woodbox_ms_01",
  "pi_grab_piller_01",
  "pi_grab_piller_01_brk_dy",
  "pi2_grab_ground_01",
  "pi2_grab_ground_01_brk_dy",
  "piano_md_01",
  "po_a_01a_flag_a",
  "po_a_01a_flag_b",
  "po_a_01a_flag_c",
  "po_a_01a_flag_d",
  "po_a_01a_flag_e",
  "roost_yj_01",
  "roost_yj_02",
  "roost_yj_03",
  "roost_yj_04",
  "sandbag_oc_01",
  "sandbag_oc_01_brk_dy",
  "sandbag_oc_02",
  "sandbag_oc_02_brk_md01",
  "sandbag_oc_02_brk_md02",
  "shelf_ms_01",
  "signboard_kk_01",
  "signboard_ms_01",
  "signboard_ms_01_brk_dy",
  "speaker_kk_01",
  "spt_duct_common",
  "spt_fence_common",
  "spt_gastank_ms_01",
  "spt_grabrock_ms_01",
  "spt_missile_md_01",
  "spt_steeldrum_kk_01",
  "steeldrum_kk_01",
  "steeldrum_kk_02",
  "steeldrum_kk_03",
  "stonemonument_md_01",
  "strawroof_md_01",
  "swing_md_01a",
  "table_kk_01",
  "table_kk_03",
  "table_kk_04",
  "table_kk_06",
  "table_kk_07",
  "table_kk_09",
  "table_kw_01",
  "table_ms_03",
  "table_ms_07",
  "table_sk_01",
  "table_yj_01",
  "table_yj_02",
  "table_yj_03",
  "table_yj_04",
  "tablecloth_ms_01",
  "target_md_01",
  "tree_sk_14",
  "tv_kk_01",
  "tv1",
  "tv2",
  "tv3",
  "tv4",
  "tv5",
  "up_a_bridge_base",
  "up_a_bridge_parts01",
  "up_a_bridge_parts02",
  "up_a_bridge_parts03",
  "up_a_bridge_parts04",
  "up_a_bridge_parts05",
  "up_a_bridge_parts06",
  "up_a_bridge_parts07",
  "up_a_bridge_parts08",
  "up_a_bridge_parts09",
  "up_a_bridge_parts10",
  "up_a_bridge_parts11",
  "up_a_bridge_parts12",
  "up_a_bridge_parts13",
  "up_a_bridge_parts14",
  "up_a_bridge_parts15",
  "up_a_bridge_parts16",
  "up_a_bridge_parts17",
  "up_a_bridge_parts18",
  "up_a_bridge_parts19",
  "up_a_bridge_parts20",
  "up_a_bridge_parts21",
  "up_a_bridge_parts22",
  "up_a_bridge_parts23",
  "up_a_bridge_parts24",
  "up_a_bridge_parts25",
  "up_a_bridge_parts26",
  "up_a_bridge_parts27",
  "up_a_bridge_parts28",
  "up_a_bridge_parts29",
  "up_a_bridge_parts30",
  "up_a_bridge_parts31",
  "up_a_bridge_parts32",
  "up_a_bridge_parts33",
  "up_a_bridge_parts34",
  "up_a_bridge_parts35",
  "up_a_bridge_parts36",
  "up_a_bridge_parts37",
  "up_a_bridge_parts38",
  "up_a_bridge_parts39",
  "up_a_bridge_parts40",
  "up_a_bridge_parts41",
  "up_a_bridge_parts42",
  "up_a_bridge_parts43",
  "up_a_bridge_parts44",
  "up_a_bridge_parts45",
  "up_a_bridge_parts46",
  "up_a_bridge_parts47",
  "up_a_bridge_parts48",
  "ve_ar_c",
  "ve_ar_c_brk_md01",
  "ve_ar_c_brk_md02",
  "ve_ar_c_brk_md03",
  "ve_ar_c_brk_md04",
  "ve_ar_d",
  "ve_ar_d_brk_md01",
  "ve_ar_d_brk_md02",
  "ve_ar_d_brk_md03",
  "ve_ar_d_brk_md04",
  "ve_ar_e",
  "ve_ar_e_brk_md01",
  "ve_ar_e_brk_md02",
  "ve_ar_e_brk_md03",
  "ve_ar_e_brk_md04",
  "ve_k",
  "vendors_kw_01",
  "vendors_kw_02",
  "vendors_sk_01",
  "vendors_sk_02",
  "vendors_sk_03",
  "vendors_sk_04",
  "vendors_sk_05",
  "vendors_sk_06",
  "vendors_sk_06_brk_md01",
  "vendors_sk_07",
  "vendors_sk_07_brk_md01",
  "vendors_sk_07_brk_md02",
  "vendors_sk_07_brk_md03",
  "vendors_sk_07_brk_md04",
  "vendors_sk_07_brk_md05",
  "vendors_sk_07_brk_md06",
  "vendors_sk_08",
  "vendors_sk_08_brk_md01",
  "vendors_sk_08_brk_md02",
  "vendors_sk_09",
  "vendors_sk_10",
  "vendors_sk_10_brk_md01",
  "vendors_sk_11",
  "washhouse_fl_01",
  "wireroll_oc_01",
  "woodbox_kk_01",
  "woodbox_kk_02",
  "woodbox_kk_03",
  "woodbox_kk_04",
  "woodbox_kk_05",
  "woodbox_kk_06",
  "woodbox_ms_01",
  "woodbox_ms_02",
  "woodbox_sk_01",
  "woodbox_sk_02",
  "woodbox_sk_03",
  "woodbox_sk_04",
  "woodbox_sk_05",
  "woodbox_sk_06",
  "woodbox_sk_07",
  "woodboxvogo_kk_01",
  "woodboxvogo_kk_01_event_01",
  "woodboxvogo_kk_02",
  "woodboxvogo_kk_02_event_01",
  "woodboxvogo_kk_03",
  "woodboxvogo_kk_03_event_01",
  "bench_kk_01",
  "bench_kk_01_brk_dy",
  "bench_kk_02",
  "bench_kk_02_brk_dy",
  "bench_kk_03",
  "bench_kk_03_brk_dy",
  "bench_kw_01",
  "bench_kw_01_brk_dy",
  "bench_kw_02",
  "bench_kw_02_brk_dy",
  "bench_kw_03",
  "bench_kw_03_brk_dy",
  "bench_kw_04",
  "bench_kw_04_brk_dy",
  "box_kk_01",
  "box_kk_02",
  "box_kk_03",
  "box_kw_01",
  "box_ms_03",
  "box_ms_05",
  "box_sk_01",
  "box_sk_02",
  "broom_kw_01",
  "cablereel_oc_01",
  "cablereel_oc_01_brk_md01",
  "cablereel_oc_02",
  "cablereel_oc_02_brk_md01",
  "chest_kk_01",
  "cone_kk_01",
  "cone_kk_01_brk_dy",
  "dustbox_md_01",
  "dustbox_md_01_brk_md01",
  "easel_sk_01",
  "g1_cardboardbox_sk_02",
  "g1_light_es_01",
  "g1_light_es_01_ed",
  "g1_light_kk_03",
  "g1_light_kk_03_ed",
  "g1_light_kk_04",
  "g1_light_sn_01_ed",
  "g1_sign_kk_11",
  "g1_tree_ms_01",
  "g1_tree_ms_02",
  "g1_tree_pd_01",
  "g1_vase_sn_01",
  "g1_watertank_kk_01",
  "gastank_ms_01",
  "go_jailbucket_a",
  "go_light_a",
  "go_light_b",
  "go_light_c",
  "light_md_01",
  "light_md_02",
  "light_yj_03",
  "light_yj_04",
  "parasol_kw_01",
  "parasol_kw_01_brk_md01",
  "parasol_sk_01",
  "parasol_sk_01_brk_md01",
  "parasol_sk_02",
  "parasol_sk_02_brk_md01",
  "table_kk_02",
  "table_kk_08",
  "table_kw_02",
  "table_ms_04",
  "table_sk_02",
  "table_sk_03",
  "vase_kw_01",
  "vendertent_kw_01",
  "standmic_md_01",
  "garden_sk_08_water",
  "garden_sk_09_water",
  "garden_sk_10_water",
  "up_a_02_water",
  "up_a_02_water_01",
  "up_a_02_water_02",
  "up_a_02_water_03",
  "up_a_02_water_04",
  "up_a_02_water_05",
  "up_a_04_water",
  "up_a_04_water_01",
  "up_a_04_water_02",
  "up_a_04_water_03",
  "up_a_05_water",
  "up_a_08_water",
  "up_a_09_water",
  "up_a_09_water_01",
  "up_a_09_water_02",
  "up_a_09_water_03",
  "up_a_09_water_04",
  "up_a_10_water",
  "up_a_10_water_01",
  "up_a_10_water_02",
  "up_a_10_water_03",
  "up_a_10_water_04",
  "up_a_10_water_05",
  "up_a_10_water_06",
  "up_a_11_water",
  "up_a_11_water_01",
  "up_a_11_water_02",
  "bowl_fl_01_water",
  "bowl_fl_02_water",
  "pool_fl_01_water",
  "pool_fl_02_water",
  "fountain_kw_01_water",
  "fountain_oc_01_water",
  "mi_statue_kw_03_water",
  "mi_a_02_water",
  "go_fountain_a_water",
  "go_waterway_a_water",
  "go_watergate_a_water",
  "g1_fountain_sk_01_water",
  "g1_monument_sn_01_water",
  "g1_monument_sn_02_water",
  "wa_a_01_water",
  "cimagichand01_base",
  "cidrink01_base",
  "cibag01_base",
  "cibag02_base",
  "cibook02_base",
  "ciflyer01_base",
  "ciattachecase02_base",
  "woodbox_kk_03_mob",
  "ciclub01_base",
  "ciaccordion01_base",
  "ciskewered01_base",
  "cimemo01_base",
  "cibottle01_base",
  "ciwinegrass01_base",
  "cibook01_base",
  "cibouquet01_base",
  "cideckbrush01_base",
  "cidustcloth01_base",
  "cijorro01_base",
  "cipaperbag01_base",
  "cifood01_base",
  "ciwatergun01_base",
  "cibrunch01_base",
  "ciguitar01_base",
  "civiolin01_base",
  "cibow01_base",
  "cisoftcream01_base",
  "cisoftcream02_base",
  "cisisdoll01_base",
  "g1_swing_sk_01",
  "g1_pole_sn_01",
  "g1_post_sk_01",
  "g1_monument_pd_03",
  "g1_apple_yy_01",
  "g1_sign_kk_02",
  "g1_light_sn_02",
  "g1_light_sn_02_off",
  "g1_light_sn_01",
  "g1_light_sn_01_off",
  "g1_light_sk_01",
  "g1_light_sk_01_off",
  "g1_prop_sk_10",
  "g1_slide_sk_01",
  "g1_signboard_sn_01",
  "g1_fence_sm_03",
  "g1_watertank_sk_01",
  "g1_telephonebox_sn_01",
  "g1_sign_kk_05",
  "g1_light_kk_02",
  "g1_sign_sn_01",
  "g1_light_kk_02_off",
  "g1_light_kk_03_off",
  "g1_arch_kk_01",
  "cinewspaper01_base",
  "cifrisbee01_base",
  "az4_rubble_01",
  "az4_rubble_02",
  "az4_rubble_03",
  "az4_rubble_04",
  "az4_rubble_05",
  "az4_rubble_06",
  "az4_rubble_07",
  "nvwol02crystal",
  "citkgparts01_base",
  "citkgparts02_base",
  "citkgparts03_base",
  "citkgparts04_base",
  "citkgparts05_base",
  "citkgparts06_base",
  "citkgparts07_base",
  "co_moss_oc_03",
  "md_nvgrd01_armor_05",
  "md_nvgrd01_armor_07",
  "md_nvgrd01_armor_08",
  "md_nvgrd01_armor_12",
  "md_nvgrd01_armor_13",
  "md_nvgrd01_armor_14",
  "md_nvgrd01_armor_16",
  "md_nvgrd01_armor_17",
  "md_nvgrd01_armor_18",
  "md_nvgrd01_armor_19",
  "md_nvgrd01_armor_20",
  "md_nvgrd02_armor_05",
  "md_nvgrd02_armor_07",
  "md_nvgrd02_armor_08",
  "md_nvgrd02_armor_12",
  "md_nvgrd02_armor_13",
  "md_nvgrd02_armor_14",
  "md_nvgrd02_armor_16",
  "md_nvgrd02_armor_17",
  "md_nvgrd02_armor_18",
  "md_nvgrd02_armor_19",
  "md_nvgrd02_armor_20",
  "md_nvgrd03_armor_05",
  "md_nvgrd03_armor_07",
  "md_nvgrd03_armor_08",
  "md_nvgrd03_armor_12",
  "md_nvgrd03_armor_13",
  "md_nvgrd03_armor_14",
  "md_nvgrd03_armor_16",
  "md_nvgrd03_armor_17",
  "md_nvgrd03_armor_18",
  "md_nvgrd03_armor_19",
  "md_nvgrd03_armor_20",
  "md_nvtre01rock01_01",
  "md_nvtre01rock01_03",
  "md_nvtre01rock01_04",
  "md_nvtre01rock01_05",
  "md_nvtre01rock02_01",
  "md_nvtre01rock02_02",
  "md_nvtre01rock02_03",
  "md_nvtre01rock02_05",
  "md_nvtre01rock02_06",
  "md_nvtre01rock02_07",
  "md_nvtre01rock03_01",
  "md_nvtre01rock03_02",
  "md_nvtre01rock03_03",
  "md_nvtre01rock03_04",
  "md_nvtre01rock03_05",
  "md_nvtre01rock03_06",
  "md_nvtre01_rock04_02",
  "md_nvtre01_rock04_04",
  "md_nvtre01_rock04_05",
  "md_nvtre01_rock04_07",
  "md_nvtre01_rock04_08",
  "md_nvtre01_rock04_09",
  "md_nvtre01_rock04_11",
  "md_nvtre01_rock04_12",
  "md_nvtre02rock01_01",
  "md_nvtre02rock01_03",
  "md_nvtre02rock01_04",
  "md_nvtre02rock01_05",
  "md_nvtre02rock02_01",
  "md_nvtre02rock02_02",
  "md_nvtre02rock02_03",
  "md_nvtre02rock02_05",
  "md_nvtre02rock02_06",
  "md_nvtre02rock02_07",
  "md_nvtre02rock03_01",
  "md_nvtre02rock03_02",
  "md_nvtre02rock03_03",
  "md_nvtre02rock03_04",
  "md_nvtre02rock03_05",
  "md_nvtre02rock03_06",
  "md_nvtre02_rock04_02",
  "md_nvtre02_rock04_04",
  "md_nvtre02_rock04_05",
  "md_nvtre02_rock04_07",
  "md_nvtre02_rock04_08",
  "md_nvtre02_rock04_09",
  "md_nvtre02_rock04_11",
  "md_nvtre02_rock04_12",
  "md_nvtre03rock01_01",
  "md_nvtre03rock01_03",
  "md_nvtre03rock01_04",
  "md_nvtre03rock01_05",
  "md_nvtre03rock02_01",
  "md_nvtre03rock02_02",
  "md_nvtre03rock02_03",
  "md_nvtre03rock02_05",
  "md_nvtre03rock02_06",
  "md_nvtre03rock02_07",
  "md_nvtre03rock03_01",
  "md_nvtre03rock03_02",
  "md_nvtre03rock03_03",
  "md_nvtre03rock03_04",
  "md_nvtre03rock03_05",
  "md_nvtre03rock03_06",
  "md_nvtre03_rock04_02",
  "md_nvtre03_rock04_04",
  "md_nvtre03_rock04_05",
  "md_nvtre03_rock04_07",
  "md_nvtre03_rock04_08",
  "md_nvtre03_rock04_09",
  "md_nvtre03_rock04_11",
  "md_nvtre03_rock04_12",
  "md_nvlas01_armor_001",
  "md_nvlas01_armor_003",
  "md_nvlas01_armor_004",
  "md_nvlas01_armor_006",
  "md_nvlas01_armor_008",
  "md_nvlas01_armor_010",
  "md_nvlas01_armor_011",
  "md_nvlas01_armor_016",
  "md_nvlas01_armor_021",
  "md_nvlas01_armor_022",
  "md_nvlas01_armor_023",
  "md_nvlas01_armor_024",
  "md_nvlas03_armor_001",
  "md_nvlas03_armor_003",
  "md_nvlas03_armor_004",
  "md_nvlas03_armor_006",
  "md_nvlas03_armor_008",
  "md_nvlas03_armor_010",
  "md_nvlas03_armor_011",
  "md_nvlas03_armor_016",
  "md_nvlas03_armor_021",
  "md_nvlas03_armor_022",
  "md_nvlas03_armor_023",
  "md_nvlas03_armor_024",
  "photoitem_01",
  "photoitem_02",
  "photoitem_03",
  "photoitem_04",
  "photoitem_05",
  "photoitem_06",
  "photoitem_07",
  "photoitem_08",
  "photoitem_09",
  "photoitem_10",
  "photoitem_11",
  "photoitem_12",
  "photoitem_13",
  "photoitem_14",
  "photoitem_15",
  "md_nvbmm01_sickle_01",
  "md_nvbmm01_sickle_02",
  "md_nvbmm01_sickle_04",
  "md_nvbmm01_sickle_09",
  "md_nvbmm01_sickle_15",
  "md_nvbmm01_sickle_16",
  "md_nvbmm01_shell_01",
  "md_nvbmm01_shell_02",
  "md_nvbmm01_shell_03",
  "md_nvbmm01_shell_04",
  "md_nvbmm01_shell_05",
  "md_nvbmm01_shell_06",
  "md_nvbmm01_shell_07",
  "md_nvbmm01_shell_08",
  "md_nvbmm01_shell_09",
  "md_nvbmm01_shell_10",
  "md_nvbmm01_shell_11",
  "md_nvbmm01_shell_12",
  "md_nvbmm01_shell_13",
  "md_nvbmm01_shell_14",
  "md_nvbmm01_shell_15",
  "md_nvbmm01_shell_16",
  "md_nvbmm01_shell_17",
  "md_nvbmm01_shell_18",
  "md_nvbmm01_shell_19",
  "md_nvbmm01_shell_20",
  "md_nvbmm01_shell_21",
  "md_nvbmm01_shell_22",
  "md_nvbmm01_shell_23",
  "md_nvbmm01_shell_24",
  "md_nvbmm01_shell_25",
  "md_nvbmm01_shell_26",
  "md_nvbmm01_shell_27",
  "md_nvbmm01_shell_28",
  "md_nvbmm01_shell_29",
  "md_nvbmm01_shell_30",
  "md_nvbmm01_shell_31",
  "md_nvbmm01_shell_32",
  "md_nvbmm01_shell_33",
  "md_nvbmm02_sickle_01",
  "md_nvbmm02_sickle_02",
  "md_nvbmm02_sickle_04",
  "md_nvbmm02_sickle_09",
  "md_nvbmm02_sickle_15",
  "md_nvbmm02_sickle_16",
  "md_nvbmm02_shell_03",
  "md_nvbmm02_shell_05",
  "md_nvbmm02_shell_06",
  "md_nvbmm02_shell_07",
  "md_nvbmm02_shell_08",
  "md_nvbmm02_shell_10",
  "md_nvbmm02_shell_12",
  "md_nvbmm02_shell_18",
  "md_nvbmm02_shell_19",
  "md_nvbmm02_shell_20",
  "md_nvbmm02_shell_25",
  "md_nvbmm02_shell_26",
  "md_nvbmm02_shell_27",
  "md_nvbmm02_shell_31",
  "md_nvbmm02_shell_33",
  "md_nvdef01armor01_06",
  "md_nvdef01armor01_12",
  "md_nvdef01armor01_13",
  "md_nvdef01armor01_15",
  "md_nvdef02armor01_06",
  "md_nvdef02armor01_12",
  "md_nvdef02armor01_13",
  "md_nvdef02armor01_15",
  "md_nvdef03armor01_06",
  "md_nvdef03armor01_12",
  "md_nvdef03armor01_13",
  "md_nvdef03armor01_15",
  "md_mcsml01_engine_09",
  "md_mcsml01_engine_12",
  "md_mcsml01_engine_13",
  "md_mcsml01_engine_11",
  "md_mcsml01_fin11l_01",
  "md_mcsml01_fin11l_02",
  "md_mcsml01_fin11l_03",
  "md_mcsml01_fin11l_04",
  "md_mcsml01_fin12l_01",
  "md_mcsml01_fin12l_02",
  "md_mcsml01_fin12l_03",
  "md_mcsml01_fin12r_01",
  "md_mcsml01_fin12r_02",
  "md_mcsml01_fin21l_01",
  "md_mcsml01_fin21l_02",
  "md_mcsml01_fin21l_03",
  "md_mcsml01_fin21r_01",
  "md_mcsml01_fin21r_02",
  "md_mcsml01_fin21r_03",
  "md_mcsml01_fin22l_01",
  "md_mcsml01_fin22l_02",
  "md_mcsml01_fin22r_01",
  "md_mcsml01_fin22r_02",
  "md_mcsml01_fin31l_01",
  "md_mcsml01_fin31l_02",
  "md_mcsml01_fin31l_03",
  "md_mcsml01_fin31l_04",
  "md_mcsml01_fin31r_01",
  "md_mcsml01_fin31r_02",
  "md_mcsml01_fin31r_04",
  "md_mcsml01_fin32l_01",
  "md_mcsml01_fin32l_02",
  "md_mcsml01_fin32l_03",
  "md_mcsml01_fin32r_01",
  "md_mcsml01_fin32r_02",
  "md_mcsml01_fin32r_03",
  "md_mcsml01_forearml_03",
  "md_mcsml01_forearml_04",
  "md_mcsml01_forearml_05",
  "md_mcsml01_handl_02",
  "md_mcsml01_handl_03",
  "md_mcsml01_handl_04",
  "md_mcsml01_handl_05",
  "md_mcsml01_handl_07",
  "md_mcsml01_handr_01",
  "md_mcsml01_handr_02",
  "md_mcsml01_hatch_01",
  "md_mcsml01_hatch_02",
  "md_mcsml01_hatch_03",
  "md_mcsml01_hatch_04",
  "md_mcsml01_uparm1l",
  "md_mcsml01_uparm1r",
  "g1_antenna_kk_01",
  "g1_antenna_sm_01",
  "g1_antenna_sm_02",
  "g1_bench_iy_01",
  "g1_bench_iy_01_brk_dy",
  "g1_chair_iy_01",
  "g1_chair_iy_01_brk_dy",
  "g1_chair_kn_01",
  "g1_decoration_ms_01",
  "g1_decoration_ms_02",
  "g1_decoration_ms_04",
  "g1_decoration_ms_05",
  "g1_desk_iy_01",
  "g1_dust_sk_01",
  "g1_dust_sk_01_brk_dy",
  "g1_dustbox_sn_01",
  "g1_flower_sk_01",
  "g1_light_sk_03",
  "g1_light_sn_03",
  "g1_monument_pd_02",
  "g1_monument_sk_01",
  "g1_pylon_sn_01",
  "g1_roadclosedsign_sn_01",
  "g1_rubble_sk_05",
  "g1_rubble_sk_05_brk_dy",
  "g1_rubble_sk_05_brk_md01",
  "g1_rubble_sk_05_brk_md02",
  "g1_vase_sn_02",
  "g1_vase_sn_03",
  "g1_fireplug_kk_02",
  "g1_light_sk_03_off",
  "g1_light_sn_03_off",
  "g1_prop_kk_07",
  "lo_light_fl_01",
  "garbagecontainer_kw_01",
  "garbagecontainer_kw_01b",
  "manekin_kw_01",
  "manekin_kw_02",
  "manekin_kw_03",
  "manekin_kw_04",
  "photo_beacon_md_01",
  "photo_g1_fireplug_kk_02",
  "photo_g1_sign_kk_11",
  "photo_g1_telephonebox_sn_01",
  "photo_gasbombe_oc_02",
  "photo_postbox_kw_01",
  "photo_potspans_kw_07",
  "photo_pot_kk_01",
  "photo_pot_nk_02",
  "photo_woodboxvogo_kk_01",
  "photo_woodboxvogo_kk_03",
  "photo_pig_sk_01",
  "photo_speaker_kk_01",
  "mi_foodwagon_kw_01",
  "mi_foodwagon_kw_01_brk_md01",
  "stagelight_sk_01",
  "stagelight_sk_01_brk_dy",
  "stagelight_sk_02",
  "stagelight_sk_02_brk_dy",
  "g1_building_sf_26",
  "pot_kk_01",
  "pot_kk_02",
  "pot_kk_04",
  "pot_kk_05",
  "pot_nk_01",
  "pot_nk_02",
  "tv6",
  "et3_eyeball_oc_02",
  "building_fl_02b",
  "building_fl_03b",
  "building_fl_04b",
  "building_fl_04c",
  "building_fl_04d",
  "building_fl_06b",
  "housepillar_fl_02b",
  "photo_container_ms_01",
  "pi_pillar_kk_06b",
  "pi_pillar_kk_10b",
  "g1_tree_pd_05b",
  "g1_tree_yy_09b",
  "g1_antenna_sm_03",
  "watertank_md_02x",
  "watertank_kk_01x",
  "antenna_mk_01x",
  "antenna_mk_01bx",
  "pi_antenna_kk_01",
  "photoitem_16",
  "photoitem_17",
  "photoitem_18",
  "photoitem_19",
  "photoitem_21",
  "citenshield01_base",
  "photoitem_22",
  "grab_crow_01"
}
function main()
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  Debug:setSwitch({
    "Display",
    "Screen Console"
  }, false)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  Debug:setSwitch({
    "Display",
    "Warning Indicator"
  }, false)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Sensor"
  }, true)
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  createSandbox2("father2"):setString("g_filename", "/Game/Event2/father2.lua")
  createSandbox2("father2"):try_init()
  createSandbox2("father2"):waitForReady()
  createSandbox2("father2"):try_start()
  while not createSandbox2("father2"):sendEvent("isPcSpawned") do
    wait()
  end
  createSandbox2("soundManager"):setString("g_filename", "/Game/Event2/soundmanager.lua")
  createSandbox2("soundManager"):try_init()
  createSandbox2("soundManager"):waitForReady()
  createSandbox2("soundManager"):setGameObject("mother2", g_own)
  createSandbox2("soundManager"):try_start()
  createGameObject2("Area"):setName("test_z_root2")
  createGameObject2("TerrainBg"):setModelName("sky_md_01")
  _loadEventData("test_sound")
  Player:reset(Player.kReset_Standing, findGameObject2("Node", "locator2_pc_start_pos"):getWorldTransform())
  GameDatabase:reset(ggd.GlobalSystemFlags)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
  invokeTask(debugCreateGimmickBg)
  while true do
    wait()
  end
end
function _loadEventData(A0_0)
  local L1_1, L2_2, L3_3
  L1_1 = loadFileAsset
  L2_2 = "evb"
  L3_3 = "evx/"
  L3_3 = L3_3 .. A0_0
  L1_1 = L1_1(L2_2, L3_3)
  L2_2, L3_3 = nil, nil
  if L1_1 ~= nil then
    L1_1:wait()
    L2_2 = L1_1:getRoot()
    L3_3 = EventData:create(A0_0, nil, L2_2)
    L3_3:try_init()
    L3_3:waitForReady()
    L3_3:try_start()
  end
end
import("Font")
import("Pad")
_debugLine = 0
_debugGimmickOn = false
function debugDispPrint(A0_4)
  local L1_5
  L1_5 = Debug
  L1_5 = L1_5.isDebugMenuOpen
  L1_5 = L1_5(L1_5)
  if L1_5 then
    L1_5 = 250
  else
    L1_5 = L1_5 or 50
  end
  Font:debugPrint(L1_5, 50 + 20 * _debugLine, A0_4)
  _debugLine = _debugLine + 1
end
function debugDispTable(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15
  L2_8 = 0
  L3_9 = 15
  for L7_13, L8_14 in L4_10(L5_11) do
    L9_15 = L8_14.name
    if L9_15 then
      L9_15 = L8_14.name
    else
      L9_15 = L9_15 or L8_14
    end
    if L3_9 < #A1_7 then
      if not (L2_8 > L3_9) then
        if A0_6 == L7_13 then
          debugDispPrint(" > " .. L9_15)
          L2_8 = L2_8 + 1
        elseif A0_6 - L7_13 < 6 then
          debugDispPrint("   " .. L9_15)
          L2_8 = L2_8 + 1
        elseif L3_9 > #A1_7 - A0_6 and L7_13 > #A1_7 - L3_9 - 1 then
          debugDispPrint("   " .. L9_15)
          L2_8 = L2_8 + 1
        end
        elseif A0_6 == L7_13 then
          debugDispPrint(" > " .. L9_15)
        else
          debugDispPrint("   " .. L9_15)
        end
      end
  end
end
function debugCreateGimmickBg()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32, L17_33, L18_34, L19_35, L20_36
  L0_16 = false
  L1_17 = 0
  L2_18 = false
  L3_19 = 1
  L4_20 = 0
  L5_21 = Player
  L6_22 = L5_21
  L5_21 = L5_21.getPuppet
  L5_21 = L5_21(L6_22)
  L6_22 = Vector
  L7_23 = 0
  L8_24 = 0
  L9_25 = 0
  L6_22 = L6_22(L7_23, L8_24, L9_25)
  L7_23 = Vector
  L8_24 = 0
  L9_25 = 0
  L10_26 = 0
  L7_23 = L7_23(L8_24, L9_25, L10_26)
  L8_24 = Vector
  L9_25 = 0
  L10_26 = 0
  L11_27 = 0
  L8_24 = L8_24(L9_25, L10_26, L11_27)
  L9_25 = Vector
  L10_26 = 0
  L11_27 = 0
  L9_25 = L9_25(L10_26, L11_27, L12_28)
  L10_26 = {}
  L11_27 = Vector
  L11_27 = L11_27(L12_28, L13_29, L14_30)
  for L15_31, L16_32 in L12_28(L13_29) do
    L17_33 = math
    L17_33 = L17_33.floor
    L18_34 = L15_31 - 1
    L18_34 = L18_34 / 20
    L17_33 = L17_33(L18_34)
    L18_34 = L15_31 - 1
    L19_35 = L17_33 * 20
    L18_34 = L18_34 - L19_35
    L19_35 = print
    L20_36 = L18_34
    L19_35(L20_36)
    L19_35 = Vector
    L20_36 = 3 * L18_34
    L19_35 = L19_35(L20_36, 0, -3 * L17_33)
    L19_35 = L11_27 + L19_35
    L20_36 = createGimmickBgObject
    L20_36 = L20_36(L16_32, L19_35)
    table.insert(L10_26, L20_36)
  end
  while true do
    L8_24 = L12_28
    L9_25 = L12_28
    L8_24.y = L12_28
    L6_22 = L8_24 - L9_25
    L7_23 = L12_28
    L6_22 = L9_25 + L12_28
    L12_28(L13_29, L14_30)
    L12_28(L13_29, L14_30)
    if L12_28 then
      if L12_28 then
        for L15_31, L16_32 in L12_28(L13_29) do
          L18_34 = L16_32
          L17_33 = L16_32.isBroken
          L17_33 = L17_33(L18_34)
          if L17_33 then
            L18_34 = L16_32
            L17_33 = L16_32.requestRestore
            L17_33 = L17_33(L18_34)
            if not L17_33 then
              L18_34 = L16_32
              L17_33 = L16_32.requestRestoreForce
              L17_33(L18_34)
            end
            L17_33 = print
            L19_35 = L16_32
            L18_34 = L16_32.getName
            L18_34 = L18_34(L19_35)
            L19_35 = " restore"
            L18_34 = L18_34 .. L19_35
            L17_33(L18_34)
          end
        end
      end
    end
    if L12_28 then
      if L12_28 then
        _debugGimmickOn = true
      end
    end
    if L12_28 then
      L12_28(L13_29, L14_30)
      L12_28(L13_29, L14_30)
      L15_31 = Player
      L15_31 = L15_31.kAbility_FirstPersonView
      L16_32 = Player
      L16_32 = L16_32.kAbility_GravityShift
      L17_33 = Player
      L17_33 = L17_33.kAbility_GravityRevert
      L15_31 = false
      L12_28(L13_29, L14_30, L15_31)
      L15_31 = "Display"
      L16_32 = "DebugDrawGroup"
      L17_33 = "ScriptQuery"
      L15_31 = true
      L12_28(L13_29, L14_30, L15_31)
      L15_31 = "Display"
      L16_32 = "DebugDrawGroup"
      L17_33 = "ScriptDebugDraw"
      L15_31 = true
      L12_28(L13_29, L14_30, L15_31)
      L2_18 = false
      if not L12_28 then
        if L4_20 <= 0 then
          if L12_28 then
            if not L0_16 then
              L0_16 = true
              L2_18 = true
            end
          elseif L12_28 then
            if not L0_16 then
              L0_16 = true
              _debugGimmickOn = false
            end
          elseif L12_28 then
            L1_17 = L1_17 + 1
            if L1_17 > 20 then
              L1_17 = 20
            end
            if not L0_16 or L1_17 > 10 then
              L0_16 = true
              L3_19 = L3_19 - 1
              if L3_19 <= 0 then
                L3_19 = #L12_28
              end
            end
          elseif L12_28 then
            L1_17 = L1_17 + 1
            if L1_17 > 20 then
              L1_17 = 20
            end
            if not L0_16 or L1_17 > 10 then
              L0_16 = true
              L3_19 = L3_19 + 1
              if L3_19 > L12_28 then
                L3_19 = 1
              end
            end
          elseif L12_28 then
            L1_17 = L1_17 + 1
            if L1_17 > 20 then
              L1_17 = 20
            end
            if not L0_16 or L1_17 > 10 then
              L0_16 = true
              L3_19 = L3_19 - 10
              if L3_19 <= 0 then
                L3_19 = 1
              end
            end
          elseif L12_28 then
            L1_17 = L1_17 + 1
            if L1_17 > 20 then
              L1_17 = 20
            end
            if not L0_16 or L1_17 > 10 then
              L0_16 = true
              L3_19 = L3_19 + 10
              if L3_19 > L12_28 then
                L3_19 = #L12_28
              end
            end
          else
            L1_17 = 0
            L0_16 = false
          end
        else
          L4_20 = L4_20 - 1
        end
      else
        L4_20 = 10
      end
      _debugLine = 0
      L12_28(L13_29)
      L12_28(L13_29)
      L12_28(L13_29)
      L12_28(L13_29)
      L12_28(L13_29)
      L12_28(L13_29, L14_30)
      if L2_18 then
        L15_31 = L6_22
        L13_29(L14_30, L15_31)
      end
    else
      _debugLine = 0
      L12_28(L13_29)
      L12_28(L13_29)
      L15_31 = "Display"
      L16_32 = "DebugDrawGroup"
      L17_33 = "ScriptQuery"
      L15_31 = false
      L12_28(L13_29, L14_30, L15_31)
      L15_31 = "Display"
      L16_32 = "DebugDrawGroup"
      L17_33 = "ScriptDebugDraw"
      L15_31 = false
      L12_28(L13_29, L14_30, L15_31)
      L15_31 = Player
      L15_31 = L15_31.kAbility_FirstPersonView
      L16_32 = Player
      L16_32 = L16_32.kAbility_GravityShift
      L17_33 = Player
      L17_33 = L17_33.kAbility_GravityRevert
      L15_31 = true
      L12_28(L13_29, L14_30, L15_31)
      L12_28(L13_29, L14_30)
      L12_28(L13_29, L14_30)
    end
    L12_28()
  end
end
function createGimmickBgObject(A0_37, A1_38)
  createGameObject2("GimmickBg"):setName(A0_37)
  createGameObject2("GimmickBg"):setDrawModelName(A0_37)
  createGameObject2("GimmickBg"):setAttributeName(A0_37)
  createGameObject2("GimmickBg"):setCollisionName(A0_37)
  createGameObject2("GimmickBg"):setWorldTransform(A1_38)
  createGameObject2("GimmickBg"):setForceMove()
  createGameObject2("GimmickBg"):try_init()
  createGameObject2("GimmickBg"):waitForReady()
  createGameObject2("GimmickBg"):try_start()
  return (createGameObject2("GimmickBg"))
end
function playAmb(A0_39, A1_40)
  if _handle == nil then
    _handle = Sound:playSEHandle(A0_39, 1, A1_40)
    Font:debugPrint("amb\229\134\141\231\148\159 " .. ":" .. (A0_39 or "nil") .. ":" .. (A1_40 or "nil"))
  end
end
function stopAmb()
  if _handle then
    Sound:stopSEHandle(_handle)
    _handle = nil
    Font:debugPrint("amb\229\129\156\230\173\162")
  end
end
function test_OnEnter()
  stopAmb()
  playAmb("amb001", "wind_strength 1.0")
end
function test_OnLeave()
  stopAmb()
end
