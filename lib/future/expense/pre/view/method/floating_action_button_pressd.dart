import 'package:expense_tracker/future/expense/data/model/expense_model.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              BlocProvider.of<ExpenseCubit>(context).addNewDataFromDatabase(
                  ExpanseModel.fromMap({
                "name": titleController.text,
                "amount": amountController.text
              }));
            },
            child: const Text("Save"),
          )
        ],
      );
    }),
  );
}
