import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'file_fetcher_method_channel.dart';

abstract class FileFetcherPlatform extends PlatformInterface {
  /// Constructs a FileFetcherPlatform.
  FileFetcherPlatform() : super(token: _token);

  static final Object _token = Object();

  static FileFetcherPlatform _instance = MethodChannelFileFetcher();

  /// The default instance of [FileFetcherPlatform] to use.
  ///
  /// Defaults to [MethodChannelFileFetcher].
  static FileFetcherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FileFetcherPlatform] when
  /// they register themselves.
  static set instance(FileFetcherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
