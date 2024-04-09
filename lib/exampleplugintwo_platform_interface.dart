import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'exampleplugintwo_method_channel.dart';

abstract class ExampleplugintwoPlatform extends PlatformInterface {
  /// Constructs a ExampleplugintwoPlatform.
  ExampleplugintwoPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExampleplugintwoPlatform _instance = MethodChannelExampleplugintwo();

  /// The default instance of [ExampleplugintwoPlatform] to use.
  ///
  /// Defaults to [MethodChannelExampleplugintwo].
  static ExampleplugintwoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExampleplugintwoPlatform] when
  /// they register themselves.
  static set instance(ExampleplugintwoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> openPage(String pageName) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
