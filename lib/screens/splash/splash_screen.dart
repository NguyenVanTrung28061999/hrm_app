import 'package:app_hrm/core/commons/palette.dart';
import 'package:app_hrm/screens/login/login_screen.dart';
import 'package:app_hrm/screens/widgets/button_custom.dart';
import 'package:app_hrm/screens/widgets/text_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.manage_accounts,
                  size: 31,
                  color: Palette.bgMainColor,
                ),
                TextCustom.bold(
                  'TSAV HRM',
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Palette.bgMainColor,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    width: 298,
                    height: 306,
                    child: Image.asset('assets/images/icons/dodosbg.png')),
                // const SizedBox(
                //   height: 351,
                // )
                Container(
                  height: 351,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Palette.bgMainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 36,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustom.bold(
                            'Welcome!',
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 286,
                            child: TextCustom.medium(
                              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                              fontSize: 14,
                              maxLines: 4,
                            ),
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                          ButtonCustom(
                            width: 325,
                            height: 59,
                            color: Palette.mainColor,
                            child: TextCustom.bold(
                              'Sign In',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Palette.bgMainColor,
                            ),
                            onTap: () => Get.toNamed(LoginScreen.routeName),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
