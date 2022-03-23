import 'package:coffeharvest/helpers/colors.dart';
import 'package:flutter/material.dart';

Widget CustomCard(context, names, phone, quanity) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    width: MediaQuery.of(context).size.width,
    height: 70,
    color: Colors.white,
    child: Material(
      color: Colors.white,
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/coff.jpg"),
        ),
        title: Text(
          "$names",
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(" $phone"),
        ),
        trailing: Text(
          '$quanity',
          style: TextStyle(color: Colors.green),
        ),
      ),
    ),
  );
}
