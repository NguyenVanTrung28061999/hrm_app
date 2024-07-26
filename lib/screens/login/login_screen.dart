import 'package:app_hrm/core/commons/palette.dart';
import 'package:app_hrm/screens/home_screen.dart';
import 'package:app_hrm/screens/widgets/button_custom.dart';
import 'package:app_hrm/screens/widgets/input_custom_field.dart';
import 'package:app_hrm/screens/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgMainColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            // Icon
            Center(
              child: SizedBox(
                  width: 298,
                  height: 306,
                  child: Image.asset('assets/images/icons/dodosbg.png')),
            ),
            // Label
            TextCustom.bold(
              'Login',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            TextCustom.regular(
              'Hello,there login to countinue',
              fontSize: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            // Form login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InputCustomField(
                icon: Icons.person_2,
                label: 'Username',
                placeholder: 'Enter your username',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InputCustomField(
                icon: Icons.lock,
                label: 'Password',
                placeholder: 'Enter your password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      TextCustom.regular('Remember Me')
                    ],
                  ),
                  TextCustom.semiBold(
                    'Forget Password?',
                    fontSize: 15,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ButtonCustom(
                width: double.infinity,
                height: 47,
                color: Palette.mainColor,
                child: TextCustom.bold(
                  'Login',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Palette.bgMainColor,
                ),
                onTap: () => Get.toNamed(HomeScreen.routeName),
              ),
            )
          ],
        ),
      ),
    );
  }
}
