# File_Fetcher

This is a simple flutter plugin for android to fetch audio,video and photos from internal storage using Android's MediaStore API

# Notes

Don't forget to add appropriate permissions in Manifest.
```xml
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>  
    <uses-permission android:name="android.permission.READ_MEDIA_AUDIO"/> 
    <uses-permission android:name="android.permission.READ_MEDIA_VIDEO"/>`  
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
```
Also check permission before calling methods package before using

Checkout:
[permission_handler](https://pub.dev/packages/permission_handler)

# Usage

1) Add dependency
   ```yaml
   file_fetcher:^0.0.1
    ```

2) Import package
   ```dart
   import 'package:file_fetcher/file_fetcher.dart';
   ```
3) Create instance
   ```dart
   final _fileFetcherPlugin = FileFetcher();
   ```
4) call methods

   for getting images
   ```dart
   await _fileFetcherPlugin.getAllImages();
   ```
   for getting videos
   ```dart
   await _fileFetcherPlugin.getAllVideos();
   ```
   for getting audios
   ```dart
   await _fileFetcherPlugin.getAllAudios();
   ```
5) Above methods returns `FileResult()`.
6) Check if response contains data.
   ```dart
   final fileResult= await _fileFetcherPlugin.getAllImages();  
   if(fileResult.results!=null){  
     List<File> filesList=fileResult.results!.map((e){if(e.path!=null)return File(e.path!);}).whereType<File>().toList();  
   }
   ```
7) Exceptions and errors will be returned via `fileResults.error` of type `String?`


# Config Details

Flutter version: `3.10.6`<br>
Dart version: `3.0.6`<br>
Kotlin Version:  `1.7.10`<br>
Gradle version: `7.3.1`<br>

## Dependencies
```yaml
dependencies:  
  flutter:  
    sdk: flutter  
  plugin_platform_interface: ^2.1.5  
  freezed_annotation: ^2.4.1  
  json_annotation: ^4.8.1  
  
dev_dependencies:  
  flutter_test:  
    sdk: flutter  
  flutter_lints: ^2.0.2  
  build_runner: ^2.4.6  
  freezed: ^2.4.2  
  json_serializable: ^6.7.1
```
