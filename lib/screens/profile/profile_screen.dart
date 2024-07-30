import 'package:app_hrm/core/commons/palette.dart';
import 'package:app_hrm/screens/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextCustom.bold(
            'profile'.tr,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Column(
          children: [
            _profile(),
            SizedBox(
              height: 120,
            ),
            //menu options
            _option(Icons.menu, 'My Leavers', Icons.arrow_forward)
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 220,
          child: Image.asset(
            'assets/images/backgrounds/mylove.jpg',
            fit: BoxFit.cover,
          ),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/backgrounds/mylove.jpg'), // Thay bằng URL hình nền của bạn
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ),
        Positioned(
          bottom: -50,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                  'assets/images/backgrounds/TrungVui.jpg'), // Thay bằng URL hình đại diện của bạn
            ),
          ),
        ),
        Positioned(
          child: TextCustom.bold(
            'Trung Vui',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          bottom: -80,
        ),
        Positioned(
          child: TextCustom.extraBold(
            'Until I found you',
            fontSize: 16,
          ),
          bottom: -100,
        )
      ],
    );
  }

  Widget _option(
    IconData leftIcon,
    String title,
    final IconData rightIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Palette.bgWhiteGray,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  leftIcon,
                  color: Palette.mainColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Icon(rightIcon),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
