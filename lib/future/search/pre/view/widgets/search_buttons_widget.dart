import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/future/search/data/model/expenses_search_model.dart';
import 'package:expense_tracker/future/search/pre/view_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchButtonsWidget extends StatelessWidget {
  const SearchButtonsWidget({
    super.key,
    required this.startAmountController,
    required this.startDateController,
    required this.endDateController,
    required this.descriptionController,
    required this.endAmountController,
    required this.categoryController,
  });

  final TextEditingController startAmountController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final TextEditingController descriptionController;
  final TextEditingController endAmountController;
  final TextEditingController categoryController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(builder: (context) {
          return Container(
            margin:
                MediaQuery.of(context).padding.copyWith(top: 10, bottom: 10),
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.7,
            child: MaterialButton(
              onPressed: () {
                BlocProvider.of<SearchCubit>(context).multipleSearchMethod(
                    ExpenseSearchModel()
                      ..category = categoryController.text
                      ..description = descriptionController.text
                      ..startAmount = startAmountController.text.isNotEmpty
                          ? double.parse(startAmountController.text)
                          : 0.0
                      ..endAmount = endAmountController.text.isNotEmpty
                          ? double.parse(endAmountController.text)
                          : 2000000000.0
                      ..startDate = startDateController.text.isNotEmpty
                          ? DateTime.parse(startDateController.text)
                          : DateTime.now().toLocal()
                      ..endDate = endDateController.text.isNotEmpty
                          ? DateTime.parse(endDateController.text)
                          : DateTime(1980).toLocal());
              },
              color: Theme.of(context).colorScheme.tertiary,
              elevation: 0,
              child: Text(
                "Search Expense".tr(context),
              ),
            ),
          );
        }),
        const Spacer(),
        IconButton(
            onPressed: () {
              startAmountController.clear();
              endAmountController.clear();
              startDateController.clear();
              endDateController.clear();
              descriptionController.clear();
            },
            icon: const Icon(Icons.cleaning_services_outlined))
      ],
    );
  }
}