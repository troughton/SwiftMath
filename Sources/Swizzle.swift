// WARNING: This file is generated. Modifications will be lost.

// Copyright (c) 2015-2016 David Turnbull
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and/or associated documentation files (the
// "Materials"), to deal in the Materials without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Materials, and to
// permit persons to whom the Materials are furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Materials.
//
// THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.


public extension Vector2f {
    public var xy:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var yx:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var rg:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var gr:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var st:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var ts:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
}

public extension Vector3f {
    public var xy:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var xyz:Vector3f { get { return Vector3f(x,y,z) } set { x = newValue.x; y = newValue.y; z = newValue.z } }
    public var xz:Vector2f { get { return Vector2f(x,z) } set { x = newValue.x; z = newValue.y } }
    public var xzy:Vector3f { get { return Vector3f(x,z,y) } set { x = newValue.x; z = newValue.y; y = newValue.z } }
    public var yx:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var yxz:Vector3f { get { return Vector3f(y,x,z) } set { y = newValue.x; x = newValue.y; z = newValue.z } }
    public var yz:Vector2f { get { return Vector2f(y,z) } set { y = newValue.x; z = newValue.y } }
    public var yzx:Vector3f { get { return Vector3f(y,z,x) } set { y = newValue.x; z = newValue.y; x = newValue.z } }
    public var zx:Vector2f { get { return Vector2f(z,x) } set { z = newValue.x; x = newValue.y } }
    public var zxy:Vector3f { get { return Vector3f(z,x,y) } set { z = newValue.x; x = newValue.y; y = newValue.z } }
    public var zy:Vector2f { get { return Vector2f(z,y) } set { z = newValue.x; y = newValue.y } }
    public var zyx:Vector3f { get { return Vector3f(z,y,x) } set { z = newValue.x; y = newValue.y; x = newValue.z } }
    public var rg:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var rgb:Vector3f { get { return Vector3f(x,y,z) } set { x = newValue.x; y = newValue.y; z = newValue.z } }
    public var rb:Vector2f { get { return Vector2f(x,z) } set { x = newValue.x; z = newValue.y } }
    public var rbg:Vector3f { get { return Vector3f(x,z,y) } set { x = newValue.x; z = newValue.y; y = newValue.z } }
    public var gr:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var grb:Vector3f { get { return Vector3f(y,x,z) } set { y = newValue.x; x = newValue.y; z = newValue.z } }
    public var gb:Vector2f { get { return Vector2f(y,z) } set { y = newValue.x; z = newValue.y } }
    public var gbr:Vector3f { get { return Vector3f(y,z,x) } set { y = newValue.x; z = newValue.y; x = newValue.z } }
    public var br:Vector2f { get { return Vector2f(z,x) } set { z = newValue.x; x = newValue.y } }
    public var brg:Vector3f { get { return Vector3f(z,x,y) } set { z = newValue.x; x = newValue.y; y = newValue.z } }
    public var bg:Vector2f { get { return Vector2f(z,y) } set { z = newValue.x; y = newValue.y } }
    public var bgr:Vector3f { get { return Vector3f(z,y,x) } set { z = newValue.x; y = newValue.y; x = newValue.z } }
    public var st:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var stp:Vector3f { get { return Vector3f(x,y,z) } set { x = newValue.x; y = newValue.y; z = newValue.z } }
    public var sp:Vector2f { get { return Vector2f(x,z) } set { x = newValue.x; z = newValue.y } }
    public var spt:Vector3f { get { return Vector3f(x,z,y) } set { x = newValue.x; z = newValue.y; y = newValue.z } }
    public var ts:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var tsp:Vector3f { get { return Vector3f(y,x,z) } set { y = newValue.x; x = newValue.y; z = newValue.z } }
    public var tp:Vector2f { get { return Vector2f(y,z) } set { y = newValue.x; z = newValue.y } }
    public var tps:Vector3f { get { return Vector3f(y,z,x) } set { y = newValue.x; z = newValue.y; x = newValue.z } }
    public var ps:Vector2f { get { return Vector2f(z,x) } set { z = newValue.x; x = newValue.y } }
    public var pst:Vector3f { get { return Vector3f(z,x,y) } set { z = newValue.x; x = newValue.y; y = newValue.z } }
    public var pt:Vector2f { get { return Vector2f(z,y) } set { z = newValue.x; y = newValue.y } }
    public var pts:Vector3f { get { return Vector3f(z,y,x) } set { z = newValue.x; y = newValue.y; x = newValue.z } }
}

public extension Vector4f {
    public var xy:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var xyz:Vector3f { get { return Vector3f(x,y,z) } set { x = newValue.x; y = newValue.y; z = newValue.z } }
    public var xyzw:Vector4f { get { return Vector4f(x,y,z,w) } set { x = newValue.x; y = newValue.y; z = newValue.z; w = newValue.w } }
    public var xyw:Vector3f { get { return Vector3f(x,y,w) } set { x = newValue.x; y = newValue.y; w = newValue.z } }
    public var xywz:Vector4f { get { return Vector4f(x,y,w,z) } set { x = newValue.x; y = newValue.y; w = newValue.z; z = newValue.w } }
    public var xz:Vector2f { get { return Vector2f(x,z) } set { x = newValue.x; z = newValue.y } }
    public var xzy:Vector3f { get { return Vector3f(x,z,y) } set { x = newValue.x; z = newValue.y; y = newValue.z } }
    public var xzyw:Vector4f { get { return Vector4f(x,z,y,w) } set { x = newValue.x; z = newValue.y; y = newValue.z; w = newValue.w } }
    public var xzw:Vector3f { get { return Vector3f(x,z,w) } set { x = newValue.x; z = newValue.y; w = newValue.z } }
    public var xzwy:Vector4f { get { return Vector4f(x,z,w,y) } set { x = newValue.x; z = newValue.y; w = newValue.z; y = newValue.w } }
    public var xw:Vector2f { get { return Vector2f(x,w) } set { x = newValue.x; w = newValue.y } }
    public var xwy:Vector3f { get { return Vector3f(x,w,y) } set { x = newValue.x; w = newValue.y; y = newValue.z } }
    public var xwyz:Vector4f { get { return Vector4f(x,w,y,z) } set { x = newValue.x; w = newValue.y; y = newValue.z; z = newValue.w } }
    public var xwz:Vector3f { get { return Vector3f(x,w,z) } set { x = newValue.x; w = newValue.y; z = newValue.z } }
    public var xwzy:Vector4f { get { return Vector4f(x,w,z,y) } set { x = newValue.x; w = newValue.y; z = newValue.z; y = newValue.w } }
    public var yx:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var yxz:Vector3f { get { return Vector3f(y,x,z) } set { y = newValue.x; x = newValue.y; z = newValue.z } }
    public var yxzw:Vector4f { get { return Vector4f(y,x,z,w) } set { y = newValue.x; x = newValue.y; z = newValue.z; w = newValue.w } }
    public var yxw:Vector3f { get { return Vector3f(y,x,w) } set { y = newValue.x; x = newValue.y; w = newValue.z } }
    public var yxwz:Vector4f { get { return Vector4f(y,x,w,z) } set { y = newValue.x; x = newValue.y; w = newValue.z; z = newValue.w } }
    public var yz:Vector2f { get { return Vector2f(y,z) } set { y = newValue.x; z = newValue.y } }
    public var yzx:Vector3f { get { return Vector3f(y,z,x) } set { y = newValue.x; z = newValue.y; x = newValue.z } }
    public var yzxw:Vector4f { get { return Vector4f(y,z,x,w) } set { y = newValue.x; z = newValue.y; x = newValue.z; w = newValue.w } }
    public var yzw:Vector3f { get { return Vector3f(y,z,w) } set { y = newValue.x; z = newValue.y; w = newValue.z } }
    public var yzwx:Vector4f { get { return Vector4f(y,z,w,x) } set { y = newValue.x; z = newValue.y; w = newValue.z; x = newValue.w } }
    public var yw:Vector2f { get { return Vector2f(y,w) } set { y = newValue.x; w = newValue.y } }
    public var ywx:Vector3f { get { return Vector3f(y,w,x) } set { y = newValue.x; w = newValue.y; x = newValue.z } }
    public var ywxz:Vector4f { get { return Vector4f(y,w,x,z) } set { y = newValue.x; w = newValue.y; x = newValue.z; z = newValue.w } }
    public var ywz:Vector3f { get { return Vector3f(y,w,z) } set { y = newValue.x; w = newValue.y; z = newValue.z } }
    public var ywzx:Vector4f { get { return Vector4f(y,w,z,x) } set { y = newValue.x; w = newValue.y; z = newValue.z; x = newValue.w } }
    public var zx:Vector2f { get { return Vector2f(z,x) } set { z = newValue.x; x = newValue.y } }
    public var zxy:Vector3f { get { return Vector3f(z,x,y) } set { z = newValue.x; x = newValue.y; y = newValue.z } }
    public var zxyw:Vector4f { get { return Vector4f(z,x,y,w) } set { z = newValue.x; x = newValue.y; y = newValue.z; w = newValue.w } }
    public var zxw:Vector3f { get { return Vector3f(z,x,w) } set { z = newValue.x; x = newValue.y; w = newValue.z } }
    public var zxwy:Vector4f { get { return Vector4f(z,x,w,y) } set { z = newValue.x; x = newValue.y; w = newValue.z; y = newValue.w } }
    public var zy:Vector2f { get { return Vector2f(z,y) } set { z = newValue.x; y = newValue.y } }
    public var zyx:Vector3f { get { return Vector3f(z,y,x) } set { z = newValue.x; y = newValue.y; x = newValue.z } }
    public var zyxw:Vector4f { get { return Vector4f(z,y,x,w) } set { z = newValue.x; y = newValue.y; x = newValue.z; w = newValue.w } }
    public var zyw:Vector3f { get { return Vector3f(z,y,w) } set { z = newValue.x; y = newValue.y; w = newValue.z } }
    public var zywx:Vector4f { get { return Vector4f(z,y,w,x) } set { z = newValue.x; y = newValue.y; w = newValue.z; x = newValue.w } }
    public var zw:Vector2f { get { return Vector2f(z,w) } set { z = newValue.x; w = newValue.y } }
    public var zwx:Vector3f { get { return Vector3f(z,w,x) } set { z = newValue.x; w = newValue.y; x = newValue.z } }
    public var zwxy:Vector4f { get { return Vector4f(z,w,x,y) } set { z = newValue.x; w = newValue.y; x = newValue.z; y = newValue.w } }
    public var zwy:Vector3f { get { return Vector3f(z,w,y) } set { z = newValue.x; w = newValue.y; y = newValue.z } }
    public var zwyx:Vector4f { get { return Vector4f(z,w,y,x) } set { z = newValue.x; w = newValue.y; y = newValue.z; x = newValue.w } }
    public var wx:Vector2f { get { return Vector2f(w,x) } set { w = newValue.x; x = newValue.y } }
    public var wxy:Vector3f { get { return Vector3f(w,x,y) } set { w = newValue.x; x = newValue.y; y = newValue.z } }
    public var wxyz:Vector4f { get { return Vector4f(w,x,y,z) } set { w = newValue.x; x = newValue.y; y = newValue.z; z = newValue.w } }
    public var wxz:Vector3f { get { return Vector3f(w,x,z) } set { w = newValue.x; x = newValue.y; z = newValue.z } }
    public var wxzy:Vector4f { get { return Vector4f(w,x,z,y) } set { w = newValue.x; x = newValue.y; z = newValue.z; y = newValue.w } }
    public var wy:Vector2f { get { return Vector2f(w,y) } set { w = newValue.x; y = newValue.y } }
    public var wyx:Vector3f { get { return Vector3f(w,y,x) } set { w = newValue.x; y = newValue.y; x = newValue.z } }
    public var wyxz:Vector4f { get { return Vector4f(w,y,x,z) } set { w = newValue.x; y = newValue.y; x = newValue.z; z = newValue.w } }
    public var wyz:Vector3f { get { return Vector3f(w,y,z) } set { w = newValue.x; y = newValue.y; z = newValue.z } }
    public var wyzx:Vector4f { get { return Vector4f(w,y,z,x) } set { w = newValue.x; y = newValue.y; z = newValue.z; x = newValue.w } }
    public var wz:Vector2f { get { return Vector2f(w,z) } set { w = newValue.x; z = newValue.y } }
    public var wzx:Vector3f { get { return Vector3f(w,z,x) } set { w = newValue.x; z = newValue.y; x = newValue.z } }
    public var wzxy:Vector4f { get { return Vector4f(w,z,x,y) } set { w = newValue.x; z = newValue.y; x = newValue.z; y = newValue.w } }
    public var wzy:Vector3f { get { return Vector3f(w,z,y) } set { w = newValue.x; z = newValue.y; y = newValue.z } }
    public var wzyx:Vector4f { get { return Vector4f(w,z,y,x) } set { w = newValue.x; z = newValue.y; y = newValue.z; x = newValue.w } }
    public var rg:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var rgb:Vector3f { get { return Vector3f(x,y,z) } set { x = newValue.x; y = newValue.y; z = newValue.z } }
    public var rgba:Vector4f { get { return Vector4f(x,y,z,w) } set { x = newValue.x; y = newValue.y; z = newValue.z; w = newValue.w } }
    public var rga:Vector3f { get { return Vector3f(x,y,w) } set { x = newValue.x; y = newValue.y; w = newValue.z } }
    public var rgab:Vector4f { get { return Vector4f(x,y,w,z) } set { x = newValue.x; y = newValue.y; w = newValue.z; z = newValue.w } }
    public var rb:Vector2f { get { return Vector2f(x,z) } set { x = newValue.x; z = newValue.y } }
    public var rbg:Vector3f { get { return Vector3f(x,z,y) } set { x = newValue.x; z = newValue.y; y = newValue.z } }
    public var rbga:Vector4f { get { return Vector4f(x,z,y,w) } set { x = newValue.x; z = newValue.y; y = newValue.z; w = newValue.w } }
    public var rba:Vector3f { get { return Vector3f(x,z,w) } set { x = newValue.x; z = newValue.y; w = newValue.z } }
    public var rbag:Vector4f { get { return Vector4f(x,z,w,y) } set { x = newValue.x; z = newValue.y; w = newValue.z; y = newValue.w } }
    public var ra:Vector2f { get { return Vector2f(x,w) } set { x = newValue.x; w = newValue.y } }
    public var rag:Vector3f { get { return Vector3f(x,w,y) } set { x = newValue.x; w = newValue.y; y = newValue.z } }
    public var ragb:Vector4f { get { return Vector4f(x,w,y,z) } set { x = newValue.x; w = newValue.y; y = newValue.z; z = newValue.w } }
    public var rab:Vector3f { get { return Vector3f(x,w,z) } set { x = newValue.x; w = newValue.y; z = newValue.z } }
    public var rabg:Vector4f { get { return Vector4f(x,w,z,y) } set { x = newValue.x; w = newValue.y; z = newValue.z; y = newValue.w } }
    public var gr:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var grb:Vector3f { get { return Vector3f(y,x,z) } set { y = newValue.x; x = newValue.y; z = newValue.z } }
    public var grba:Vector4f { get { return Vector4f(y,x,z,w) } set { y = newValue.x; x = newValue.y; z = newValue.z; w = newValue.w } }
    public var gra:Vector3f { get { return Vector3f(y,x,w) } set { y = newValue.x; x = newValue.y; w = newValue.z } }
    public var grab:Vector4f { get { return Vector4f(y,x,w,z) } set { y = newValue.x; x = newValue.y; w = newValue.z; z = newValue.w } }
    public var gb:Vector2f { get { return Vector2f(y,z) } set { y = newValue.x; z = newValue.y } }
    public var gbr:Vector3f { get { return Vector3f(y,z,x) } set { y = newValue.x; z = newValue.y; x = newValue.z } }
    public var gbra:Vector4f { get { return Vector4f(y,z,x,w) } set { y = newValue.x; z = newValue.y; x = newValue.z; w = newValue.w } }
    public var gba:Vector3f { get { return Vector3f(y,z,w) } set { y = newValue.x; z = newValue.y; w = newValue.z } }
    public var gbar:Vector4f { get { return Vector4f(y,z,w,x) } set { y = newValue.x; z = newValue.y; w = newValue.z; x = newValue.w } }
    public var ga:Vector2f { get { return Vector2f(y,w) } set { y = newValue.x; w = newValue.y } }
    public var gar:Vector3f { get { return Vector3f(y,w,x) } set { y = newValue.x; w = newValue.y; x = newValue.z } }
    public var garb:Vector4f { get { return Vector4f(y,w,x,z) } set { y = newValue.x; w = newValue.y; x = newValue.z; z = newValue.w } }
    public var gab:Vector3f { get { return Vector3f(y,w,z) } set { y = newValue.x; w = newValue.y; z = newValue.z } }
    public var gabr:Vector4f { get { return Vector4f(y,w,z,x) } set { y = newValue.x; w = newValue.y; z = newValue.z; x = newValue.w } }
    public var br:Vector2f { get { return Vector2f(z,x) } set { z = newValue.x; x = newValue.y } }
    public var brg:Vector3f { get { return Vector3f(z,x,y) } set { z = newValue.x; x = newValue.y; y = newValue.z } }
    public var brga:Vector4f { get { return Vector4f(z,x,y,w) } set { z = newValue.x; x = newValue.y; y = newValue.z; w = newValue.w } }
    public var bra:Vector3f { get { return Vector3f(z,x,w) } set { z = newValue.x; x = newValue.y; w = newValue.z } }
    public var brag:Vector4f { get { return Vector4f(z,x,w,y) } set { z = newValue.x; x = newValue.y; w = newValue.z; y = newValue.w } }
    public var bg:Vector2f { get { return Vector2f(z,y) } set { z = newValue.x; y = newValue.y } }
    public var bgr:Vector3f { get { return Vector3f(z,y,x) } set { z = newValue.x; y = newValue.y; x = newValue.z } }
    public var bgra:Vector4f { get { return Vector4f(z,y,x,w) } set { z = newValue.x; y = newValue.y; x = newValue.z; w = newValue.w } }
    public var bga:Vector3f { get { return Vector3f(z,y,w) } set { z = newValue.x; y = newValue.y; w = newValue.z } }
    public var bgar:Vector4f { get { return Vector4f(z,y,w,x) } set { z = newValue.x; y = newValue.y; w = newValue.z; x = newValue.w } }
    public var ba:Vector2f { get { return Vector2f(z,w) } set { z = newValue.x; w = newValue.y } }
    public var bar:Vector3f { get { return Vector3f(z,w,x) } set { z = newValue.x; w = newValue.y; x = newValue.z } }
    public var barg:Vector4f { get { return Vector4f(z,w,x,y) } set { z = newValue.x; w = newValue.y; x = newValue.z; y = newValue.w } }
    public var bag:Vector3f { get { return Vector3f(z,w,y) } set { z = newValue.x; w = newValue.y; y = newValue.z } }
    public var bagr:Vector4f { get { return Vector4f(z,w,y,x) } set { z = newValue.x; w = newValue.y; y = newValue.z; x = newValue.w } }
    public var ar:Vector2f { get { return Vector2f(w,x) } set { w = newValue.x; x = newValue.y } }
    public var arg:Vector3f { get { return Vector3f(w,x,y) } set { w = newValue.x; x = newValue.y; y = newValue.z } }
    public var argb:Vector4f { get { return Vector4f(w,x,y,z) } set { w = newValue.x; x = newValue.y; y = newValue.z; z = newValue.w } }
    public var arb:Vector3f { get { return Vector3f(w,x,z) } set { w = newValue.x; x = newValue.y; z = newValue.z } }
    public var arbg:Vector4f { get { return Vector4f(w,x,z,y) } set { w = newValue.x; x = newValue.y; z = newValue.z; y = newValue.w } }
    public var ag:Vector2f { get { return Vector2f(w,y) } set { w = newValue.x; y = newValue.y } }
    public var agr:Vector3f { get { return Vector3f(w,y,x) } set { w = newValue.x; y = newValue.y; x = newValue.z } }
    public var agrb:Vector4f { get { return Vector4f(w,y,x,z) } set { w = newValue.x; y = newValue.y; x = newValue.z; z = newValue.w } }
    public var agb:Vector3f { get { return Vector3f(w,y,z) } set { w = newValue.x; y = newValue.y; z = newValue.z } }
    public var agbr:Vector4f { get { return Vector4f(w,y,z,x) } set { w = newValue.x; y = newValue.y; z = newValue.z; x = newValue.w } }
    public var ab:Vector2f { get { return Vector2f(w,z) } set { w = newValue.x; z = newValue.y } }
    public var abr:Vector3f { get { return Vector3f(w,z,x) } set { w = newValue.x; z = newValue.y; x = newValue.z } }
    public var abrg:Vector4f { get { return Vector4f(w,z,x,y) } set { w = newValue.x; z = newValue.y; x = newValue.z; y = newValue.w } }
    public var abg:Vector3f { get { return Vector3f(w,z,y) } set { w = newValue.x; z = newValue.y; y = newValue.z } }
    public var abgr:Vector4f { get { return Vector4f(w,z,y,x) } set { w = newValue.x; z = newValue.y; y = newValue.z; x = newValue.w } }
    public var st:Vector2f { get { return Vector2f(x,y) } set { x = newValue.x; y = newValue.y } }
    public var stp:Vector3f { get { return Vector3f(x,y,z) } set { x = newValue.x; y = newValue.y; z = newValue.z } }
    public var stpq:Vector4f { get { return Vector4f(x,y,z,w) } set { x = newValue.x; y = newValue.y; z = newValue.z; w = newValue.w } }
    public var stq:Vector3f { get { return Vector3f(x,y,w) } set { x = newValue.x; y = newValue.y; w = newValue.z } }
    public var stqp:Vector4f { get { return Vector4f(x,y,w,z) } set { x = newValue.x; y = newValue.y; w = newValue.z; z = newValue.w } }
    public var sp:Vector2f { get { return Vector2f(x,z) } set { x = newValue.x; z = newValue.y } }
    public var spt:Vector3f { get { return Vector3f(x,z,y) } set { x = newValue.x; z = newValue.y; y = newValue.z } }
    public var sptq:Vector4f { get { return Vector4f(x,z,y,w) } set { x = newValue.x; z = newValue.y; y = newValue.z; w = newValue.w } }
    public var spq:Vector3f { get { return Vector3f(x,z,w) } set { x = newValue.x; z = newValue.y; w = newValue.z } }
    public var spqt:Vector4f { get { return Vector4f(x,z,w,y) } set { x = newValue.x; z = newValue.y; w = newValue.z; y = newValue.w } }
    public var sq:Vector2f { get { return Vector2f(x,w) } set { x = newValue.x; w = newValue.y } }
    public var sqt:Vector3f { get { return Vector3f(x,w,y) } set { x = newValue.x; w = newValue.y; y = newValue.z } }
    public var sqtp:Vector4f { get { return Vector4f(x,w,y,z) } set { x = newValue.x; w = newValue.y; y = newValue.z; z = newValue.w } }
    public var sqp:Vector3f { get { return Vector3f(x,w,z) } set { x = newValue.x; w = newValue.y; z = newValue.z } }
    public var sqpt:Vector4f { get { return Vector4f(x,w,z,y) } set { x = newValue.x; w = newValue.y; z = newValue.z; y = newValue.w } }
    public var ts:Vector2f { get { return Vector2f(y,x) } set { y = newValue.x; x = newValue.y } }
    public var tsp:Vector3f { get { return Vector3f(y,x,z) } set { y = newValue.x; x = newValue.y; z = newValue.z } }
    public var tspq:Vector4f { get { return Vector4f(y,x,z,w) } set { y = newValue.x; x = newValue.y; z = newValue.z; w = newValue.w } }
    public var tsq:Vector3f { get { return Vector3f(y,x,w) } set { y = newValue.x; x = newValue.y; w = newValue.z } }
    public var tsqp:Vector4f { get { return Vector4f(y,x,w,z) } set { y = newValue.x; x = newValue.y; w = newValue.z; z = newValue.w } }
    public var tp:Vector2f { get { return Vector2f(y,z) } set { y = newValue.x; z = newValue.y } }
    public var tps:Vector3f { get { return Vector3f(y,z,x) } set { y = newValue.x; z = newValue.y; x = newValue.z } }
    public var tpsq:Vector4f { get { return Vector4f(y,z,x,w) } set { y = newValue.x; z = newValue.y; x = newValue.z; w = newValue.w } }
    public var tpq:Vector3f { get { return Vector3f(y,z,w) } set { y = newValue.x; z = newValue.y; w = newValue.z } }
    public var tpqs:Vector4f { get { return Vector4f(y,z,w,x) } set { y = newValue.x; z = newValue.y; w = newValue.z; x = newValue.w } }
    public var tq:Vector2f { get { return Vector2f(y,w) } set { y = newValue.x; w = newValue.y } }
    public var tqs:Vector3f { get { return Vector3f(y,w,x) } set { y = newValue.x; w = newValue.y; x = newValue.z } }
    public var tqsp:Vector4f { get { return Vector4f(y,w,x,z) } set { y = newValue.x; w = newValue.y; x = newValue.z; z = newValue.w } }
    public var tqp:Vector3f { get { return Vector3f(y,w,z) } set { y = newValue.x; w = newValue.y; z = newValue.z } }
    public var tqps:Vector4f { get { return Vector4f(y,w,z,x) } set { y = newValue.x; w = newValue.y; z = newValue.z; x = newValue.w } }
    public var ps:Vector2f { get { return Vector2f(z,x) } set { z = newValue.x; x = newValue.y } }
    public var pst:Vector3f { get { return Vector3f(z,x,y) } set { z = newValue.x; x = newValue.y; y = newValue.z } }
    public var pstq:Vector4f { get { return Vector4f(z,x,y,w) } set { z = newValue.x; x = newValue.y; y = newValue.z; w = newValue.w } }
    public var psq:Vector3f { get { return Vector3f(z,x,w) } set { z = newValue.x; x = newValue.y; w = newValue.z } }
    public var psqt:Vector4f { get { return Vector4f(z,x,w,y) } set { z = newValue.x; x = newValue.y; w = newValue.z; y = newValue.w } }
    public var pt:Vector2f { get { return Vector2f(z,y) } set { z = newValue.x; y = newValue.y } }
    public var pts:Vector3f { get { return Vector3f(z,y,x) } set { z = newValue.x; y = newValue.y; x = newValue.z } }
    public var ptsq:Vector4f { get { return Vector4f(z,y,x,w) } set { z = newValue.x; y = newValue.y; x = newValue.z; w = newValue.w } }
    public var ptq:Vector3f { get { return Vector3f(z,y,w) } set { z = newValue.x; y = newValue.y; w = newValue.z } }
    public var ptqs:Vector4f { get { return Vector4f(z,y,w,x) } set { z = newValue.x; y = newValue.y; w = newValue.z; x = newValue.w } }
    public var pq:Vector2f { get { return Vector2f(z,w) } set { z = newValue.x; w = newValue.y } }
    public var pqs:Vector3f { get { return Vector3f(z,w,x) } set { z = newValue.x; w = newValue.y; x = newValue.z } }
    public var pqst:Vector4f { get { return Vector4f(z,w,x,y) } set { z = newValue.x; w = newValue.y; x = newValue.z; y = newValue.w } }
    public var pqt:Vector3f { get { return Vector3f(z,w,y) } set { z = newValue.x; w = newValue.y; y = newValue.z } }
    public var pqts:Vector4f { get { return Vector4f(z,w,y,x) } set { z = newValue.x; w = newValue.y; y = newValue.z; x = newValue.w } }
    public var qs:Vector2f { get { return Vector2f(w,x) } set { w = newValue.x; x = newValue.y } }
    public var qst:Vector3f { get { return Vector3f(w,x,y) } set { w = newValue.x; x = newValue.y; y = newValue.z } }
    public var qstp:Vector4f { get { return Vector4f(w,x,y,z) } set { w = newValue.x; x = newValue.y; y = newValue.z; z = newValue.w } }
    public var qsp:Vector3f { get { return Vector3f(w,x,z) } set { w = newValue.x; x = newValue.y; z = newValue.z } }
    public var qspt:Vector4f { get { return Vector4f(w,x,z,y) } set { w = newValue.x; x = newValue.y; z = newValue.z; y = newValue.w } }
    public var qt:Vector2f { get { return Vector2f(w,y) } set { w = newValue.x; y = newValue.y } }
    public var qts:Vector3f { get { return Vector3f(w,y,x) } set { w = newValue.x; y = newValue.y; x = newValue.z } }
    public var qtsp:Vector4f { get { return Vector4f(w,y,x,z) } set { w = newValue.x; y = newValue.y; x = newValue.z; z = newValue.w } }
    public var qtp:Vector3f { get { return Vector3f(w,y,z) } set { w = newValue.x; y = newValue.y; z = newValue.z } }
    public var qtps:Vector4f { get { return Vector4f(w,y,z,x) } set { w = newValue.x; y = newValue.y; z = newValue.z; x = newValue.w } }
    public var qp:Vector2f { get { return Vector2f(w,z) } set { w = newValue.x; z = newValue.y } }
    public var qps:Vector3f { get { return Vector3f(w,z,x) } set { w = newValue.x; z = newValue.y; x = newValue.z } }
    public var qpst:Vector4f { get { return Vector4f(w,z,x,y) } set { w = newValue.x; z = newValue.y; x = newValue.z; y = newValue.w } }
    public var qpt:Vector3f { get { return Vector3f(w,z,y) } set { w = newValue.x; z = newValue.y; y = newValue.z } }
    public var qpts:Vector4f { get { return Vector4f(w,z,y,x) } set { w = newValue.x; z = newValue.y; y = newValue.z; x = newValue.w } }
}
