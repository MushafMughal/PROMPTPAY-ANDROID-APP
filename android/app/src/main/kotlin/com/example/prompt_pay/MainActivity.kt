package com.example.prompt_pay

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)
        // Start the cleanup service to monitor app removal.
        startService(Intent(this, CleanupService::class.java))
    }
}
