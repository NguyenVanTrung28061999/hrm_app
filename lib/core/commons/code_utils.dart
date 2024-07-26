import 'dart:convert';
import 'dart:math';

import 'package:app_hrm/core/commons/palette.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class CodeUtils {
  static showNotification(String message) {
    return Get.defaultDialog(
        title: "notification".tr,
        radius: 5,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Palette.mainColor),
        middleText: message,
        actions: [
          const Divider(
            height: 0,
          ),
          InkWell(
            onTap: () {},
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Palette.mainColor)),
              onPressed: () {
                Get.back();
              },
              child:
                  Text("agree".tr, style: const TextStyle(color: Colors.white)),
            ),
          )
        ]);
  }

  static showNewNotification(String title, String message, callback) {
    return Get.defaultDialog(
        title: title,
        radius: 5,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Palette.mainColor),
        middleText: message,
        actions: [
          const Divider(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  callback();
                },
                child: Text("view_now".tr,
                    style: const TextStyle(color: Colors.blue)),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text("close".tr,
                    style: const TextStyle(color: Colors.black)),
              )
            ],
          )
        ]);
  }

  static showLoading() {
    BotToast.showLoading(allowClick: false);
  }

  static hideLoading() {
    BotToast.closeAllLoading();
  }

  static showSuccess(String message,
      {required List<Widget> actions, VoidCallback? closeCallBack}) {
    if (actions == null) {
      actions = [
        const Divider(
          height: 0,
        ),
        InkWell(
          onTap: () {},
          child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Palette.mainColor)),
            onPressed: () {
              if (closeCallBack != null) {
                closeCallBack();
              } else {
                Get.back();
              }
            },
            child:
                Text("close".tr, style: const TextStyle(color: Colors.white)),
          ),
        )
      ];
    }

    return Get.defaultDialog(
        title: "notification".tr,
        radius: 5,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Palette.mainColor),
        content: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(message),
            )
          ],
        ),
        actions: actions);
  }

  // static showInfoContact({List<Widget>? actions}) {
  //   actions ??= [
  //     const Divider(
  //       height: 0,
  //     ),
  //     InkWell(
  //       onTap: () {},
  //       child: TextButton(
  //         style: ButtonStyle(
  //             backgroundColor:
  //                 MaterialStateProperty.all<Color>(Palette.mainColor)),
  //         onPressed: () {
  //           Get.back();
  //         },
  //         child: Text("close".tr, style: const TextStyle(color: Colors.white)),
  //       ),
  //     )
  //   ];

  //   return Get.defaultDialog(
  //       title: ("department".tr).toUpperCase(),
  //       radius: 5,
  //       titleStyle: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           color: Palette.mainColor,
  //           fontSize: 15),
  //       titlePadding:
  //           const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
  //       content: Column(
  //         children: [
  //           const Divider(height: 1),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             children: const [
  //               SizedBox(
  //                 width: 10,
  //               ),
  //               Icon(
  //                 MdiIcons.account,
  //                 color: Palette.thirdColor,
  //               ),
  //               SizedBox(
  //                 width: 10,
  //               ),
  //               Expanded(
  //                 child: Text("Trung",
  //                     style: TextStyle(fontWeight: FontWeight.bold)),
  //               )
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               const Icon(
  //                 MdiIcons.phoneInTalk,
  //                 color: Palette.thirdColor,
  //               ),
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Expanded(
  //                 child: InkWell(
  //                   onTap: () {
  //                     makePhoneCall('tel:0333920448');
  //                   },
  //                   child: const Text("0333.920.448"),
  //                 ),
  //               )
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               const Icon(
  //                 MdiIcons.emailFastOutline,
  //                 color: Palette.thirdColor,
  //               ),
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Expanded(
  //                 child: InkWell(
  //                   onTap: () {
  //                     final Uri emailLaunchUri = Uri(
  //                       scheme: 'mailto',
  //                       path: 'em.huynh@eiu.edu.vn',
  //                       query: encodeQueryParameters(
  //                           <String, String>{'subject': 'helper'.tr}),
  //                     );

  //                     launch(emailLaunchUri.toString());
  //                   },
  //                   child: const Text("em.huynh@eiu.edu.vn"),
  //                 ),
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //       actions: actions);
  // }

  // static String encodeQueryParameters(Map<String, String> params) {
  //   return params.entries
  //       .map((e) =>
  //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
  //       .join('&');
  // }

  // static showInfoApp({List<Widget>? actions}) async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();

  //   String appName = packageInfo.appName;
  //   String packageName = packageInfo.packageName;
  //   String version = packageInfo.version;
  //   String buildNumber = packageInfo.buildNumber;
  //   if (actions == null) {
  //     actions = [
  //       const Divider(
  //         height: 0,
  //       ),
  //       InkWell(
  //         onTap: () {},
  //         child: TextButton(
  //           style: ButtonStyle(
  //               backgroundColor:
  //                   MaterialStateProperty.all<Color>(Palette.mainColor)),
  //           onPressed: () {
  //             Get.back();
  //           },
  //           child:
  //               Text("close".tr, style: const TextStyle(color: Colors.white)),
  //         ),
  //       )
  //     ];
  //   }

  //   return Get.defaultDialog(
  //       title: ("department".tr).toUpperCase(),
  //       radius: 5,
  //       titleStyle: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           color: Palette.mainColor,
  //           fontSize: 15),
  //       titlePadding:
  //           const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
  //       content: Column(
  //         children: [
  //           const Divider(height: 1),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const SizedBox(
  //                 width: 20,
  //               ),
  //               Expanded(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text("app_name".tr + " " + appName,
  //                         style: const TextStyle(fontWeight: FontWeight.bold)),
  //                     const SizedBox(
  //                       height: 10,
  //                     ),
  //                     Text("version".tr +
  //                         " " +
  //                         version +
  //                         (kDebugMode ? '.$buildNumber' : '')),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ],
  //       ),
  //       actions: actions);
  // }

  static showError(String message, {List<Widget>? actions}) {
    if (actions == null) {
      actions = [
        const Divider(
          height: 0,
        ),
        InkWell(
          onTap: () {},
          child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Palette.mainColor)),
            onPressed: () {
              Get.back();
            },
            child:
                Text("close".tr, style: const TextStyle(color: Colors.white)),
          ),
        )
      ];
    }
    return Get.defaultDialog(
        title: "notification".tr,
        radius: 5,
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Palette.mainColor,
        ),
        content: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 15,
              ),
              const Icon(
                Icons.warning,
                color: Colors.red,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(message),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        actions: actions);
  }

  static showLogout(Function onPressed) {
    return Get.defaultDialog(
        barrierDismissible: true,
        title: "notification".tr,
        radius: 5,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Palette.mainColor),
        content: Column(
          children: [Text("logout_question".tr)],
        ),
        actions: [
          const Divider(
            height: 0,
          ),
          InkWell(
            onTap: () {},
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () {
                onPressed();
              },
              child:
                  Text("yes".tr, style: const TextStyle(color: Colors.white)),
            ),
          ),
          InkWell(
            onTap: () {},
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Palette.mainColor)),
              onPressed: () {
                Get.back();
              },
              child: Text("no".tr, style: const TextStyle(color: Colors.white)),
            ),
          )
        ]);
  }

  static showConfirm({Function? onPressed, required String content}) {
    return Get.defaultDialog(
        barrierDismissible: true,
        title: "notification".tr,
        radius: 5,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Palette.mainColor),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        actions: [
          const Divider(
            height: 0,
          ),
          InkWell(
            onTap: () {},
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () {
                onPressed!();
              },
              child:
                  Text("yes".tr, style: const TextStyle(color: Colors.white)),
            ),
          ),
          InkWell(
            onTap: () {},
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Palette.mainColor)),
              onPressed: () {
                Get.back();
              },
              child: Text("no".tr, style: const TextStyle(color: Colors.white)),
            ),
          )
        ]);
  }

  static showToastWarning(String title) {
    int seconds = 2;
    bool crossPage = true;
    bool clickClose = false;
    bool ignoreContentClick = false;
    bool onlyOne = true;
    int backgroundColor = 0x00000000;
    int animationMilliseconds = 200;
    int animationReverseMilliseconds = 200;
    BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      onlyOne: onlyOne,
      clickClose: clickClose,
      crossPage: crossPage,
      ignoreContentClick: ignoreContentClick,
      backgroundColor: Color(backgroundColor),
      backButtonBehavior: backButtonBehavior,
      animationDuration: Duration(milliseconds: animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: animationReverseMilliseconds),
      toastBuilder: (_) => Align(
        alignment: const Alignment(0, 0.8),
        child: Card(
          child: Container(
            width: Get.width * 0.75,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.orange,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.warning, color: Colors.white),
                    onPressed: () {}),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static showToastSuccess(String title) {
    int seconds = 2;
    bool crossPage = true;
    bool clickClose = false;
    bool ignoreContentClick = false;
    bool onlyOne = true;
    int backgroundColor = 0x00000000;
    int animationMilliseconds = 200;
    int animationReverseMilliseconds = 200;
    BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      onlyOne: onlyOne,
      clickClose: clickClose,
      crossPage: crossPage,
      ignoreContentClick: ignoreContentClick,
      backgroundColor: Color(backgroundColor),
      backButtonBehavior: backButtonBehavior,
      animationDuration: Duration(milliseconds: animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: animationReverseMilliseconds),
      toastBuilder: (_) => Align(
        alignment: const Alignment(0, 0.8),
        child: Card(
          child: Container(
            width: Get.width * 0.75,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.green,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () {}),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static showToastError(String title) {
    int seconds = 2;
    bool crossPage = true;
    bool clickClose = false;
    bool ignoreContentClick = false;
    bool onlyOne = true;
    int backgroundColor = 0x00000000;
    int animationMilliseconds = 200;
    int animationReverseMilliseconds = 200;
    BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;

    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      onlyOne: onlyOne,
      clickClose: clickClose,
      crossPage: crossPage,
      ignoreContentClick: ignoreContentClick,
      backgroundColor: Color(backgroundColor),
      backButtonBehavior: backButtonBehavior,
      animationDuration: Duration(milliseconds: animationMilliseconds),
      animationReverseDuration:
          Duration(milliseconds: animationReverseMilliseconds),
      toastBuilder: (_) => Align(
        alignment: const Alignment(0, 0.8),
        child: Card(
          child: Container(
            width: Get.width * 0.75,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.red,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.warning, color: Colors.white),
                    onPressed: () {}),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> makeSms(String phone) async {
    String uri = "sms:${phone}";
    await launch(uri);
  }

  static Future<void> launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static void showSnackbar(message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static String encodeString(String credentials) {
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String encoded = stringToBase64Url.encode(credentials);
    return encoded;
  }

  static String decodeString(String encoded) {
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String decoded = stringToBase64Url.decode(encoded);
    return decoded;
  }

  static bool hasExtFile(String url) {
    var parts = url.split('/');
    var last = parts.last;
    return (parts.length > 3) && (last.indexOf('.') != -1);
  }

  static bool isFileDownload(String url) {
    url = url.toLowerCase();
    if (url.contains("blank.gif")) {
      return false;
    }
    final alphanumeric = RegExp(
        "[^\\s]+(.*?)\\.(jpg|jpeg|png|gif|mp3|mp4|xls|xlsx|ppt|pptx|doc|docx|pdf|txt|zip|rar)");
    return alphanumeric.hasMatch(url); // true
  }

  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );

  static Widget renderLabelField(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(166, 133, 86, 1),
          borderRadius: BorderRadius.circular(3)),
      child: Text(label.tr,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Palette.white)),
    );
  }

  static Widget renderRequiredLabel(String label) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(166, 133, 86, 1),
              borderRadius: BorderRadius.circular(3)),
          child: Text(label.tr,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Palette.white)),
        ),
        const SizedBox(width: 2),
        const Text("*",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red)),
      ],
    );
  }

  static InputDecoration renderInputDecoration({
    String? hintText,
    String? labelText,
    Color? fillColor,
    Widget? suffixIcon,
    EdgeInsets padding = const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
    OutlineInputBorder border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
  }) {
    return InputDecoration(
        fillColor: fillColor ?? Colors.white,
        filled: true,
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        contentPadding: padding,
        border: border,
        errorStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
  }

  static showDialogWithContinue(
      {required VoidCallback onPressed, required String content}) {
    return Get.defaultDialog(
        barrierDismissible: true,
        title: "notification".tr,
        radius: 5,
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Palette.mainColor),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                content,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        actions: [
          const Divider(
            height: 0,
          ),
          InkWell(
            onTap: () {},
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Palette.mainColor)),
              onPressed: onPressed,
              child: Text("tiep_tuc".tr,
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ]);
  }
}
