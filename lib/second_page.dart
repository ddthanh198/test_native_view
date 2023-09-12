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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              _getMapView(),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget _getMapView() {
    debugPrint('ddLogGoogleMap build');
    Widget platformMapView;
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      // platformMapView = AndroidView(
      //   viewType: 'odrdMapView',
      //   onPlatformViewCreated: _onPlatformViewCreated,
      // );
        platformMapView = PlatformViewLink(
          viewType: 'odrdMapView',
          surfaceFactory: (context, controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <
                  Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (params) {
            debugPrint('ddLogGoogleMap _ODRDTrackingWidgetState _getMapView: onCreatePlatformView ');
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: 'odrdMapView',
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true);
              },
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..addOnPlatformViewCreatedListener(_onPlatformViewCreated)
              ..create();
          },
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
    debugPrint('ddLogGoogleMap Map view is created');
  }
}