import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor primarySwatch = const MaterialColor(
    0xff144069, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff144069), //10%
      100: const Color(0xff144069), //20%
      200: const Color(0xff144069), //30%
      300: const Color(0xff144069), //40%
      400: const Color(0xff144069), //50%
      500: const Color(0xff144069), //60%
      600: const Color(0xff144069), //70%
      700: const Color(0xff144069), //80%
      800: const Color(0xff144069), //90%
      900: const Color(0xff144069), //100%
    },
  );

  static const MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  static const Color mainColor = Color.fromRGBO(4, 102, 164, 1);
  static const Color bgMainColor = Colors.white;
  static const Color titleColor = Color(0xff4e4e50);
  static const Color lableColor = Color(0xff707070);
  static const Color secondaryColor = Color(0xfff35800);
  static const Color thirdColor = Color(0xff707070);
  static const Color scaffold = Colors.white;
  static const Color bgWhiteGray = Color(0xFFF0F2F5);
  static const Color goldColor = Color(0xffa78656);
  static const Color headStickyColor = Color(0xFFBAD5E4);

  static const Color approvedColor = Color(0xFF56F35F);
  static const Color waitApproveColor = Color(0xFFfec53a);
  static const Color cancelColor = Color(0xFF6C757C);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 240, 117, 35),
      Color.fromARGB(255, 179, 1, 179)
    ],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
