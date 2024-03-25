import 'package:expense_tracker/future/expense/pre/view/widget/custom_categories_widget.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.expenseState});
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
            "Categories",
            style: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(16),
                fontWeight: FontWeight.w600),
          ),
        ),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.4,
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.18,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25),
          children: expenseState.categoriesTotalItem!.entries.map((e) {
            return CustomCategoriesWidget(
                categoriesMap: e, expenseState: expenseState);
          }).toList(),
        ),
      ],
    );
  }
}
