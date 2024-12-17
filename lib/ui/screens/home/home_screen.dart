import 'package:first_flutter_project/ui/screens/home/bottom_sheet_screen.dart';
import 'package:first_flutter_project/ui/utils/app_assets.dart';
import 'package:first_flutter_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../model/user_model.dart';
import '../../widgets/app_widgets.dart';
import 'contact_item.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = []; // List to store user data

  @override
  void initState() {
    super.initState();
    // Initialize with some dummy data or listen to changes
    users.addAll([
      User(AppAssets.contactImage, "Alice", "alice@example.com", "+1234567890"),
      User(AppAssets.contactImage, "Bob", "bob@example.com", "+0987654321"),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: appBar(),
        body: Column(children: [
          if (users
              .isEmpty) // Show homePlaceholder only if the user list is empty
            Center(
              child: Image.asset(AppAssets.homePlaceholder),
            ),
          const SizedBox(height: 16),
          if (users.isNotEmpty) // Show GridView only if users are not empty
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 286.0, // Max width per item
                  mainAxisExtent: 286.0,
                  mainAxisSpacing: 16.0, // Vertical spacing
                  crossAxisSpacing: 16.0, // Horizontal spacing
                ),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return UserItem(
                    user: users[index],
                    index: index,
                    onDeleteClicked: (index) {
                      setState(() {
                        users.removeAt(index);
                      });
                    },
                    onItemClicked: (user) {
                      setState(() {
                        onContactItemClicked(user);
                      });
                    },
                  );
                },
              ),
            ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: onFabClicked,
          backgroundColor: AppColors.accent,
          child: const Icon(Icons.add),
        ));
  }

  void onFabClicked() {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return AddUserBottomSheet(onUserAdded: (user) {
            setState(() {
              users.add(user);
            });
          });
        });
  }

  void onContactItemClicked(User user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return AddUserBottomSheet(
          userToEdit: user, // Pass the user to pre-fill data
          onUserAdded: (newUser) {
            setState(() {
              final index = users.indexWhere((u) => u == user);
              if (index != -1) {
                users[index] = newUser; // Update the existing user data
              }
            });
          },
        );
      },
    );
  }
}
