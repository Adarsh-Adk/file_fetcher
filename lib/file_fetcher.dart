import 'dart:convert';

import 'package:flutter/services.dart';

import 'file_fetcher_platform_interface.dart';
import 'models/file_result.dart';

class FileFetcher {
  static const platform =
      MethodChannel('com.appsbyadarsh.filefetcher/fetchfile');

  Future<String?> getPlatformVersion() {
    return FileFetcherPlatform.instance.getPlatformVersion();
  }

  Future<FileResult> getAllImages() async {
    try {
      String result = await platform.invokeMethod('getAllImages');
      FileResult fileResult = FileResult.fromJson(jsonDecode(result));
      return fileResult;
    } catch (e) {
      return FileResult(error: "Exception while getting images :$e");
    }
  }

  Future<FileResult> getAllAudios() async {
    try {
      String result = await platform.invokeMethod('getAllAudios');
      FileResult fileResult = FileResult.fromJson(jsonDecode(result));
      return fileResult;
    } catch (e) {
      return FileResult(error: "Exception while getting images :$e");
    }
  }

  Future<FileResult> getAllVideos() async {
    try {
      String result = await platform.invokeMethod('getAllVideos');
      FileResult fileResult = FileResult.fromJson(jsonDecode(result));
      return fileResult;
    } catch (e) {
      return FileResult(error: "Exception while getting images :$e");
    }
  }
}
