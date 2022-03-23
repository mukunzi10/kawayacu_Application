import 'package:coffeharvest/helpers/colors.dart';
import 'package:flutter/material.dart';

Widget reportCard(title, value, color) {
  return Card(
    elevation: 2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$title",
          style: TextStyle(fontSize: 18, color: CustomColors.CoffeBrown),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircleAvatar(
            child: Text(
              "$value",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: color,
            radius: 40,
          ),
        )
      ],
    ),
  );
}
