import 'package:expense_tracker/future/categoires/view/widget/PieChart/pie_chart.dart';
import 'package:expense_tracker/future/categoires/view/widget/categories_gridView.dart';

import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (state.categoriesTotalItem!.isNotEmpty)
                  PieChart(
                    data: state.categoriesTotalItem,
                  ),
                CategoriesGridView(
                  expenseState: state,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
