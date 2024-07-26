// import 'dart:convert';
// import 'dart:io';
// import 'dart:isolate';
// import 'dart:math';
// import 'dart:ui';

// import 'package:android_path_provider/android_path_provider.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:myeiu/core/commons/code_utils.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../configs/appsettings.dart';

// class DownloadFile {
//   DownloadFile() {
//     FlutterDownloader.registerCallback(downloadCallback);
//   }

//   String getRandString(int len) {
//     var random = Random.secure();
//     var values = List<int>.generate(len, (i) => random.nextInt(255));
//     return base64UrlEncode(values);
//   }

//   Future downloadFileWithFileName(String fileName, String url, String cookie,
//       {String? token, String? apiKey}) async {
//     try {
//       // final status = await Permission.storage.request();
//       // if (status.isGranted) {
//         var _localPath = (await findLocalPath());
//         final savedDir = Directory(_localPath);
//         bool hasExisted = await savedDir.exists();
//         if (!hasExisted) {
//           savedDir.create();
//         }

//         Map<String, String> headers;
//         if (cookie != "") {
//           headers = {"cookie": cookie};
//         } else if (apiKey != "" && apiKey != null) {
//           headers = {"API_KEY": apiKey.toString()};
//         } else {
//           headers = {"Authorization": "Bearer " + token!};
//         }

//         final taskId = await FlutterDownloader.enqueue(
//           headers: headers,
//           url: url
//               .toString(), // click on notification to open downloaded file (for Android)
//           savedDir: _localPath,
//           fileName: fileName,
//           saveInPublicStorage: true,
//           showNotification:
//               true, // show download progress in status bar (for Android)
//           openFileFromNotification: true,
//         );

//         // >>>>>>>>>> Download waiting <<<<<<<<<<

//         bool waitTask = true;
//         while (waitTask) {
//           String query = "SELECT * FROM task WHERE task_id='" + taskId! + "'";
//           var _tasks =
//               await FlutterDownloader.loadTasksWithRawQuery(query: query);
//           String taskStatus = _tasks![0].status.toString();
//           int taskProgress = _tasks[0].progress;
//           if (taskStatus == "DownloadTaskStatus(4)") {
//             waitTask = false;
//             CodeUtils.showToastWarning("error_system".tr);
//           }
//           if ((taskProgress == -1) ||
//               (taskStatus == "DownloadTaskStatus(3)" && taskProgress == 100)) {
//             if (taskProgress == -1) {
//               CodeUtils.showToastWarning(
//                   "Không tìm thấy File, Vui lòng thử lại");
//             }
//             waitTask = false;
//           }
//         }

//         if (taskId != null) {
//           OpenFile.open(_localPath + "/$fileName");
//         }
//         // await FlutterDownloader.open(taskId: taskId!);
//       // } else {
//         // CodeUtils.showToastWarning(
//         //     "Vui lòng mở quyền truy cập vào bộ nhớ nếu bạn muốn tải tài liệu về máy");
//       // }
//     } catch (e) {
//       print('🚀 >>>>>>>>>> e: $e');
//       CodeUtils.showToastWarning("error_system".tr);
//     }
//   }

//   Future downloadFileWithCookie(String urlFile, String cookie) async {
//     CodeUtils.showLoading();
//     String fileName = urlFile.split("/").last;
//     fileName = getRandString(6) + "_" + fileName;
//     await downloadFileWithFileName(fileName, urlFile, cookie);
//     CodeUtils.hideLoading();
//   }

//   Future downloadFileWithToken(String urlFile) async {
//     CodeUtils.showLoading();
//     String fileName = urlFile.split("/").last;

//     fileName = getRandString(6) + "_" + fileName;

//     final box = GetStorage();
//     await downloadFileWithFileName(fileName, urlFile, "",
//         token: box.read("token"));
//     CodeUtils.hideLoading();
//   }

//   Future downloadFileWithApiKey(String urlFile) async {
//     CodeUtils.showLoading();
//     String fileName = urlFile.split("/").last;

//     fileName = getRandString(6) + "_" + fileName;

//     await downloadFileWithFileName(fileName, urlFile, "",
//         apiKey: AppSettings.api_key);
//     CodeUtils.hideLoading();
//   }

//   Future<String> findLocalPath() async {
//     var externalStorageDirPath;
//     if (Platform.isAndroid) {
//       try {
//         externalStorageDirPath = await AndroidPathProvider.downloadsPath;
//       } catch (e) {
//         final directory = await getExternalStorageDirectory();
//         externalStorageDirPath = directory?.path;
//       }
//     } else if (Platform.isIOS) {
//       var directory = await getApplicationDocumentsDirectory();
//       externalStorageDirPath = directory.path + Platform.pathSeparator;
//     }
//     return externalStorageDirPath;
//   }

//   @pragma('vm:entry-point') // Don't delete this line
//   static void downloadCallback(
//       String id, DownloadTaskStatus status, int progress) {
//     final SendPort? send =
//         IsolateNameServer.lookupPortByName('downloader_send_port');
//     send?.send([id, status, progress]);
//   }

//   void unbindBackgroundIsolate() {
//     IsolateNameServer.removePortNameMapping('downloader_send_port');
//   }
// }
