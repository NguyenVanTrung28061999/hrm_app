import 'package:app_hrm/core/commons/palette.dart';
import 'package:app_hrm/screens/widgets/text_custom.dart';
import 'package:flutter/material.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Palette.mainColor,
        title: TextCustom.bold('Welcome Trung',color: Palette.white,fontWeight: FontWeight.w600,),
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications,color: Palette.white),
                onPressed: () {
                  // Handle the notification click
                },
              ),
              // Positioned(
              //   right: 11,
              //   top: 11,
              //   child: Container(
              //     padding: EdgeInsets.all(2),
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       borderRadius: BorderRadius.circular(6),
              //     ),
              //     constraints: BoxConstraints(
              //       minWidth: 14,
              //       minHeight: 14,
              //     ),
              //     child: Text(
              //       '1',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 8,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
