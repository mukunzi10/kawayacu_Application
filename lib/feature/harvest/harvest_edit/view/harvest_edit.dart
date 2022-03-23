import 'dart:convert';

import 'package:coffeharvest/feature/harvest/harvest_edit/controller/addHarvestController.dart';
import 'package:coffeharvest/feature/widgets/appBar.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HarvestEdit extends StatelessWidget {
  Widget build(BuildContext context) {
    final addHarvestController = Get.find<AddHarvestController>();
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
                "Update Harvest",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.blue),
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
                      child: GetBuilder<AddHarvestController>(
                          builder: (controller) {
                        return DropdownButton(
                          value: controller.selectedFarmer,
                          isExpanded: true,
                          hint: Text("Select Farmer"),
                          onChanged: (value) {
                            controller.setSelected(value);
                          },
                          items: addHarvestController.listOfFarmers.map((map) {
                            var data = jsonEncode(map);
                            var farmer_id = jsonDecode(data)["farmer_id"];
                            var farmer_names =
                                jsonDecode(data)["farmer_firstname"] +
                                    " " +
                                    jsonDecode(data)["farmer_lastname"];
                            return new DropdownMenuItem<String>(
                              value: farmer_id.toString(),
                              child: new Text(farmer_names.toString(),
                                  style: new TextStyle(color: Colors.black)),
                            );
                          }).toList(),
                        );
                      })),
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
                    " ${addHarvestController.selectedFarmerError}",
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
                      onChanged: addHarvestController.setQuantity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: " Quantity", border: InputBorder.none),
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
                    " ${addHarvestController.quantityError}",
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
                      child: Obx(
                        () => Center(
                          child: Text(
                              "Total Price : ${addHarvestController.totalprice.value.toString()} RWF"),
                        ),
                      )),
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
                    child: Obx(() => addHarvestController.submitting.value
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
                    addHarvestController.validate();
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
