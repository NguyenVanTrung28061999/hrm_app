import 'package:flutter/material.dart';

class TextCustom extends Text {
  const TextCustom._(
    super.data, {
    super.key,
    super.maxLines = 1,
    super.style,
    super.textAlign = TextAlign.start,
    super.textDirection = TextDirection.ltr,
    super.softWrap = true,
  }) : super(
          overflow:
              maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
        );

  factory TextCustom(
    String? data, {
    Key? key,
    int? maxLines = 1,
    TextStyle? style,
    TextAlign? textAlign = TextAlign.start,
    TextDirection? textDirection = TextDirection.ltr,
    bool? softWrap = true,
  }) {
    String text = data ?? '';
    return TextCustom._(
      text,
      key: key,
      maxLines: maxLines,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
    );
  }

  const TextCustom.rich(
    super.textSpan, {
    super.key,
    super.maxLines = 1,
    super.style,
    super.textAlign = TextAlign.start,
    super.textDirection = TextDirection.ltr,
    super.softWrap = true,
  }) : super.rich(
          overflow:
              maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
        );

  factory TextCustom.bold(String? data,
          {String? messageDefault,
          Key? key,
          int? maxLines = 1,
          Color? color,
          FontWeight? fontWeight,
          TextAlign? textAlign = TextAlign.start,
          bool? softWrap = true,
          double? fontSize}) =>
      TextCustom(
        data,
        key: key,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamilyFallback: const ["ProximaSoft", "ProximaSoft-Bold"]),
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
      );

  factory TextCustom.extraBold(String? data,
          {String? messageDefault,
          Key? key,
          int? maxLines = 1,
          Color? color,
          FontWeight? fontWeight,
          TextDecoration? decoration,
          FontStyle? fontStyle,
          TextAlign? textAlign = TextAlign.start,
          bool? softWrap = true,
          double? fontSize}) =>
      TextCustom(
        data,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
            fontStyle: fontStyle,
            fontFamilyFallback: const ["ProximaSoft", "ProximaSoft-ExtraBold"],
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
      );

  factory TextCustom.medium(String? data,
          {String? messageDefault,
          Key? key,
          int? maxLines = 1,
          Color? color,
          FontWeight? fontWeight,
          TextDecoration? decoration,
          FontStyle? fontStyle,
          TextAlign? textAlign = TextAlign.start,
          bool? softWrap = true,
          double? fontSize}) =>
      TextCustom(
        data,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
            fontStyle: fontStyle,
            fontSize: fontSize,
            fontFamilyFallback: const ["ProximaSoft", "ProximaSoft-Medium"]),
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
      );

  factory TextCustom.regular(String? data,
          {String? messageDefault,
          Key? key,
          int? maxLines = 1,
          Color? color,
          FontWeight? fontWeight,
          TextDecoration? decoration,
          FontStyle? fontStyle,
          TextAlign? textAlign = TextAlign.start,
          bool? softWrap = true,
          double? fontSize}) =>
      TextCustom(
        data,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
            fontStyle: fontStyle,
            fontSize: fontSize,
            fontFamilyFallback: const ["ProximaSoft", "ProximaSoft-Regular"]),
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
      );

  factory TextCustom.semiBold(String? data,
          {String? messageDefault,
          Key? key,
          int? maxLines = 1,
          Color? color,
          FontWeight? fontWeight,
          TextDecoration? decoration,
          FontStyle? fontStyle,
          TextAlign? textAlign = TextAlign.start,
          bool? softWrap = true,
          double? fontSize}) =>
      TextCustom(
        data,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
            fontStyle: fontStyle,
            fontSize: fontSize,
            fontFamilyFallback: const ["ProximaSoft", "ProximaSoft-SemiBold"]),
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
      );
}
