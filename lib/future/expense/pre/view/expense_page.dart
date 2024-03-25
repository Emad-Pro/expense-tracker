import 'package:expense_tracker/core/enum/enum.dart';

import 'package:expense_tracker/future/expense/pre/view/widget/add_expenses_widges/custom_bottom_sheet_widget.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/categories_gridView.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/custom_appbar.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/expenses_total_widget.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/lastTest_enteries_widet.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          switch (state.getDatabaseExpansesState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.sucess:
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ExpensesTotalWidget(
                        expenseState: state,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10),
                        margin:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 10),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: BarChart(
                            BarChartData(
                                barGroups: [],
                                borderData: FlBorderData(
                                  border: const Border(
                                    top: BorderSide.none,
                                    right: BorderSide.none,
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1),
                                  ),
                                ),
                                groupsSpace: 10),
                          ),
                        ),
                      ),
                      if (state.categoriesItems != null)
                        CategoriesGridView(
                          expenseState: state,
                        ),
                      if (state.getDatabaseExpansesModel != null)
                        LastTestEnteriesWidet(expenseState: state),
                    ],
                  ),
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

String convertDateToDay(String dateString) {
  DateTime date = DateFormat('EEE, MM/DD/yyyy').parse(dateString);
  String weekday = DateFormat('EEE').format(date);
  return weekday.toUpperCase();
}
