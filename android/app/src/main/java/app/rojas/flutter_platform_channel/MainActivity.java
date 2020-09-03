package app.rojas.flutter_platform_channel;

import android.os.Build;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private Geolocation geolocation;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        BinaryMessenger messenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        MethodChannel methodChannel = new MethodChannel(messenger, "app.rojas/flutter_platform_channel");
        this.geolocation = new Geolocation(this, flutterEngine);
        methodChannel.setMethodCallHandler((MethodCall call, MethodChannel.Result result) -> {
            if(call.method.equals("version")) {
                String name = call.argument("name");
                String lastName = call.argument("lastname");
                int age = call.argument("age");
                String version = getAndroidVersion();
                result.success(version);
            } else {
                result.notImplemented();
            }
        });
    }

    String getAndroidVersion() {
        int sdkVersion = Build.VERSION.SDK_INT;
        String release = Build.VERSION.RELEASE;
        return "Android version: " + sdkVersion + "(" + release + ")";
    }

    @Override
    protected void onDestroy() {
        this.geolocation.stop();
        super.onDestroy();
    }
}
