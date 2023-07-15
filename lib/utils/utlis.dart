import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Utils {
  static void FieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        margin: EdgeInsets.all(8),
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeOut,
        borderRadius: BorderRadius.circular(8),
        //flushbarPosition: FlushbarPosition.TOP,
        title: message == 'Successful' ? 'Successful' : "Error",
        message: message,
        icon: Icon(
          message == 'Successful' ? Icons.check : Icons.warning,
          size: 28.0,
          color: message == 'Successful' ? Colors.blue[300] : Colors.red[300],
        ),
        leftBarIndicatorColor:
            message == 'Successful' ? Colors.blue[300] : Colors.red[300],

        duration: Duration(seconds: 3),
      )..show(context),
    );
  }

  static void snackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        animation: CurvedAnimation(
          parent: AnimationController(
            vsync: context.findAncestorStateOfType<TickerProviderStateMixin>()!,
            duration: Duration(milliseconds: 500),
          ),
          curve: Curves.easeOut,
        ),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        closeIconColor: Colors.white,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        duration: Duration(seconds: 3),
      ),
    );
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }



  static String averageRating(List<int> rating) {
    var averageRating = 0;

    for (int i = 0; i < rating.length; i++) {
      averageRating += rating[i];
    }

    return (averageRating / rating.length).toStringAsFixed(1);
  }

  // static Widget getStarRatingWidget(List<int> ratings) {
  //   String averageRating = Utils.averageRating(ratings);
  //   double ratingValue = double.parse(averageRating);
  //
  //   int fullStars = ratingValue.floor();
  //   bool hasHalfStar = (ratingValue - fullStars) >= 0.5;
  //
  //   List<Widget> starWidgets = [];
  //
  //   for (int i = 0; i < 5; i++) {
  //     if (i < fullStars) {
  //       // Add filled star icon
  //       starWidgets.add(Icon(Icons.star, color: Colors.yellow));
  //     } else if (hasHalfStar && i == fullStars) {
  //       // Add half-filled star icon
  //       starWidgets.add(Icon(Icons.star_half, color: Colors.yellow));
  //     } else {
  //       // Add unfilled star icon
  //       starWidgets.add(Icon(Icons.star_border, color: Colors.yellow));
  //     }
  //   }
  //
  //   return Row(children: starWidgets);
  // }
  // static Widget getStarRatingWidget(List<int> ratings) {
  //   String averageRating = Utils.averageRating(ratings);
  //   double ratingValue = double.parse(averageRating);
  //
  //   int fullStars = ratingValue.floor();
  //   double opacity = ratingValue - fullStars;
  //
  //   return Row(
  //     children: [
  //       for (int i = 0; i < 5; i++)
  //         Icon(
  //           Icons.star,
  //           color: Colors.yellow.withOpacity(i < fullStars ? 1.0 : opacity),
  //         ),
  //     ],
  //   );
  // }

  static Widget getStarRatingWidget(List<int> ratings) {
    String averageRating = Utils.averageRating(ratings);
    double ratingValue = double.parse(averageRating);
    return RatingBar.builder(
      ignoreGestures: true,
      updateOnDrag: false,
      initialRating: ratingValue,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 7,
      itemSize: 20,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }


}


class ReuseableRow extends StatelessWidget {

  String name, value;
  ReuseableRow({super.key, this.name = "", required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}