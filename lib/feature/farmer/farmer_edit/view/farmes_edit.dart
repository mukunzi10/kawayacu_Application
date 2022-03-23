import 'package:coffeharvest/feature/farmer/farmer_edit/controller/addfarmersController.dart';
import 'package:coffeharvest/feature/farmer/farmers/controller/farmersController.dart';
import 'package:coffeharvest/feature/widgets/appBar.dart';
import 'package:coffeharvest/helpers/colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class FamersEdit extends StatelessWidget {
  Widget build(BuildContext context) {
    final addFarmerController = Get.find<AddFarmerController>();

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
              Padding(
                padding: EdgeInsets.only(left: 60),
                child: ListTile(
                  leading: Icon(Icons.person_add_alt_1_rounded),
                  title: Text(
                    " Farmer Registration",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blue),
                  ),
                ),
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
                    child: TextFormField(
                      onChanged: (value) {
                        addFarmerController.setFirstname(value);
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: " Firstname", border: InputBorder.none),
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
                    " ${addFarmerController.firstNameError}",
                    style: TextStyle(color: Colors.red[600]),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
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
                      onChanged: (value) {
                        addFarmerController.setLastname(value);
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: " Lastname", border: InputBorder.none),
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
                    " ${addFarmerController.lastNameError}",
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
                child: Material(
                  elevation: 1,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: GetBuilder<AddFarmerController>(
                          builder: (controller) {
                        return DropdownButton(
                          value: controller.selectedGender,
                          isExpanded: true,
                          hint: Text("Select Gender"),
                          onChanged: (value) {
                            controller.setSelected(value);
                          },
                          items: controller.listOfOptions
                              .map((valueItem) => DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  ))
                              .toList(),
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
                    " ${addFarmerController.selectedGenderError}",
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
                      onChanged: (value) {
                        addFarmerController.setPhone(value);
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: " Phone", border: InputBorder.none),
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
                    " ${addFarmerController.phoneError}",
                    style: TextStyle(color: Colors.red[600]),
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
                child: Center(
                    child: Obx(() => addFarmerController.submitting.value
                        ? SpinKitCircle(
                            size: 30,
                            color: CustomColors.CoffeBrown,
                          )
                        : Text(""))),
              ),
              SizedBox(height: 10),
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
                    addFarmerController.validate();
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Add new",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
