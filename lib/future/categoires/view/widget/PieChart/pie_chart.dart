import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/future/categoires/view/widget/PieChart/pie_chart_painter.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final Map<String, double>? data;

  const PieChart({
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: MediaQuery.of(context)
                  .padding
                  .copyWith(top: 20.0, bottom: 10),
              child: Text(
                "Analytics".tr(context),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(16),
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Center(
            child: Container(
                child: CustomPaint(
              isComplex: true,
              size: Size(MediaQuery.of(context).size.width * .70, 350),
              painter: PieChartPainter(
                context: context,
                data: data,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
