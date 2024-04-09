import 'package:animate_do/animate_do.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:flutter/material.dart';

class WhoPorject extends StatelessWidget {
  const WhoPorject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInLeft(
          child: Center(
            child: Text(
              """Track your expenses wisely with the 'Expense Manager' app Do you have trouble tracking your expenses? The 'Expense Tracker' app is here to help you! With 'Expense Tracker', you can: Record all your expenses accurately Categorize expenses by category and date Analyze your spending habits And much more Start recording your expenses now!!"""
                  .tr(context),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ),
        )
      ],
    );
  }
}
