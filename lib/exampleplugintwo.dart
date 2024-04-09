
import 'exampleplugintwo_platform_interface.dart';

class Exampleplugintwo {

  Future<String?> getPlatformVersion() {
    return ExampleplugintwoPlatform.instance.getPlatformVersion();
  }

   Future<String> openPage(String pageName) async {
    final String result =  await ExampleplugintwoPlatform.instance.openPage(pageName);
    return result;
  }
}
