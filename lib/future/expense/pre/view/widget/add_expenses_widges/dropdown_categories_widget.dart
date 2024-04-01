import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropDownCategoriesWidget extends StatelessWidget {
  const DropDownCategoriesWidget(
      {super.key, required this.categoriesController});
  final TextEditingController categoriesController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: FormBuilderDropdown<String>(
          isDense: false,
          isExpanded: false,
          elevation: 0,
          iconSize: 20,
          name: 'cateogires',
          onSaved: (value) {
            categoriesController.text =
                BlocProvider.of<ExpenseCubit>(context).categories.last;
          },
          onChanged: (value) {
            categoriesController.text = value!;
          },
          validator: (value) {
            categoriesController.text = value!;
          },
          initialValue: BlocProvider.of<ExpenseCubit>(context).categories.last,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Select option".tr(context),
            hintText: "Category".tr(context),
            alignLabelWithHint: true,
          ),
          items: BlocProvider.of<ExpenseCubit>(context)
              .categories
              .map((category) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: category,
                    child: Text(category.tr(context)),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
