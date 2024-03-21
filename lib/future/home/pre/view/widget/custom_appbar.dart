import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          child: Text("EA"),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Hello ${ProfileService.userName}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.settings)),
      ],
    );
  }
}
