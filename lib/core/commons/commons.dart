import 'dart:io';

import 'package:app_hrm/core/commons/code_utils.dart';
import 'package:app_hrm/core/commons/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class Commons {
  // static Future<List<File>> selectMultipleFiles() async {
  //   List<File> selectedFiles = [];
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   try {
  //     if (Platform.isAndroid) {
  //       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //       if (androidInfo.version.sdkInt >= 33) {
  //         var listPathAsString = await getFilesWithAndroid13();
  //         var listPathAsFile = listPathAsString.map((e) => File(e)).toList();

  //         for (var file in listPathAsFile) {
  //           var fileNameExtension = file.path.split('.').last;
  //           if (!Commons.isSupportedFileExtension(fileNameExtension)) {
  //             CodeUtils.showToastWarning('file_not_support'.tr);
  //             continue;
  //           }

  //           if (await file.length() > 10485760) {
  //             CodeUtils.showToastWarning('file_big'.tr);
  //             continue;
  //           }

  //           var checkExist =
  //               selectedFiles.indexWhere((x) => x.path == file.path);
  //           if (checkExist < 0) {
  //             selectedFiles.add(file);
  //           }
  //         }
  //       } else {
  //         var result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //         if (result != null) {
  //           for (var file in result.files) {
  //             var fileNameExtension = file.name.split('.').last;
  //             if (!Commons.isSupportedFileExtension(fileNameExtension)) {
  //               CodeUtils.showToastWarning('file_not_support'.tr);
  //               continue;
  //             }
  //             if (file.size > 10485760) {
  //               CodeUtils.showToastWarning('file_big'.tr);
  //               continue;
  //             }
  //             var checkExist =
  //                 selectedFiles.indexWhere((x) => x.path == file.path);
  //             if (checkExist < 0) {
  //               selectedFiles.add(File(file.path as String));
  //             }
  //           }
  //         } else {
  //           // Người dùng hủy bỏ việc chọn tệp tin
  //         }
  //       }
  //     } else if (Platform.isIOS) {
  //       var result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //       if (result != null) {
  //         for (var file in result.files) {
  //           var fileNameExtension = file.name.split('.').last;
  //           if (!Commons.isSupportedFileExtension(fileNameExtension)) {
  //             CodeUtils.showToastWarning('file_not_support'.tr);
  //             continue;
  //           }
  //           if (file.size > 10485760) {
  //             CodeUtils.showToastWarning('file_big'.tr);
  //             continue;
  //           }
  //           var checkExist =
  //               selectedFiles.indexWhere((x) => x.path == file.path);
  //           if (checkExist < 0) {
  //             selectedFiles.add(File(file.path as String));
  //           }
  //         }
  //       } else {
  //         // Người dùng hủy bỏ việc chọn tệp tin
  //       }
  //     }
  //   } catch (e) {
  //     print('Error selecting files: $e');
  //     // Xử lý lỗi theo nhu cầu của bạn
  //   }

  //   return selectedFiles;
  // }

  // static Future getFilesWithAndroid13() async {
  //   return await eiuChannel.invokeMethod("getFiles");
  // }

  static Icon getFileIcon(String fileName, double size) {
    String extensionName = extension(fileName).toLowerCase();
    switch (extensionName) {
      case '.jpg':
      case '.jpeg':
      case '.png':
        return Icon(
          Icons.image,
          color: Colors.blue,
          size: size,
        );
      case '.pdf':
        return Icon(
          Icons.picture_as_pdf,
          color: Colors.red,
          size: size,
        );
      case '.xls':
      case '.xlsx':
        return Icon(
          Icons.insert_drive_file,
          color: Colors.green,
          size: size,
        );
      case '.doc':
      case '.docx':
        return Icon(
          Icons.insert_drive_file,
          color: Colors.orange,
          size: size,
        );
      case '.txt':
        return Icon(
          Icons.text_snippet,
          color: Colors.orange,
          size: size,
        );
      case '.mp3':
      case '.wav':
        return Icon(
          Icons.music_note,
          color: Colors.deepPurple,
          size: size,
        );
      case '.mp4':
      case '.avi':
        return Icon(
          Icons.video_library,
          color: Colors.deepOrange,
          size: size,
        );
      case '.zip':
      case '.rar':
        return Icon(
          Icons.archive,
          color: Colors.brown,
          size: size,
        );
      default:
        return Icon(
          Icons.insert_drive_file,
          color: Colors.grey,
          size: size,
        );
    }
  }

  static getFileIconSeeOrDownload(String fileName, double size) {
    String extensionName = extension(fileName).toLowerCase();

    switch (extensionName) {
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
        return Icon(
          Icons.visibility_outlined,
          size: size,
        );
      default:
        return Icon(
          Icons.file_download_outlined,
          size: size,
          color: Palette.mainColor,
        );
    }
  }

  static int checkFileType(String fileName) {
    String extensionName = extension(fileName).toLowerCase();

    if (extensionName == '.jpg' ||
        extensionName == '.jpeg' ||
        extensionName == '.png' ||
        extensionName == '.gif') {
      return 0;
    } else {
      return 1;
    }
  }

  static String formatLevel(int value) {
    switch (value) {
      case 1:
        return 'normal'.tr;
      case 2:
        return 'priority'.tr;
      default:
        return 'normal'.tr;
    }
  }

  static bool isSupportedFileExtension(String extension) {
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];
    const pdfExtensions = ['pdf'];
    const documentExtensions = ['doc', 'docx', 'xls', 'xlsx'];
    var lowerCaseExtension = extension.toLowerCase();

    return imageExtensions.contains(lowerCaseExtension) ||
        pdfExtensions.contains(lowerCaseExtension) ||
        documentExtensions.contains(lowerCaseExtension);
  }
}
