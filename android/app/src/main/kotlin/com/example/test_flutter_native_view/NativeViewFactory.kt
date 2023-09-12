package com.example.test_flutter_native_view

import android.content.Context
import android.util.Log
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(
) : PlatformViewFactory(
    StandardMessageCodec.INSTANCE
) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        Log.d("ddLogGoogleMap", "NativeViewFactory.kt create: ")
        return TestNativeView(context)

    }
}