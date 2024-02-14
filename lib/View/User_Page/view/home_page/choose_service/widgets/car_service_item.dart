import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarServiceItem extends StatelessWidget {
  final IconData icon;
  final String serviceName;
  final String description;
  final Function()? onTap;

  CarServiceItem({
    required this.icon,
    required this.serviceName,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190.sp,
        width: 120.sp,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 30, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 48,
              color: Color.fromARGB(255, 195, 0, 0),
            ),
            SizedBox(height: 12),
            Text(
              serviceName,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
