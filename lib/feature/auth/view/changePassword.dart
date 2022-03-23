import 'package:coffeharvest/feature/auth/controller/loginController.dart';
import 'package:coffeharvest/helpers/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    loginController.back();
                  },
                  child: ListTile(
                    leading: Icon(Icons.arrow_back),
                    title: Text("Back"),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Center(
                    child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/kawayacuLogo.jpg')),
                  ),
                ),
                Text(
                  "Change Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => Text(
                      " ${loginController.phoneError}",
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Material(
                    elevation: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onChanged: loginController.setPass,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: " Password", border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Material(
                    elevation: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onChanged: loginController.setConfirmPass,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: " Confirm Password",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Obx(
                    () => Text(
                      " ${loginController.passwordError}",
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                      child: Obx(() => loginController.submitting.value
                          ? SpinKitCircle(
                              size: 30,
                              color: CustomColors.CoffeBrown,
                            )
                          : Text(""))),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 60, right: 80),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.transparent,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      loginController.change();
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
