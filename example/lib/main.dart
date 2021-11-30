import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 百度地图sdk初始化鉴权
  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'yFDD3IlfSk2xTdQ0G41MjRnzd5gUVG1C', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
    // Android 目前不支持接口设置Apikey,
    // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  BMFMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: BMFMapWidget(
          onBMFMapCreated: (c) async {
            _controller = c;
            var marker = BMFWidgetMarker(
                widget: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: const Text('里程：3.5km'),
                ),
                position: BMFCoordinate(39.917702, 116.410593));
            var b = await _controller?.addWidgetMarker(marker);
            // var marker = BMFMarker(
            //     icon: 'assets/ic_xiaojiu.png',
            //     position: BMFCoordinate(39.917702, 116.410593));
            // var b = await _controller?.addMarker(marker);
            print('addmarker $b');
          },
          mapOptions: BMFMapOptions(zoomLevel: 14),
        ),
      ),
    );
  }
}
