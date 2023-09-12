package com.example.test_flutter_native_view

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class MainActivity: FlutterActivity() {
    private var newFlutterEngine: FlutterEngine? = null

    private fun initFlutterEngine() {
        newFlutterEngine = FlutterEngine(this)
        newFlutterEngine?.dartExecutor?.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
        FlutterEngineCache.getInstance()
            .put("Hihi", newFlutterEngine)

        newFlutterEngine
            ?.platformViewsController
            ?.registry
            ?.registerViewFactory("test_view", NativeViewFactory())
    }
}
