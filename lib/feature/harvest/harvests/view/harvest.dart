import 'package:coffeharvest/feature/harvest/harvests/controller/harvestController.dart';
import 'package:coffeharvest/feature/widgets/customCard.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class Harvest extends StatelessWidget {
  Widget build(BuildContext context) {
    final harvestController = Get.find<HarvestController>();
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
                  "Harvest",
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
                    harvestController.setQuery(value);
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
                  return CustomCard(
                      context,
                      harvestController.harvestList[index]["farmer_firstname"],
                      harvestController.harvestList[index]
                                  ["harvest_totalPrice"] ==
                              null
                          ? "Price: " + "0"
                          : "Price: " +
                              harvestController.harvestList[index]
                                      ["harvest_totalPrice"]
                                  .toString() +
                              " RWF",
                      harvestController.harvestList[index]
                                  ["harvest_quantity"] ==
                              null
                          ? "Qty: " + "0 Kg"
                          : "Qty: " +
                              harvestController.harvestList[index]
                                      ["harvest_quantity"]
                                  .toString() +
                              " Kg");
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: harvestController.harvestList.length),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed('addHarvest');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}
