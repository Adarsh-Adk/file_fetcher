import 'dart:convert';

import 'package:flutter/services.dart';

import 'file_fetcher_platform_interface.dart';
import 'models/file_query.dart';
import 'models/file_result.dart';

class FileFetcher {
  static const platform =
      MethodChannel('com.appsbyadarsh.filefetcher/fetchfile');

  Future<String?> getPlatformVersion() {
    return FileFetcherPlatform.instance.getPlatformVersion();
  }

  ///returns list of all images
  Future<FileResult> getAllImages({FileQuery? fileQuery}) async {
    try {
      String result = await platform.invokeMethod('getAllImages',
          jsonEncode(fileQuery?.toJson() ?? const FileQuery().toJson()));
      FileResult fileResult = FileResult.fromJson(jsonDecode(result));
      return fileResult;
    } catch (e) {
      return FileResult(error: "Exception while getting images :$e");
    }
  }

  ///returns list of all audios
  Future<FileResult> getAllAudios({FileQuery? fileQuery}) async {
    try {
      String result = await platform.invokeMethod('getAllAudios',
          jsonEncode(fileQuery?.toJson() ?? const FileQuery().toJson()));
      FileResult fileResult = FileResult.fromJson(jsonDecode(result));
      return fileResult;
    } catch (e) {
      return FileResult(error: "Exception while getting images :$e");
    }
  }

  ///returns list of all videos
  Future<FileResult> getAllVideos({FileQuery? fileQuery}) async {
    try {
      String result = await platform.invokeMethod('getAllVideos',
          jsonEncode(fileQuery?.toJson() ?? const FileQuery().toJson()));
      FileResult fileResult = FileResult.fromJson(jsonDecode(result));
      return fileResult;
    } catch (e) {
      return FileResult(error: "Exception while getting images :$e");
    }
  }
}
