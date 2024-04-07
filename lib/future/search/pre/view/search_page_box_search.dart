import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/app_constanse.dart';
import 'package:expense_tracker/future/search/pre/view/widgets/min_and_max_amount_widget.dart';
import 'package:expense_tracker/future/search/pre/view/widgets/search_buttons_widget.dart';
import 'package:expense_tracker/future/search/pre/view/widgets/search_description_widget.dart';
import 'package:expense_tracker/future/search/pre/view/widgets/start_and_end_date_widgets.dart';
import 'package:expense_tracker/future/search/pre/view_model/cubit/search_cubit.dart';

class SearchPageBoxSearch extends StatelessWidget {
  SearchPageBoxSearch({super.key});
  final TextEditingController endAamountController = TextEditingController();
  final TextEditingController startAmountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          TextFormFiledSearchWidget(
            textFormFiledController: descriptionController,
            hintText: "Description".tr(context),
          ),
          StartAndEndDateWndgets(
              startDateController: startDateController,
              endDateController: endDateController),
          MinAndMaxAmountWidget(
              startAmountController: startAmountController,
              endAamountController: endAamountController),
          SearchDropDownSelectCategory(categoryController: categoryController),
          SearchButtonsWidget(
              endAmountController: endAamountController,
              startAmountController: startAmountController,
              startDateController: startDateController,
              endDateController: endDateController,
              categoryController: categoryController,
              descriptionController: descriptionController),
        ])
      ],
    );
  }
}

class SearchDropDownSelectCategory extends StatelessWidget {
  const SearchDropDownSelectCategory({
    super.key,
    required this.categoryController,
  });
  final TextEditingController categoryController;

  @override
  Widget build(BuildContext context) {
    FocusNode searchFocusNode = FocusNode();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Container(
          margin:
              MediaQuery.of(context).viewPadding.copyWith(top: 10, bottom: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: DropDownTextField(
            clearOption: true,
            textFieldDecoration:
                InputDecoration(hintText: "category".tr(context)),
            searchFocusNode: searchFocusNode,
            dropDownItemCount: 6,
            dropDownList: AppConstanse.categories
                .map((e) => DropDownValueModel(name: e.tr(context), value: e))
                .toList(),
            onChanged: (val) {
              if (val.toString() != '') {
                categoryController.text = val.value.toString();
              } else {
                categoryController.text = '';
              }
            },
          ),
        );
      },
    );
  }
}
