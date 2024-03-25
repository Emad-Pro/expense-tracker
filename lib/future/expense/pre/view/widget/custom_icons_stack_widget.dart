import 'package:expense_tracker/future/expense/data/model/expanse_model_getData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconsStackWidget extends StatelessWidget {
  const CustomIconsStackWidget({super.key, required this.expanseModelGetData});
  final ExpanseModelGetData expanseModelGetData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          child: const SizedBox(
            width: 40,
            height: 40,
          ),
        ),
        if (expanseModelGetData.categories == "Medical")
          const Icon(
            Icons.medical_services_outlined,
            color: Color.fromARGB(255, 155, 0, 212),
          ),
        if (expanseModelGetData.categories == "Food")
          const Icon(
            Icons.food_bank_outlined,
            color: Color.fromARGB(255, 0, 212, 88),
          ),
        if (expanseModelGetData.categories == "Other")
          const Icon(
            CupertinoIcons.doc_text,
            color: Color.fromARGB(255, 212, 60, 0),
          ),
        if (expanseModelGetData.categories == "Shopping")
          const Icon(
            CupertinoIcons.shopping_cart,
            color: Color.fromARGB(255, 0, 99, 212),
          ),
      ],
    );
  }
}
