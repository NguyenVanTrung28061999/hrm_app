import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

extension StringExtension on Object? {
  /// Returns true if string is:
  /// - null
  /// - empty
  /// - whitespace string.
  ///
  /// Characters considered "whitespace" are listed
  bool isNullEmptyOrWhitespace() {
    if (this == null) {
      return true;
    }
    var obj = this.toString();
    return obj == null || obj.isEmpty || obj.trim().isEmpty;
  }

  String toText() {
    return this.toString().isNullEmptyOrWhitespace()
        ? "Chưa cập nhật"
        : this.toString();
  }

  String toTextEmpty() {
    if (this == null) return "";
    return this.toString().isNullEmptyOrWhitespace() ? "" : this.toString();
  }

  String right(int lengthStr, {bool isThreeDot = true}) {
    var obj = this.toString();
    if (obj.length < lengthStr) {
      return obj;
    } else {
      if (isThreeDot)
        return obj.substring(0, lengthStr) + " ...";
      else
        return obj.substring(0, lengthStr);
    }
  }

  int toInt() {
    var test = this;
    if (this == null || this == "") return 0;
    return int.parse(this.toString());
  }

  bool toBool() {
    if (this == null) {
      return false;
    }
    return this.toString() == 'true';
  }

  double toDouble() {
    return double.parse(this.toString());
  }

  DateTime toDateTime() {
    return DateTime.parse(this.toString());
  }

  DateTime toDateTimePattern(String pattern) {
    var inputFormat = DateFormat(pattern);
    var date = inputFormat.parse(this.toString());
    return date;
  }

  String toDateTimeString(String pattern, {String locate = "vi_VN"}) {
    String dateFomat = DateFormat(pattern, locate).format(this.toDateTime());
    return dateFomat;
  }

  String toDateTimeLocal(String pattern, {String locate = "vi_VN"}) {
    var timeDate = DateTime.tryParse(this.toString());
    String dateStr = timeDate.toString();
    var date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr, true);

    String time = DateFormat(pattern, locate).format(date.toLocal());
    return time;
  }

  String toPriceString() {
    if (this == null) {
      return "0";
    }
    final oCcy = NumberFormat("#,##0 đ", "vi_VN");
    return oCcy.format(this);
  }

  String toTimeAgo() {
    return timeago.format(this.toDateTime(), locale: 'vn');
  }

  Map toMap() {
    return jsonDecode(this.toString());
  }

  String removeHtmlString() {
    if (this == null) {
      return "";
    }
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return this.toString().replaceAll(exp, '');
  }

  bool isNullOrEmpty() {
    return this == null || this == "";
  }

  bool isValidEmail(String value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(value);
  }

  Color generateColorStatus(status) {
    if (status == null) {
      return Color.fromRGBO(128, 128, 128, 1);
    }

    // Remove "rgb(" and ")" from the string
    String trimmedColorString =
        status.replaceAll("rgb(", "").replaceAll(")", "");

    // Split the string by commas to get individual RGB values
    List<String> rgbValues = trimmedColorString.split(",");

    // Convert the RGB values to integers
    int red = int.parse(rgbValues[0].trim());
    int green = int.parse(rgbValues[1].trim());
    int blue = int.parse(rgbValues[2].trim());

    // Return the Color object
    return Color.fromRGBO(red, green, blue, 1.0);
  }
}

extension ContextExtension on BuildContext {
  // >>>>>>>>>> Get the width $ height of the context <<<<<<<<<<
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension DateTimeFormat on DateTime {
  // >>>>>>>>>> Get start & end time of day  <<<<<<<<<<
  DateTime startOfDay() => DateTime(year, month, day);
  DateTime endOfDay() => DateTime(year, month, day, 23, 59, 59);

  // >>>>>>>>>> Get start & end of the week <<<<<<<<<<
  /// Calculate the start of the week (Monday)
  DateTime startOfWeek() => subtract(Duration(days: weekday - 1));

  /// Calculate the end of the week (Sunday)
  DateTime endOfWeek() => add(Duration(days: 7 - weekday));

  // >>>>>>>>>> Format date <<<<<<<<<<
  String formatDate([String type = 'dd/MM/yyyy']) {
    return DateFormat(type).format(this);
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
