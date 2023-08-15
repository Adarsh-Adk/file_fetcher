package com.appsbyadarsh.file_fetcher


import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.media.ThumbnailUtils
import android.os.Build
import android.os.CancellationSignal
import android.provider.MediaStore
import android.util.Size
import androidx.core.app.ActivityCompat
import com.google.gson.Gson
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.ByteArrayOutputStream
import java.io.File


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
            result.success("Android ${Build.VERSION.RELEASE}")
        } else if (call.method == "getAllImages") {
            //val imageList = getAllImages(call.argument<String>("path")!!)
            val imageList = getAllImageFilesFromInternalStorage(context,call)

            val gson = Gson()
            val data = gson.toJson(CustomResult(imageList))

            if (imageList.isNotEmpty()) {
                result.success(data)
            } else {
                if (ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_MEDIA_IMAGES
                    ) != PackageManager.PERMISSION_GRANTED || ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_EXTERNAL_STORAGE
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    result.error(
                        "PERMISSION",
                        "Media permission not granted",
                        null
                    )
                } else {
                    result.error(
                        "UNAVAILABLE",
                        "No images available",
                        null
                    )
                }
            }
        } else if (call.method == "getAllVideos") {

            val videoList = getAllVideoFilesFromInternalStorage(context,call)
            val gson = Gson()
            val data = gson.toJson(CustomResult(videoList))
            if (videoList.isNotEmpty()) {
                result.success(data)
            } else {
                if (ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_MEDIA_VIDEO
                    ) != PackageManager.PERMISSION_GRANTED || ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_EXTERNAL_STORAGE
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    result.error(
                        "PERMISSION",
                        "Media permission not granted",
                        null
                    )
                } else {
                    result.error(
                        "UNAVAILABLE",
                        "No Videos available",
                        null
                    )
                }
            }
        } else if (call.method == "getAllAudios") {

            val audioList = getAllAudioFilesFromInternalStorage(context,call)
            val gson = Gson()
            val data = gson.toJson(CustomResult(audioList))

            if (audioList.isNotEmpty()) {
                result.success(data)
            } else {
                if (ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_MEDIA_AUDIO
                    ) != PackageManager.PERMISSION_GRANTED || ActivityCompat.checkSelfPermission(
                        context,
                        Manifest.permission.READ_EXTERNAL_STORAGE
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    result.error(
                        "PERMISSION",
                        "Media permission not granted",
                        null
                    )
                } else {
                    result.error(
                        "UNAVAILABLE",
                        "No Audio available",
                        null
                    )
                }
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


    private fun getAllAudioFilesFromInternalStorage(context: Context,call: MethodCall): List<CustomFile> {
        val audioFiles = mutableListOf<CustomFile>()
        var query:FileQuery?=null
        if(call.arguments!=null){
            if(call.arguments is String){
                val gson=Gson()
                query=gson.fromJson(call.arguments as String,FileQuery::class.java)

            }

        }

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
            MediaStore.Audio.Media.DISPLAY_NAME,
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
                val fileName=cursor.getString(6)
                val extension = fileName.substring(fileName.lastIndexOf(".") + 1)

                // Only add audio files to the list
                if (mimeType.contains("audio")) {

                   var byteArray:ByteArray?=null
                   if(query?.includeThumbNail==true){
                       if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                           val mSize =Size(query.thumbNailSize,query.thumbNailSize)
                           val ca = CancellationSignal()
                           try {
                               val bitMap = ThumbnailUtils.createAudioThumbnail(File(data),mSize,ca)
                               byteArray=convertBitmapToByteArray(bitMap)

                           }catch (e:Exception){
                               Log.e("exception","Exception while loading thumb")
                           }
                       }
                   }

                    if(!query?.extensions.isNullOrEmpty()){
                        if(query!!.extensions!!.contains(extension)){
                            val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size,byteArray,extension)
                            audioFiles.add(audioFile)
                        }
                    }else{
                        val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size,byteArray,extension)
                        audioFiles.add(audioFile)
                    }
                }
            }
            cursor.close()
        }

        return audioFiles
    }

    private fun getAllImageFilesFromInternalStorage(context: Context,call: MethodCall): List<CustomFile> {
        val audioFiles = mutableListOf<CustomFile>()
        var query:FileQuery?=null
        if(call.arguments!=null){
            if(call.arguments is String){
                val gson=Gson()
                query=gson.fromJson(call.arguments as String,FileQuery::class.java)

            }

        }

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
            MediaStore.Images.Media.SIZE,
            MediaStore.Images.Media.DISPLAY_NAME,
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
                val fileName=cursor.getString(6)
                val extension = fileName.substring(fileName.lastIndexOf(".") + 1)


                // Only add audio files to the list
                if (mimeType.contains("image")) {
                    var byteArray:ByteArray?=null
                   if(query?.includeThumbNail==true){
                       if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                           val mSize = Size(query.thumbNailSize,query.thumbNailSize)
                           val ca = CancellationSignal()

                           try {
                               val bitMap = ThumbnailUtils.createImageThumbnail(File(data),mSize,ca)
                               byteArray=convertBitmapToByteArray(bitMap)
                           }catch (e:Exception){
                               Log.e("exception","Exception while loading thumb")
                           }
                       }
                   }
                    if(!query?.extensions.isNullOrEmpty()){
                        if(query!!.extensions!!.contains(extension)){
                            val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size,byteArray,extension)
                            audioFiles.add(audioFile)
                        }
                    }else{
                        val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size,byteArray,extension)
                        audioFiles.add(audioFile)
                    }
                }
            }
            cursor.close()
        }

        return audioFiles
    }

    private fun getAllVideoFilesFromInternalStorage(context: Context,call: MethodCall): List<CustomFile> {
        var query:FileQuery?=null
        if(call.arguments!=null){
            if(call.arguments is String){
                val gson=Gson()
                query=gson.fromJson(call.arguments as String,FileQuery::class.java)

            }

        }
        val videoFiles = mutableListOf<CustomFile>()


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
            MediaStore.Video.Media.DISPLAY_NAME
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
                val fileName=cursor.getString(6)
                val extension = fileName.substring(fileName.lastIndexOf(".") + 1)


                // Only add audio files to the list
                if (mimeType.contains("video")) {
                    var byteArray:ByteArray?=null
                    if(query?.includeThumbNail==true){
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                            val mSize = Size(query.thumbNailSize,query.thumbNailSize)
                            val ca = CancellationSignal()

                            try {
                                val  bitMap = ThumbnailUtils.createVideoThumbnail(File(data),mSize,ca)
                                byteArray=convertBitmapToByteArray(bitMap)

                            }catch (e:Exception){
                                Log.e("exception","Exception while loading thumb")
                            }
                        }
                    }
                    if(!query?.extensions.isNullOrEmpty()){
                        if(query!!.extensions!!.contains(extension)){
                            val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size,byteArray,extension)
                            videoFiles.add(audioFile)
                        }
                    }else{
                        val audioFile = CustomFile(id, title, data, mimeType, dateAdded, size,byteArray,extension)
                        videoFiles.add(audioFile)
                    }

                }
            }
            cursor.close()
        }

        return videoFiles
    }

    private fun convertBitmapToByteArray(bitMap: Bitmap): ByteArray{

        val stream = ByteArrayOutputStream()
        bitMap.compress(Bitmap.CompressFormat.PNG, 90, stream)
        return stream.toByteArray()
    }


    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
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
    var size: Int,
    var bitMap: ByteArray?,
    var extension:String?
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as CustomFile

        if (id != other.id) return false
        if (name != other.name) return false
        if (path != other.path) return false
        if (mimeType != other.mimeType) return false
        if (dateAdded != other.dateAdded) return false
        if (size != other.size) return false
        if (bitMap != null) {
            if (other.bitMap == null) return false
            if (!bitMap.contentEquals(other.bitMap)) return false
        } else if (other.bitMap != null) return false
        if (extension != other.extension) return false

        return true
    }

    override fun hashCode(): Int {
        var result = id.hashCode()
        result = 31 * result + name.hashCode()
        result = 31 * result + path.hashCode()
        result = 31 * result + mimeType.hashCode()
        result = 31 * result + dateAdded
        result = 31 * result + size
        result = 31 * result + (bitMap?.contentHashCode() ?: 0)
        result = 31 * result + (extension?.hashCode() ?: 0)
        return result
    }
}

data class CustomResult(
    var results: List<CustomFile> = mutableListOf()

)

data class  FileQuery(var extensions: List<String>? = null, var includeThumbNail:Boolean =false, var thumbNailSize:Int=96)