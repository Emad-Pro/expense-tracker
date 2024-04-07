import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:expense_tracker/core/app_constanse.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/method/method.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/widget/who_porject.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/expenses_total_widget.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/lastTest_enteries_widet.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    child: AnimatedConditionalBuilder(
                        condition: state.getExpansesModel!.isNotEmpty,
                        builder: (context) => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ExpensesTotalWidget(
                                  expenseState: state,
                                ),
                                ColumnChartWidget(expenseState: state),
                                if (state.getExpansesModel != null)
                                  LastTestEnteriesWidet(expenseState: state),
                                const SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                        fallback: (context) => const WhoPorject())),
              );
            case RequestState.erorr:
              return Text(state.messageExpansesText);
          }
        },
      )),
    );
  }
}

class ColumnChartWidget extends StatelessWidget {
  const ColumnChartWidget({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).padding.copyWith(left: 5, right: 5),
      margin:
          MediaQuery.of(context).padding.copyWith(left: 8.0, right: 8, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: BarChart(
            swapAnimationCurve: Curves.decelerate,
            BarChartData(
              barGroups: getDailyExpenses(expenseState.getExpansesModel!)
                  .entries
                  .map((entry) {
                return BarChartGroupData(
                  x: entry.key.day,
                  groupVertically: true,
                  barRods: [
                    BarChartRodData(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                        ],
                        stops: [
                          0.0,
                          0.5,
                          1.0,
                        ],
                      ),
                      toY: entry.value,
                    ),
                  ],
                );
              }).toList(),
              titlesData: FlTitlesData(
                rightTitles: AxisTitles(
                    axisNameWidget: Text(
                        "Price is according to the ${ProfileService.currancy} currency")),
                bottomTitles: const AxisTitles(
                    axisNameWidget: Text("Days In Month"),
                    sideTitles: SideTitles(showTitles: false)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}