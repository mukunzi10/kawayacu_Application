import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/widgets/customCard.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class Famers extends StatelessWidget {
  Widget build(BuildContext context) {
    final famersController = Get.find<FamersController>();
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
                onTap: () {
                  famersController.loadData();
                },
                leading: Text(
                  "Farmers",
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
                    famersController.setQuery(value);
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
            () => famersController.loading.value
                ? Text("loading")
                : ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomCard(
                          context,
                          famersController.farmersList[index]
                              ["farmer_firstname"],
                          "Tel: " +
                              famersController.farmersList[index]
                                  ["farmer_phone"],
                          famersController.farmersList[index]["farmer_gender"]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: famersController.farmersList.length),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed("addFarmer");
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}
