import 'package:expense_tracker/future/settingScreen/pre/view/settingScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(),
      drawer: Drawer(
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              leading: const Icon(Icons.settings),
              title: Text(
                "Settings".toUpperCase(),
                style: const TextStyle(letterSpacing: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
