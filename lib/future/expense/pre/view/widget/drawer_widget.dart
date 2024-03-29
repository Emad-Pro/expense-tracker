import 'package:expense_tracker/future/settingScreen/pre/view/setting_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.money,
              size: 100,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
            title: Text(
              "home".toUpperCase(),
              style: const TextStyle(letterSpacing: 2),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
