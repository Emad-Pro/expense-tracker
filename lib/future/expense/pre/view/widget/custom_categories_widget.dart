import 'package:expense_tracker/future/categoires/view/categories_screen.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCategoriesWidget extends StatelessWidget {
  CustomCategoriesWidget(
      {super.key, required this.categoriesMap, required this.expenseState});
  final ExpenseState expenseState;
  MapEntry<String, double> categoriesMap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CategoriesScreen(
                      expenseState: expenseState,
                    ))));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ),
                if (categoriesMap.key == "Medical")
                  const Icon(
                    Icons.medical_services_outlined,
                    color: Color.fromARGB(255, 155, 0, 212),
                  ),
                if (categoriesMap.key == "Food")
                  const Icon(
                    Icons.food_bank_outlined,
                    color: Color.fromARGB(255, 0, 212, 88),
                  ),
                if (categoriesMap.key == "Other")
                  const Icon(
                    CupertinoIcons.doc_text,
                    color: Color.fromARGB(255, 212, 60, 0),
                  ),
                if (categoriesMap.key == "Shopping")
                  const Icon(
                    CupertinoIcons.shopping_cart,
                    color: Color.fromARGB(255, 0, 99, 212),
                  ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              categoriesMap.key,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "\$ ${categoriesMap.value}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
