import 'package:first_flutter_project/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../model/user_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class AddUserBottomSheet extends StatefulWidget {
  final Function(User user) onUserAdded;
  final User? userToEdit; // New parameter to pre-fill data

  const AddUserBottomSheet(
      {super.key, required this.onUserAdded, this.userToEdit});

  @override
  State<AddUserBottomSheet> createState() => _AddUserBottomSheetState();
}

class _AddUserBottomSheetState extends State<AddUserBottomSheet> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  late var imageController = AppAssets.imagePlaceholder;
  late var userNameText = "User Name";
  late var userPhoneText = "example@email.com";
  late var userEmailText = "+200000000000";

  @override
  void initState() {
    super.initState();
    if (widget.userToEdit != null) {
      nameController.text = widget.userToEdit!.name;
      emailController.text = widget.userToEdit!.email;
      phoneController.text = widget.userToEdit!.phone;

      imageController = widget.userToEdit!.image.isNotEmpty
          ? widget.userToEdit!.image
          : AppAssets.imagePlaceholder;
      userNameText = widget.userToEdit!.name;
      userEmailText = widget.userToEdit!.email;
      userPhoneText = widget.userToEdit!.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensures it wraps content
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Profile Section
              userInfo(),
              const SizedBox(height: 32),
              // Input Fields
              textField(nameController, "Enter User Name", Icons.person),
              const SizedBox(height: 16),
              textField(emailController, "Enter User Email", Icons.email),
              const SizedBox(height: 16),
              textField(phoneController, "Enter User Phone", Icons.phone),
              const SizedBox(height: 32),
              // Enter User Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onEnterUserButtonClicked(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Enter user',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  Widget userInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Profile Image Container
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.accent, width: 1.5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: AssetImage(imageController),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userNameText,
                  style: AppStyles.textStylesInBottomSheet,
                ),
                spaceBetweenTexts(),
                Text(
                  userEmailText,
                  style: AppStyles.textStylesInBottomSheet,
                ),
                spaceBetweenTexts(),
                Text(
                  userPhoneText,
                  style: AppStyles.textStylesInBottomSheet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onEnterUserButtonClicked(BuildContext context) {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        phoneController.text.isEmpty) {
      showSnackBar(context);
    } else {
      final user = User(
        imageController,
        nameController.text,
        emailController.text,
        phoneController.text,
      );
      widget.onUserAdded(user); // Call the callback with the user
      Navigator.pop(context);
    }
  }
}
