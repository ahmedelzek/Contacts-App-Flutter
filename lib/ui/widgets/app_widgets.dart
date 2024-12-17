import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

AppBar appBar() {
  return AppBar(
      backgroundColor: AppColors.primary,
      title: Image.asset(
        AppAssets.logo,
        height: 40,
        width: 117,
      ));
}

TextField textField(
    TextEditingController controller, String hint, IconData icon) {
  return TextField(
    controller: controller,
    cursorColor: Colors.grey[400],
    decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        filled: true,
        fillColor: const Color(0xFF273545),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.accent, width: 1.0), // Default border color
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.accent, width: 1.0))),
    style: const TextStyle(color: Colors.white),
  );
}

Widget itemContactTexts(String textInfo, IconData icon) {
  return Container(
    margin: const EdgeInsets.all(6),
    child: Row(
      crossAxisAlignment:
          CrossAxisAlignment.center, // Align items vertically centered
      children: [
        Icon(
          icon, // Choose the desired icon
          color: AppColors.primary, // Icon color
          size: 16, // Icon size
        ),
        const SizedBox(width: 3), // Adds spacing between the icon and the text
        Text(
          textInfo,
          style: AppStyles.textContactItemStyle,
        ),
      ],
    ),
  );
}

Widget spaceBetweenTexts() {
  return Container(
    margin: const EdgeInsets.only(
        top: 16.0, bottom: 16.0), // Sets a margin of 16 pixels on all sides
    width: 150,
    height: 1.5,
    decoration: BoxDecoration(
        color: AppColors.accent, borderRadius: BorderRadius.circular(10)),
  );
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        "Please Enter  Values",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      duration: const Duration(seconds: 2), // Duration of the SnackBar
      backgroundColor: Colors.redAccent, // Background color
      action: SnackBarAction(
        label: "Ok",
        textColor: Colors.white,
        onPressed: () {
          // Action when the button is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OK Pressed!")),
          );
        },
      ),
      behavior: SnackBarBehavior.floating, // Makes it float above content
      margin: const EdgeInsets.all(16), // Adds margin when floating
    ),
  );
}
