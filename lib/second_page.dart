import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  static const String routeName = '/second';

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Test native view"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.green
          ),
          child: Column(
            children: <Widget>[
              const Text(
                'Hello world',
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.yellow
                ),
                child: _getNativeView(),
              ),

              Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.blue
                ),
                child: _getNativeView2(),
              ),
              const Text(
                'Hello world',
              ),
              const Text(
                'Hello world',
              ),
              const Text(
                'Hello world',
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget _getNativeView() {
    Widget platformMapView;
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        platformMapView = AndroidView(
          viewType: 'test_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
        break;
      case TargetPlatform.iOS:
        platformMapView = Container();
        break;
      default:
        throw UnsupportedError('Unsupported Platform');
    }
    return platformMapView;
  }

  Widget _getNativeView2() {
    Widget platformMapView;
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        platformMapView = AndroidView(
          viewType: 'test_view_2',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
        break;
      case TargetPlatform.iOS:
        platformMapView = Container();
        break;
      default:
        throw UnsupportedError('Unsupported Platform');
    }
    return platformMapView;
  }


  void _onPlatformViewCreated(int id) {
    debugPrint('view is created');
  }
}