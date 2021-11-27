import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// @author DoggieX
/// @create 2021/11/27 17:55
/// @mail coldpuppy@163.com

mixin MarkerBinding {
  Widget? markerView;
  BuildContext? bindingContext;

  Future<Uint8List?> widgetToData(Widget widget) async {
    var ratio = 1.0;
    if (null != bindingContext) {
      ratio = MediaQuery.of(bindingContext!).devicePixelRatio;
    }

    final globalKey = GlobalKey();
    markerView = RepaintBoundary(
      key: globalKey,
      child: widget,
    );

    var renderObject =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (null != renderObject) {
      var image = await renderObject.toImage(pixelRatio: ratio);
      var byteData = await image.toByteData(format: ImageByteFormat.png);
      if (null != byteData) {
        return byteData.buffer.asUint8List();
      }
    }
  }
}