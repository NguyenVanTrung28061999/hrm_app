import 'package:app_hrm/core/commons/palette.dart';
import 'package:app_hrm/screens/widgets/text_custom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainColor,
        centerTitle: false,
        title: TextCustom.bold(
          'Welcome Trung',
          color: Palette.white,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications, color: Palette.white),
                onPressed: () {
                  // Handle the notification click
                },
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _birthDayEmployees([
            'Trung',
            'Nam',
            'An',
            'Dũng',
            'Linh',
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextCustom.bold(
              'Dashboard',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Widget _birthDayEmployees(List<String> birthdays) {
    final CarouselController _controller = CarouselController();

    return CarouselSlider.builder(
      itemCount: birthdays.length,
      carouselController: _controller,
      options: CarouselOptions(
        height: 100.0,
        autoPlay: true,
        autoPlayInterval: const Duration(milliseconds: 2000),
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.mainColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom.bold(
                      'Hôm nay',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      color: Palette.mainColor,
                    ),
                    TextCustom.bold(
                      'sinh nhật của ${birthdays[index]}',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      color: Palette.lableColor,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.cake,
                color: Colors.pink[100],
                size: 60.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
