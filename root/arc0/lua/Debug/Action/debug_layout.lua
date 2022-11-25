import("math")
import("common")
function RandomSphereUpperHalf()
  local L0_0
  L0_0 = Vector
  return L0_0(RandF(-1, 1), RandF(0, 1), RandF(-1, 1))
end
function LayoutBeam(A0_1)
  local L2_2, L3_3, L4_4, L5_5
  L2_2 = {}
  for _FORV_5_ = 1, A0_1.num do
    L2_2[_FORV_5_] = LayoutPosYaw(A0_1.origin + A0_1.dir * A0_1.space * _FORV_5_)
  end
  return L2_2
end
function LayoutSphere(A0_6)
  local L2_7, L3_8, L4_9
  L2_7 = {}
  for _FORV_5_ = 1, A0_6.num do
    L2_7[_FORV_5_] = LayoutPosYaw(A0_6.origin + RandomXYZVector() * A0_6.radius, RandF(-PI, PI))
  end
  return L2_7
end
function LayoutSphere_UpperHalf(A0_10)
  local L2_11, L3_12, L4_13
  L2_11 = {}
  for _FORV_5_ = 1, A0_10.num do
    L2_11[_FORV_5_] = LayoutPosYaw(A0_10.origin + RandomSphereUpperHalf() * A0_10.radius, RandF(-PI, PI))
  end
  return L2_11
end
function LayoutCircle(A0_14)
  return (RandomLayoutArray(A0_14.num, A0_14.origin, A0_14.radius))
end
