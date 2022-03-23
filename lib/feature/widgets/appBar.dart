import 'package:coffeharvest/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text(
        "KawaYacu App",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 1,
      backgroundColor: Colors.green,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

Widget appDrawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('data');
            },
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
            ),
          )
        ],
      ),
    ),
  );
}
