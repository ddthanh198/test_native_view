package com.example.test_flutter_native_view

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class TestNativeView(private val context: Context?,) : PlatformView {
    override fun getView(): View {
        return TestTextView(context!!).apply {
            this.textSize = 72f
            this.setBackgroundColor(Color.rgb(255, 255, 255))
            this.text = "Rendered on a native Android view (id: $id)"
        }
    }

    override fun dispose() {
        TODO("Not yet implemented")
    }
}
