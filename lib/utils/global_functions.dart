import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
void showToast(String value) => Fluttertoast.showToast(
    msg: value, gravity: ToastGravity.BOTTOM, fontSize: 15);


void pushName(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    PageTransition(
        duration: const Duration(milliseconds: 400),
        type: PageTransitionType.leftToRight,
        child: widget),
  );
}void pushName2(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    PageTransition(
        duration: const Duration(milliseconds: 800),
        type: PageTransitionType.rightToLeft,
        child: widget),
  );


}


String formatPostDuration(String date) {
  DateTime postDateTime =
  DateTime.parse(date); // Your post's creation time goes here
  DateTime now = DateTime.now();

  Duration difference = now.difference(postDateTime);
  if (difference.inDays >= 365) {
    final years = (difference.inDays / 365).floor();
    if (years == 1) {
      return '1 year ago';
    } else {
      return '$years years ago';
    }
  } else if (difference.inDays >= 7) {
    final weeks = (difference.inDays / 7).floor();
    if (weeks == 1) {
      return '1 week ago';
    } else {
      return '$weeks weeks ago';
    }
  } else if (difference.inDays > 0) {
    if (difference.inDays == 1) {
      return '1 day ago';
    } else {
      return '${difference.inDays} days ago';
    }
  } else if (difference.inHours > 0) {
    if (difference.inHours == 1) {
      return '1 hour ago';
    } else {
      return '${difference.inHours} hours ago';
    }
  } else if (difference.inMinutes > 0) {
    if (difference.inMinutes == 1) {
      return '1 minute ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  } else {
    return 'Just now';
  }
}