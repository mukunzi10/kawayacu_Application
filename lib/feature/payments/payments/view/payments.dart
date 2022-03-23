import 'package:coffeharvest/feature/harvest/harvests/controller/harvestController.dart';
import 'package:coffeharvest/feature/payments/payments/controller/paymentsController.dart';
import 'package:coffeharvest/feature/widgets/customCard.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class Payments extends StatelessWidget {
  Widget build(BuildContext context) {
    final paymentController = Get.find<PaymentsController>();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          SizedBox(height: 0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: ListTile(
                leading: Text(
                  "Payments",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
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
            height: 60,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 2, top: 2),
              child: Material(
                color: Colors.transparent,
                child: TextFormField(
                  onChanged: (value) {
                    paymentController.setQuery(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search by name",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed("addPayment", arguments: {
                        "id": paymentController.paymentList[index]["farmer_id"],
                        "firstname": paymentController.paymentList[index]
                            ["farmer_firstname"],
                        "lastname": paymentController.paymentList[index]
                            ["farmer_lastname"]
                      });
                    },
                    child: CustomCard(
                      context,
                      paymentController.paymentList[index]["farmer_firstname"] +
                          " " +
                          paymentController.paymentList[index]
                              ["farmer_lastname"],
                      paymentController.paymentList[index]["balance_harvest"],
                      paymentController.paymentList[index]["balance_amount"],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: paymentController.paymentList.length),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
