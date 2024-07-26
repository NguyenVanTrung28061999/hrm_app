import 'package:get/get.dart';
import 'package:timeago/src/messages/lookupmessages.dart';

/// Vietnamese messages
class ViCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'before'.tr;
  @override
  String suffixFromNow() => 'from_now'.tr;
  @override
  String lessThanOneMinute(int seconds) => 'a_minute'.tr;
  @override
  String aboutAMinute(int minutes) => 'about_minute'.tr;
  @override
  String minutes(int minutes) => '$minutes ' + 'minute'.tr;
  @override
  String aboutAnHour(int minutes) => 'about_hour'.tr;
  @override
  String hours(int hours) => '$hours ' + 'hour'.tr;
  @override
  String aDay(int hours) => 'a_day'.tr;
  @override
  String days(int days) => '$days ' + 'day_ago'.tr;
  @override
  String aboutAMonth(int days) => 'about_month'.tr;
  @override
  String months(int months) => '$months ' + 'month'.tr;
  @override
  String aboutAYear(int year) => 'about_year'.tr;
  @override
  String years(int years) => '$years ' + 'year'.tr;
  @override
  String wordSeparator() => ' ';
}

