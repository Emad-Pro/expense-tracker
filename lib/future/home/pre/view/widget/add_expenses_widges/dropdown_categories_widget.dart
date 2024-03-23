import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropDownCategoriesWidget extends StatelessWidget {
  const DropDownCategoriesWidget(
      {super.key, required this.categoriesController});
  final TextEditingController categoriesController;

  @override
  Widget build(BuildContext context) {
    categoriesController.text =
        BlocProvider.of<ExpenseCubit>(context).categories.last;
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
            categoriesController.text = value!;
          },
          onChanged: (value) {
            categoriesController.text = value!;
          },
          initialValue: BlocProvider.of<ExpenseCubit>(context).categories.last,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Select option",
            hintText: "Category",
            alignLabelWithHint: true,
          ),
          items: BlocProvider.of<ExpenseCubit>(context)
              .categories
              .map((gender) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: gender,
                    child: Text(gender),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
