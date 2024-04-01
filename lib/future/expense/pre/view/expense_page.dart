import 'dart:math';

import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:expense_tracker/core/method.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/categories_gridView.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/expenses_total_widget.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/lastTest_enteries_widet.dart';

import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

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
                    child: state.getExpansesModel!.isNotEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ExpensesTotalWidget(
                                expenseState: state,
                              ),
                              PieChart(
                                data: state.categoriesTotalItem,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, bottom: 15),
                                    child: BarChart(
                                      BarChartData(
                                        barGroups: getDailyExpenses(
                                                state.getExpansesModel!)
                                            .entries
                                            .map((entry) {
                                          return BarChartGroupData(
                                            x: entry.key.day,
                                            groupVertically: true,
                                            barRods: [
                                              BarChartRodData(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                toY: entry.value,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                        titlesData: const FlTitlesData(
                                          topTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                  showTitles: false)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (state.categoriesItems != null)
                                CategoriesGridView(
                                  expenseState: state,
                                ),
                              if (state.getExpansesModel != null)
                                LastTestEnteriesWidet(expenseState: state),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                """It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."""
                                    .tr(context),
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.justify,
                              )
                            ],
                          )),
              );
            case RequestState.erorr:
              return Text(state.messageExpansesText);
          }
        },
      )),
    );
  }
}

class PieChart extends StatelessWidget {
  final Map<String, double>? data;

  const PieChart({
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        height: 300.0,
        child: CustomPaint(
          painter: PieChartPainter(
            context: context,
            data: data,
          ),
        ));
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, double>? data;
  final BuildContext context;
  PieChartPainter({
    required this.context,
    this.data,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Calculate the total value of all categories
    final total = data!.values.reduce((a, b) => a + b);

    // Calculate the start and end angles for each category
    var startAngle = 0.0;
    var endAngle = 0.0;
    for (var entry in data!.entries) {
      final fraction = entry.value / total;
      endAngle += 2 * pi * fraction;

      // Generate a random color for each category
      final color = randomColorScheme().primary;

      // Draw the arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        true,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill,
      );

      // Calculate label position
      final labelRadius = radius / 1.5;
      final angle = startAngle + (endAngle - startAngle) / 2;
      final labelX = center.dx + cos(angle) * labelRadius;
      final labelY = center.dy + sin(angle) * labelRadius;

      // Draw label text
      final textPainter = TextPainter(
        text: TextSpan(
          text:
              "${entry.key.tr(context)} - ${((entry.value / total) * 100).toStringAsFixed(1)} %",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12.0,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              labelX - textPainter.width / 2, labelY - textPainter.height / 2));

      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) {
    return oldDelegate.data != data;
  }
}
