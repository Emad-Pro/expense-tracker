import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/app_constanse.dart';
import 'package:expense_tracker/core/widget/build_custom_icon_category.dart';

import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required this.expenseState,
  });
  final ExpenseState expenseState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              MediaQuery.of(context).padding.copyWith(top: 20.0, bottom: 10),
          child: Text(
            "Categories".tr(context),
            style: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(16),
                fontWeight: FontWeight.w600),
          ),
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.3,
                crossAxisCount: 2,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.22,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25),
            itemCount: AppConstanse.categories.length,
            itemBuilder: (context, index) {
              final categoryItem = AppConstanse.categories[index];
              return CustomCategoriesWidget(
                categoryItem: categoryItem,
                categoryData:
                    expenseState.categoriesTotalItem!.entries.toList(),
              );
            }),
      ],
    );
  }
}

class CustomCategoriesWidget extends StatelessWidget {
  const CustomCategoriesWidget({
    super.key,
    required this.categoryItem,
    required this.categoryData,
  });

  final String categoryItem;
  final List<MapEntry<String, double>> categoryData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement your navigation logic here
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
                // Use a map or switch statement for cleaner icon selection
                BuildCustomIconCategory(categoryItem: categoryItem),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              categoryItem.tr(context),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Builder(
              builder: (
                BuildContext context,
              ) {
                double? value;
                for (var element in categoryData) {
                  if (element.key == categoryItem) {
                    value = element.value;
                  }
                }
                return Text(
                  value == null
                      ? "0.0"
                      : value.toString(), // Display with 2 decimal places
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
