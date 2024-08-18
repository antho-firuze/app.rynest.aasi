import 'package:flutter/material.dart';


// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white70,
    border: Border.all());
// BoxDecoration fieldDecortaion = BoxDecoration(
//     borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.grey[100],
    border: Border.all());
// BoxDecoration disabledFieldDecortaion = BoxDecoration(
//     borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w700, color: Colors.white);

Image imageDefaultProfile = Image.asset(
  'assets/images/im_photo_placeholder.gif',
  fit: BoxFit.cover,
);

// myAppBar(
//   String title, {
//   bool centerTitle = false,
//   bool showBack = true,
//   List<Widget> actions,
//   Color backgroundColor,
//   Color titleColor,
//   Function() onBackPressed,
// }) =>
//     AppBarMee();

