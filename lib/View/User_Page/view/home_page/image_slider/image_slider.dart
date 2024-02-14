import 'package:auton/View/User_Page/view/home_page/image_slider/custom_carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ServiceImageSlider extends StatelessWidget {
  ServiceImageSlider({
    super.key,
  });

  final List<String> imagePaths = [
    "https://images.pexels.com/photos/3354648/pexels-photo-3354648.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2244746/pexels-photo-2244746.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/4481944/pexels-photo-4481944.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/8556051/pexels-photo-8556051.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/6130/cold-car-bmw-e46.jpg?auto=compress&cs=tinysrgb&w=600",
  ];

  final List<String> imageDescriptions = [
    'Car Wash',
    'Tyre Services',
    'Engine Failure',
    'Battery Services',
    'AC Services',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagePaths.length,
      options: CarouselOptions(
        autoPlay: true,
        height: 235.sp,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 1),
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return CustomCarouselItem(
          imageDescription: imageDescriptions[index],
          imageUrl: imagePaths[index],
        );
      },
    );
  }
}
