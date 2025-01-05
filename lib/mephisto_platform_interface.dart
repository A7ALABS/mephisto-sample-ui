import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mephisto_method_channel.dart';

abstract class MephistoPlatform extends PlatformInterface {
  /// Constructs a MephistoPlatform.
  MephistoPlatform() : super(token: _token);

  static final Object _token = Object();

  static MephistoPlatform _instance = MethodChannelMephisto();

  /// The default instance of [MephistoPlatform] to use.
  ///
  /// Defaults to [MethodChannelMephisto].
  static MephistoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MephistoPlatform] when
  /// they register themselves.
  static set instance(MephistoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
