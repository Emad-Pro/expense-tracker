import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
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
        Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.2,
                    1.2,
                  ],
                ))),
        if (expanseModelGetData.categories == "Medical")
          const Icon(
            Icons.medical_services_sharp,
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
