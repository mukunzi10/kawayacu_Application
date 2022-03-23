import 'package:coffeharvest/feature/dashboard/view/dashboard.dart';
import 'package:coffeharvest/feature/farmer/farmers/view/famers.dart';
import 'package:coffeharvest/feature/harvest/harvests/view/harvest.dart';
import 'package:coffeharvest/feature/homepage/controller/homepageController.dart';
import 'package:coffeharvest/feature/payments/payments/view/payments.dart';
import 'package:coffeharvest/feature/widgets/appBar.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final homepageController = Get.find<HomePageController>();

    return GetBuilder<HomePageController>(builder: (controller) {
      return Scaffold(
        appBar: CustomAppBar(),
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.green,
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/kawayacuLogo.jpg'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/change');
                  },
                  child: ListTile(
                    leading: Icon(Icons.lock),
                    title: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: homepageController.currentIndex,
          children: [Dashboard(), Harvest(), Famers(), Payments()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            currentIndex: homepageController.currentIndex,
            selectedItemColor: CustomColors.CoffeBrown,
            unselectedItemColor: Colors.blue,
            showUnselectedLabels: true,
            onTap: (index) {
              index > 3
                  ? homepageController.callLogout()
                  : homepageController.setCurrentIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.coffee), label: "Harvest"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Farmer"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money), label: "Payments"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Logout"),
            ]),
      );
    });
  }
}
