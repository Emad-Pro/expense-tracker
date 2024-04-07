import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/method/convert_month_and_year_to_this_month.dart';
import 'package:expense_tracker/core/method/parse_year_and_month_to_Int.dart';

import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/future/expense/data/model/date_model.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExpensesTotalWidget extends StatelessWidget {
  final ExpenseState expenseState;

  const ExpensesTotalWidget({super.key, required this.expenseState});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: MediaQuery.of(context)
          .padding
          .copyWith(top: 20.0, bottom: 20, left: 10, right: 10),
      margin:
          MediaQuery.of(context).padding.copyWith(left: 8.0, right: 8, top: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Expenses".tr(context),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(14),
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${expenseState.totalAmount} ${ProfileService.currancy.toString().tr(context)}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(30),
                ),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.26,
            child: FormBuilderDropdown<String>(
              validator: (value) {},
              onChanged: (value) async {
                BlocProvider.of<ExpenseCubit>(context).getDataFromDatabase(
                  dateModel: DateModel()
                    ..month = parseDate(value!)["month"]!
                    ..year = parseDate(value!)["year"]!,
                );
              },
              isDense: false,
              initialValue:
                  BlocProvider.of<ExpenseCubit>(context).getMonthsYear.last,
              isExpanded: false,
              name: 'month',
              decoration: const InputDecoration(
                  alignLabelWithHint: false, border: InputBorder.none),
              items: BlocProvider.of<ExpenseCubit>(context)
                  .getMonthsYear
                  .map(
                    (month) => DropdownMenuItem(
                      alignment: AlignmentDirectional.center,
                      value: month,
                      child: Text(
                        convertMonthAndYearToThisMonth(month).toString(),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaler.scale(15),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
