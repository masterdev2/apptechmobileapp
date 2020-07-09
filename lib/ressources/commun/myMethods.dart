import 'package:apptech/ressources/commun/myStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyMethods {

  static void showMessage(String type, String message) {
    String title = "";
    IconData icon = null;
    Color backColor = null;
    switch (type) {
      case 'Erreur':
        title = "Erreur";
        icon = FontAwesomeIcons.timesCircle;
        backColor = MyStyles.redColor;
        break;
      case 'Information':
        title = "Information";
        icon = FontAwesomeIcons.checkCircle;
        backColor = MyStyles.greenColor;
        break;
      default:
        title = "Alert";
        icon = FontAwesomeIcons.infoCircle;
        backColor = MyStyles.greyColor;
        break;
    }
    Get.snackbar(
      title,
      message,
      icon: Icon(
        icon,
        color: MyStyles.whiteColor,
      ),
      backgroundColor: backColor,
      colorText: MyStyles.whiteColor,
      barBlur: 50,
      isDismissible: true,
    );
  }

  static void navigate(int off, Widget go) {
    switch (off) {
      case 0:
        Get.to(go);
        break;
      case 1:
        Get.off(go);
        break;
      case 2:
        Get.offAll(go);
        break;
    }
  }
}