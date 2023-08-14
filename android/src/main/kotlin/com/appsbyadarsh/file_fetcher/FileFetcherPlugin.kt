package com.appsbyadarsh.file_fetcher


import android.app.Activity
import android.content.Context
import android.provider.MediaStore
import com.google.gson.Gson
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FileFetcherPlugin */
class FileFetcherPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            "com.appsbyadarsh.filefetcher/fetchfile"
        )
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }


    override fun onMethodCall(call: MethodCall, result: Result) {


        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "getAllImages") {
            //val imageList = getAllImages(call.argument<String>("path")!!)

            val imageList = getAllImageFilesFromInternalStorage(context)

            val gson = Gson()
            val data = gson.toJson(CustomResult(imageList))

            if (imageList.isNotEmpty()) {
                result.success(data)
            } else {

                result.error(
                    "UNAVAILABLE",
                    "No images available or permission is not granted",
                    null
                )


            }
        } else if (call.method == "getAllVideos") {
            val videoList = getAllVideoFilesFromInternalStorage(context)
            val gson = Gson()
            val data = gson.toJson(CustomResult(videoList))

            if (videoList.isNotEmpty()) {
                result.success(data)
            } else {
                result.error(
                    "UNAVAILABLE",
                    "No videos available or permission is not granted",
                    null
                )
            }
        } else if (call.method == "getAllAudios") {
            val audioList = getAllAudioFilesFromInternalStorage(context)
            val gson = Gson()
            val data = gson.toJson(CustomResult(audioList))

            if (audioList.isNotEmpty()) {
                result.success(data)
            } else {
                result.error("UNAVAILABLE", "No audio available or permission is not granted", null)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun getAllAudioFilesFromInternalStorage(context: Context): List<CustomFile> {
        val audioFiles = mutableListOf<CustomFile>()

        // Get the content resolver
        val contentResolver = context.contentResolver

        // Get the URI for the media store
        val uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI

        // Get the projection
        val projection = arrayOf(
            MediaStore.Audio.Media._ID,
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.DATA,
            MediaStore.Audio.Media.MIME_TYPE,
            MediaStore.Audio.Media.DATE_ADDED,
            MediaStore.Audio.Media.SIZE,
        )

        // Query the media store
        val cursor = contentResolver.query(uri, projection, null, null, null)

        // Iterate over the cursor and add the audio files to the list

        if (cursor != null) {
            while (cursor.moveToNext()) {

                val id = cursor.getLong(0)
                val title = cursor.getString(1)
                val data = cursor.getString(2)
                val mimeType = cursor.getString(3)
                val dateAdded = cursor.getInt(4)
                val size = cursor.getInt(5)


                // Only add audio files to the list
                if (mimeType.contains("audio")) {
                    val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size)
                    audioFiles.add(audioFile)
                }
            }
            cursor.close()
        }

        return audioFiles
    }

    private fun getAllImageFilesFromInternalStorage(context: Context): List<CustomFile> {
        val audioFiles = mutableListOf<CustomFile>()

        // Get the content resolver
        val contentResolver = context.contentResolver

        // Get the URI for the media store
        val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI

        // Get the projection
        val projection = arrayOf(
            MediaStore.Images.Media._ID,
            MediaStore.Images.Media.TITLE,
            MediaStore.Images.Media.DATA,
            MediaStore.Images.Media.MIME_TYPE,
            MediaStore.Images.Media.DATE_ADDED,
            MediaStore.Images.Media.SIZE
        )

        // Query the media store
        val cursor = contentResolver.query(uri, projection, null, null, null)

        // Iterate over the cursor and add the audio files to the list

        if (cursor != null) {
            while (cursor.moveToNext()) {

                val id = cursor.getLong(0)
                val title = cursor.getString(1)
                val data = cursor.getString(2)
                val mimeType = cursor.getString(3)
                val dateAdded = cursor.getInt(4)
                val size = cursor.getInt(5)


                // Only add audio files to the list
                if (mimeType.contains("image")) {
                    val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size)
                    audioFiles.add(audioFile)
                }
            }
            cursor.close()
        }

        return audioFiles
    }

    private fun getAllVideoFilesFromInternalStorage(context: Context): List<CustomFile> {
        val audioFiles = mutableListOf<CustomFile>()

        // Get the content resolver
        val contentResolver = context.contentResolver

        // Get the URI for the media store
        val uri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI

        // Get the projection
        val projection = arrayOf(
            MediaStore.Video.Media._ID,
            MediaStore.Video.Media.TITLE,
            MediaStore.Video.Media.DATA,
            MediaStore.Video.Media.MIME_TYPE,
            MediaStore.Video.Media.DATE_ADDED,
            MediaStore.Video.Media.SIZE,
        )

        // Query the media store
        val cursor = contentResolver.query(uri, projection, null, null, null)

        // Iterate over the cursor and add the audio files to the list

        if (cursor != null) {
            while (cursor.moveToNext()) {

                val id = cursor.getLong(0)
                val title = cursor.getString(1)
                val data = cursor.getString(2)
                val mimeType = cursor.getString(3)
                val dateAdded = cursor.getInt(4)
                val size = cursor.getInt(5)


                // Only add audio files to the list
                if (mimeType.contains("video")) {
                    val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size)
                    audioFiles.add(audioFile)
                }
            }
            cursor.close()
        }

        return audioFiles
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }
}

data class CustomFile(
    var id: Long,
    var name: String,
    var path: String,
    var mimeType: String,
    var dateAdded: Int,
    var size: Int
)

data class CustomResult(
    var results: List<CustomFile> = mutableListOf()

)
