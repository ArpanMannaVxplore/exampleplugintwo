import 'package:flutter_test/flutter_test.dart';
import 'package:exampleplugintwo/exampleplugintwo.dart';
import 'package:exampleplugintwo/exampleplugintwo_platform_interface.dart';
import 'package:exampleplugintwo/exampleplugintwo_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExampleplugintwoPlatform
    with MockPlatformInterfaceMixin
    implements ExampleplugintwoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String> openPage(String pageName) {
    // TODO: implement openPage
   return Future.value("45");
  }
}

void main() {
  final ExampleplugintwoPlatform initialPlatform = ExampleplugintwoPlatform.instance;

  test('$MethodChannelExampleplugintwo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExampleplugintwo>());
  });

  test('getPlatformVersion', () async {
    Exampleplugintwo exampleplugintwoPlugin = Exampleplugintwo();
    MockExampleplugintwoPlatform fakePlatform = MockExampleplugintwoPlatform();
    ExampleplugintwoPlatform.instance = fakePlatform;

    expect(await exampleplugintwoPlugin.getPlatformVersion(), '42');
  });
}
