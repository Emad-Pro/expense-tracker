import 'package:expense_tracker/future/home/data/model/expense_model.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:expense_tracker/future/settingScreen/pre/view/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(),
        drawer: const DrawerWidget(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle_outline_sharp),
          onPressed: () {
            floatingActionButtonPressd(context);
          },
        ));
  }
}

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
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
            leading: const Icon(Icons.settings),
            title: Text(
              "Settings".toUpperCase(),
              style: const TextStyle(letterSpacing: 2),
            ),
          )
        ],
      ),
    );
  }
}

floatingActionButtonPressd(context) {
  showDialog(
    context: context,
    builder: ((context) {
      TextEditingController titleController = TextEditingController();
      TextEditingController amountController = TextEditingController();
      return AlertDialog(
        title: const Text("New expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Title"),
              controller: titleController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "amount"),
              controller: amountController,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              amountController.clear();
              titleController.clear();
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              BlocProvider.of<ExpenseCubit>(context).addNewDataFromDatabase(
                  ExpanseModel.fromMap({
                "name": titleController.text,
                "amount": amountController.text
              }));
            },
            child: Text("Save"),
          )
        ],
      );
    }),
  );
}
