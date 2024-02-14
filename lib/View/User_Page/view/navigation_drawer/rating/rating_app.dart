import 'package:auton/View/User_Page/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Import the rating bar package

class StarRatingDialog extends StatefulWidget {
  @override
  _StarRatingDialogState createState() => _StarRatingDialogState();
}

class _StarRatingDialogState extends State<StarRatingDialog> {
  double _rating = 0.0; // Initial rating value

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Rate this App'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Please rate this app:'),
          SizedBox(
            height: 15,
          ),
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 40.0,
            itemBuilder: (context, int) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Here, you can handle the user's rating (i.e., save it, send it to a server, etc.)
            showToast(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ); // Close the dialog
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

void showToast(
  BuildContext context,
) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(
        "Thank You for Rating us",
        style: TextStyle(color: Colors.black),
      ),
      elevation: 1.0,
      behavior: SnackBarBehavior.fixed,
      duration: Duration(seconds: 3),
      backgroundColor: Color.fromARGB(255, 255, 186, 186),
    ),
  );
}
