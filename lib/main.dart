import 'package:coffeharvest/feature/auth/binding/loginBindings.dart';
import 'package:coffeharvest/feature/auth/view/changePassword.dart';
import 'package:coffeharvest/feature/auth/view/login.dart';
import 'package:coffeharvest/feature/farmer/farmer_edit/bindings/addfarmerBindings.dart';
import 'package:coffeharvest/feature/farmer/farmer_edit/view/farmes_edit.dart';
import 'package:coffeharvest/feature/harvest/harvest_edit/binding/addharvestBindings.dart';
import 'package:coffeharvest/feature/harvest/harvest_edit/view/harvest_edit.dart';
import 'package:coffeharvest/feature/homepage/binding/homepageBindings.dart';
import 'package:coffeharvest/feature/homepage/view/homepage.dart';
import 'package:coffeharvest/feature/payments/payments_edit/binding/paymentBindings.dart';
import 'package:coffeharvest/feature/payments/payments_edit/view/payment_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBindings(),
      title: 'kawayacu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      getPages: [
        GetPage(name: '/login', page: () => Login()),
        GetPage(
            name: '/homepage',
            page: () => HomePage(),
            binding: HomePageBindings()),
        GetPage(
            name: '/change',
            page: () => ChangePassword(),
            binding: LoginBindings()),
        GetPage(
            name: '/addHarvest',
            page: () => HarvestEdit(),
            binding: AddHarvestBindings()),
        GetPage(
            name: '/addFarmer',
            page: () => FamersEdit(),
            binding: AddFarmerBindings()),
        GetPage(
            name: '/addPayment',
            page: () => PaymentEdit(),
            binding: PaymentBindings())
      ],
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
    );
  }
}
