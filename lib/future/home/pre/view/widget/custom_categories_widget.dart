import 'package:expense_tracker/future/home/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/home/pre/view/widget/custom_icons_stack_widget.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCategoriesWidget extends StatelessWidget {
  CustomCategoriesWidget({super.key, required this.categoriesMap});
  MapEntry<String, double> categoriesMap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withOpacity(0.1)
                  : Colors.white.withOpacity(0.2),
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withOpacity(0.1)
                  : Colors.white.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            stops: const [
              0.2,
              1.2,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.1),
                            Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          stops: const [
                            0.2,
                            1.2,
                          ],
                        ))),
                if (categoriesMap.key == "Medical")
                  const Icon(
                    Icons.medical_services_sharp,
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "\$ ${categoriesMap.value}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
