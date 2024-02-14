import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyServiceList extends StatelessWidget {
  final String date;
  final String serviceType;
  final String carnum;
  final String location;
  final String status;

  MyServiceList({
    required this.date,
    required this.serviceType,
    required this.carnum,
    required this.location,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 27.sp),
      child: Container(
        padding: EdgeInsets.all(12.sp),
        height: 140.sp,
        width: 267.sp,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 212, 214, 199)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(13.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'Date: $date',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.sp),
            Text(
              'Car Number: $carnum',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 5.sp),
            Text(
              'Service Type: $serviceType',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 5.sp),
            Text(
              'Location: $location',
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 5.sp),
          ],
        ),
      ),
    );
  }
}
