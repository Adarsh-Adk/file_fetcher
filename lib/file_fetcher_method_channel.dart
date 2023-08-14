import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'file_fetcher_platform_interface.dart';

/// An implementation of [FileFetcherPlatform] that uses method channels.
class MethodChannelFileFetcher extends FileFetcherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('file_fetcher');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
