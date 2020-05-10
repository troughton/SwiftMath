
add_library(SwiftMath)

target_sources(SwiftMath PRIVATE
  AffineMatrix.swift
  Angle.swift
  Colour.swift
  Easing.swift
  Frustum.swift
  Functions.swift
  Matrix2x2.swift
  Matrix3x3.swift
  Matrix4x4.swift
  Matrix4x4+Extensions.swift
  PackedVector3.swift
  Packing.swift
  Primitives.swift
  Quaternion.swift
  Random.swift
  SimdVector.swift
  Splines.swift
  Swizzle.swift
  Utils.swift
  Vector.swift
  Vector3.swift
)

target_link_libraries(SwiftMath PRIVATE
  _NumericsShims RealModule)

install(TARGETS SwiftMath
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin
  COMPONENT lib)


