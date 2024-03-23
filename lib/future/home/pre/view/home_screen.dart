import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/future/home/pre/view/widget/add_expenses_widges/add_expense_Item.dart';
import 'package:expense_tracker/future/home/pre/view/widget/categories_gridView.dart';
import 'package:expense_tracker/future/home/pre/view/widget/custom_appbar.dart';
import 'package:expense_tracker/future/home/pre/view/widget/expenses_total_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/lastTest_enteries_widet.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          body: BlocBuilder<ExpenseCubit, ExpenseState>(
            builder: (context, state) {
              switch (state.getDatabaseExpansesState) {
                case RequestState.loading:
                  return const Center(child: CircularProgressIndicator());
                case RequestState.sucess:
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const CustomAppbar(),
                        ExpensesTotalWidget(
                          expenseState: state,
                        ),
                        if (state.categoriesItems != null)
                          CategoriesGridView(
                            expenseState: state,
                          ),
                        const Spacer(),
                        if (state.getDatabaseExpansesModel != null)
                          LastTestEnteriesWidet(expenseState: state),
                        AddExpenseItem()
                      ],
                    ),
                  );
                case RequestState.erorr:
                  return Text(state.messageExpansesText);
              }
            },
          )),
    );
  }
}
