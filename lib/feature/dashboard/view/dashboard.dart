import 'package:coffeharvest/feature/dashboard/controller/dashboardController.dart';
import 'package:coffeharvest/feature/widgets/appBar.dart';
import 'package:coffeharvest/feature/widgets/reportCard.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          SizedBox(height: 0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {
                    dashboardController.loadData("");
                  },
                  child: Text(
                    "DASHBOARD",
                    style:
                        TextStyle(color: CustomColors.CoffeBrown, fontSize: 18),
                  ),
                ),
                trailing: FlatButton.icon(
                  label: Text("Filter"),
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    showMonthPicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 1, 4),
                      lastDate: DateTime(DateTime.now().year + 1, 9),
                      initialDate: DateTime(DateTime.now().year, 4),
                      locale: Locale("en"),
                    ).then((date) {
                      dashboardController.filter(date.toString());
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              padding: EdgeInsets.only(left: 10, right: 10),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: [
                Obx(() => reportCard(
                    "Farmers", dashboardController.farmers, Colors.blue)),
                Obx(() => reportCard(
                    "Harvest", dashboardController.harvest, Colors.green)),
                Obx(() => reportCard("Payments", dashboardController.payments,
                    Colors.deepOrange)),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
