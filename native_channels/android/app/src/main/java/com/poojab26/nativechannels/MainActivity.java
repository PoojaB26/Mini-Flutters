package com.poojab26.nativechannels;


import android.os.Bundle;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.view.FlutterView;


public class MainActivity extends FlutterActivity {
  static final String CHANNEL = "flutter.rortega.com.basicchannelcommunication";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

      Log.d ( "print", "printed" );

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                FlutterView view = getFlutterView();
                if (call.method.equals("showNativeView")){
                    Intent intent = new Intent ( MainActivity.this , com.poojab26.nativechannels.TestActivity.class );
                    startActivity ( intent );
                    String message ="Life Changed";

                    result.success(message);

                    Log.d ("ACT", "calling from android");
                }
              }
            });


  }
}

