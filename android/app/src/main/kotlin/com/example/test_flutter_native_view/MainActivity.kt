package com.example.test_flutter_native_view

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import android.content.Context
import android.content.Intent

class MainActivity: FlutterFragmentActivity() {
//    private var newFlutterEngine: FlutterEngine? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        if (!FlutterEngineCache.getInstance().contains("Hihi")) {
//            initFlutterEngine()
//        } else {
//            newFlutterEngine =
//                FlutterEngineCache.getInstance().get("Hihi")
//        }
//        initFlutterBridge()
    }

//    private fun initFlutterEngine() {
//        newFlutterEngine = FlutterEngine(this)
//        newFlutterEngine?.dartExecutor?.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
//        FlutterEngineCache.getInstance()
//            .put("Hihi", newFlutterEngine)
//
//        newFlutterEngine
//            ?.platformViewsController
//            ?.registry
//            ?.registerViewFactory("test_view", NativeViewFactory())
//
//        newFlutterEngine
//            ?.platformViewsController
//            ?.registry
//            ?.registerViewFactory("test_view_2", NativeViewFactory())
//    }
//
//    private fun initFlutterBridge() {
//        startActivity(
//            FlutterFragmentActivity
//                .withCachedEngine("Hihi")
//                .build(this)
//                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
//        )
//        finish()
//    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("test_view", NativeViewFactory())

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("test_view_2", NativeViewFactory())
    }
}
