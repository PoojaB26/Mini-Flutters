package com.poojab26.nativechannels;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

/**
 * Created by poojab26 on 24-Jul-18.
 */
public class TestActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate ( savedInstanceState );
        setContentView ( R.layout.test_activity );

        Button button = findViewById ( R.id.test );
        button.setOnClickListener ( new View.OnClickListener () {
            @Override
            public void onClick(View v) {
                new MethodChannel ( getFlutterView (), MainActivity.CHANNEL )
                        .invokeMethod ( "message", "testing 123" );

            }
        } );
    }
}
