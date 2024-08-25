import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {

  static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i=0 ; i<rating.length; i++){
      avgRating = avgRating+rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),
          titleColor: Colors.white,

          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          message: message,
          backgroundColor: Colors.red,
          messageColor: Colors.white,
          icon: Icon(Icons.error_outline,size: 28,color: Colors.white),
          duration: Duration(seconds: 3),
        )..show(context));
  }
}
