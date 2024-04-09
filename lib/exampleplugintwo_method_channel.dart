import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'exampleplugintwo_platform_interface.dart';

/// An implementation of [ExampleplugintwoPlatform] that uses method channels.
class MethodChannelExampleplugintwo extends ExampleplugintwoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('exampleplugintwo');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> openPage(String pageName) async {
    final version = await methodChannel.invokeMethod<String>('openPage',pageName);
    return version!;
  }
}
