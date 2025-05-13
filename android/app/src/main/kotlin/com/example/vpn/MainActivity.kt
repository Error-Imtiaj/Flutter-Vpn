package com.example.vpn

import android.content.Intent
import id.laskarmedia.openvpn_flutter.OpenVPNFlutterPlugin
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == 24 && resultCode == RESULT_OK) {
            OpenVPNFlutterPlugin.connectWhileGranted(true)
        }
        super.onActivityResult(requestCode, resultCode, data)
    }
}
