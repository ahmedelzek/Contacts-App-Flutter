import 'package:first_flutter_project/ui/utils/app_assets.dart';
import 'package:first_flutter_project/ui/utils/app_styles.dart';
import 'package:first_flutter_project/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import '../../../model/user_model.dart';
import '../../utils/app_colors.dart';

class UserItem extends StatefulWidget {
  final User user;
  final int index;
  final Function(int userIndex) onDeleteClicked;
  final Function(User user) onItemClicked;

  const UserItem(
      {super.key,
      required this.user,
      required this.onDeleteClicked,
      required this.index,
      required this.onItemClicked});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onItemClicked(widget.user);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: contactItemInfo(),
      ),
    );
  }

  Widget contactItemInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              const Image(
                image: AssetImage(AppAssets.contactImage),
                height: 177,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(6),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child:
                    Text(widget.user.name, style: AppStyles.userNameTextStyle),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: AppColors.accent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemContactTexts(widget.user.email, Icons.email),
                itemContactTexts(widget.user.phone, Icons.phone),
                deleteButton()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget deleteButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton.icon(
        onPressed: () {
          widget.onDeleteClicked(widget.index);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.delete, color: Colors.white),
        label: const Text(
          "Delete",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
