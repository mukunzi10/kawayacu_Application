import 'package:coffeharvest/feature/auth/controller/loginController.dart';
import 'package:coffeharvest/helpers/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue[200],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
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
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30,
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
                        onChanged: loginController.setPhone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: " Phone", border: InputBorder.none),
                      ),
                    ),
                  ),
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
                        onChanged: loginController.setPassword,
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
                  child: Obx(
                    () => Text(
                      " ${loginController.passwordError}",
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                      child: Obx(() => loginController.submitting.value
                          ? SpinKitCircle(
                              size: 30,
                              color: Colors.white,
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
                      loginController.validation();
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Sign in",
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
