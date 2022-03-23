import 'dart:convert';

import 'package:coffeharvest/feature/harvest/harvest_edit/controller/addHarvestController.dart';
import 'package:coffeharvest/feature/payments/payments_edit/controller/addPaymentController.dart';
import 'package:coffeharvest/feature/widgets/appBar.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PaymentEdit extends StatelessWidget {
  Widget build(BuildContext context) {
    final addPaymentController = Get.find<AddPaymentController>();
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                "Add Payment",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 30,
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
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("${addPaymentController.farmerNames}"),
                      )),
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
                      onChanged: addPaymentController.setQuantity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: " Amount", border: InputBorder.none),
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
                    " ${addPaymentController.amountError}",
                    style: TextStyle(color: Colors.red[600]),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                    child: Obx(() => addPaymentController.submitting.value
                        ? SpinKitCircle(
                            size: 30,
                            color: Colors.blue,
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
                    addPaymentController.validate();
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.save,
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
    );
  }
}
