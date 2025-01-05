import 'mephisto_platform_interface.dart';

class Mephisto {
  Future<String?> getPlatformVersion() {
    return MephistoPlatform.instance.getPlatformVersion();
  }
}
