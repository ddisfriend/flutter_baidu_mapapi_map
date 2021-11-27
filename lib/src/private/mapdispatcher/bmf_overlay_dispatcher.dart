import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_arcline.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_circle.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_dot.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_ground.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_polygon.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_polyline.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_text.dart';
import 'package:flutter_baidu_mapapi_map/src/models/overlays/bmf_tile.dart';
import 'package:flutter_baidu_mapapi_map/src/private/mapdispatcher/bmf_map_method_id.dart'
    show BMFOverlayMethodId;

/// polyline, arcline, polygon, circle
/// Dot Text (Android)
class BMFOverlayDispatcher {
  static const _tag = 'BMFOverlayDispatcher';

  /// 地图添加Polyline
  Future<bool> addPolyline(MethodChannel _mapChannel, BMFPolyline polyline) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(polyline, "polyline");

    polyline.methodChannel = _mapChannel;

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapAddPolylineMethod,
          polyline.toMap() as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 地图添加arcline
  Future<bool> addArcline(MethodChannel _mapChannel, BMFArcLine arcline) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(arcline, "arcline");

    arcline.methodChannel = _mapChannel;
    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapAddArclinelineMethod,
          arcline.toMap() as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 地图添加polygon
  Future<bool> addPolygon(MethodChannel _mapChannel, BMFPolygon polygon) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(polygon, "polygon");

    polygon.methodChannel = _mapChannel;
    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapAddPolygonMethod,
          polygon.toMap() as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 地图添加circle
  Future<bool> addCircle(MethodChannel _mapChannel, BMFCircle circle) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(circle, "circle");

    circle.methodChannel = _mapChannel;
    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapAddCircleMethod,
          circle.toMap() as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 地图添加Dot
  Future<bool> addDot(MethodChannel _mapChannel, BMFDot dot) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(dot, "dot");

    dot.methodChannel = _mapChannel;
    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
              BMFOverlayMethodId.kMapAddDotMethod, dot.toMap() as dynamic))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 地图添加Text
  Future<bool> addText(MethodChannel _mapChannel, BMFText text) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(text, "text");

    text.methodChannel = _mapChannel;
    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
              BMFOverlayMethodId.kMapAddTextMethod, text.toMap() as dynamic))
          as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 地图添加Ground
  Future<bool> addGround(MethodChannel _mapChannel, BMFGround ground) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(ground, "ground");

    ground.methodChannel = _mapChannel;
    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapAddGroundMethod,
          ground.toMap() as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 添加瓦片图
  Future<bool> addTile(MethodChannel _mapChannel, BMFTile tile) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(tile, "tile");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
              BMFOverlayMethodId.kMapAddTileMethod, tile.toMap() as dynamic))
          as bool;
    } on PlatformException catch (e) {
      BMFLog.e(e.toString(), tag: _tag);
    }
    return result;
  }

  /// 移除瓦片图
  Future<bool> removeTile(MethodChannel _mapChannel, BMFTile tile) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(tile, "tile");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapRemoveTileMethod,
          tile.toMap() as dynamic)) as bool;
    } on PlatformException catch (e) {
      BMFLog.e(e.toString(), tag: _tag);
    }
    return result;
  }

  /// 指定id删除overlay
  Future<bool> removeOverlay(
      MethodChannel _mapChannel, String overlayId) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(overlayId, "overlayId");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapRemoveOverlayMethod,
          {'id': overlayId} as dynamic)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新arcline属性
  Future<bool> updateArclineMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdateArclineMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新circle属性
  Future<bool> updateCircleMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdateCircleMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新polygon属性
  Future<bool> updatePolygonMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdatePolygonMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新polyline属性
  Future<bool> updatePolylineMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdatePolylineMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新Dot属性
  Future<bool> updateDotMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdateDotMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新Ground属性
  Future<bool> updateGroundMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdateGroundMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }

  /// 更新Text属性
  Future<bool> updateTextMember(MethodChannel _mapChannel, Map map) async {
    ArgumentError.checkNotNull(_mapChannel, "_mapChannel");
    ArgumentError.checkNotNull(map, "map");

    bool result = false;
    try {
      result = (await _mapChannel.invokeMethod(
          BMFOverlayMethodId.kMapUpdateTextMemberMethod, map)) as bool;
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return result;
  }
}
