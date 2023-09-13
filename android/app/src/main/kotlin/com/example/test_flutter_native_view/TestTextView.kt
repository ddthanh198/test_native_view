package com.example.test_flutter_native_view

import android.content.Context
import android.graphics.Canvas
import android.util.Log
import androidx.appcompat.widget.AppCompatTextView

class TestTextView(context : Context) : AppCompatTextView(context) {
    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)
        Log.d("dLog", "TestTextView.kt onDraw: text = $text  visibility = $visibility")
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        Log.d("dLog", "TestTextView.kt onAttachedToWindow: context = $context")
    }

    override fun onLayout(changed: Boolean, left: Int, top: Int, right: Int, bottom: Int) {
        super.onLayout(changed, left, top, right, bottom)
        Log.d("dLof", "TestTextView.kt onLayout: left = $left top = $top right = $right bottom = $bottom $text")
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
        Log.d("dLog", "TestTextView.kt onMeasure: widthMeasureSpec = $widthMeasureSpec  heightMeasureSpec = $heightMeasureSpec  text = $text")
    }


}