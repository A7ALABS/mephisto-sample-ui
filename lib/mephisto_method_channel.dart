import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mephisto_platform_interface.dart';

/// An implementation of [MephistoPlatform] that uses method channels.
class MethodChannelMephisto extends MephistoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mephisto');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
