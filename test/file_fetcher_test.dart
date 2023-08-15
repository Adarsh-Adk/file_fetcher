import 'package:file_fetcher/file_fetcher.dart';
import 'package:file_fetcher/src/file_fetcher_method_channel.dart';
import 'package:file_fetcher/src/file_fetcher_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFileFetcherPlatform
    with MockPlatformInterfaceMixin
    implements FileFetcherPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FileFetcherPlatform initialPlatform = FileFetcherPlatform.instance;

  test('$MethodChannelFileFetcher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFileFetcher>());
  });

  test('getPlatformVersion', () async {
    FileFetcher fileFetcherPlugin = FileFetcher();
    MockFileFetcherPlatform fakePlatform = MockFileFetcherPlatform();
    FileFetcherPlatform.instance = fakePlatform;

    expect(await fileFetcherPlugin.getPlatformVersion(), '42');
  });
}
