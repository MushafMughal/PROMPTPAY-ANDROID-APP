package com.example.prompt_pay

import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.os.IBinder

class CleanupService : Service() {
    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        // We don't need this service to restart if it is killed.
        return START_NOT_STICKY
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        // This method is called when the user swipes the app away.
        val sharedPref: SharedPreferences = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val editor = sharedPref.edit()
        editor.remove("flutter.TOKEN")      // Make sure these keys match your storage keys.
        editor.remove("flutter.REFRESH_TOKEN")
        editor.apply()

        // Stop the service explicitly.
        stopSelf()

        super.onTaskRemoved(rootIntent)
    }
}
