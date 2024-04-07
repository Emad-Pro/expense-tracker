import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/core/get_It/service_locator.dart';
import 'package:expense_tracker/core/widget/build_custom_icon_category.dart';
import 'package:expense_tracker/core/widget/listView_expense_item.dart';
import 'package:expense_tracker/future/categoires/view_model/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CategoryCubit>()..fetchDataWithCategoryName(categoryName),
      child: Scaffold(
          appBar: AppBar(
            title: Text(categoryName.tr(context)),
            centerTitle: true,
          ),
          body: BlocBuilder<CategoryCubit, CategoryState>(
            buildWhen: (previous, current) {
              if (previous.hashCode != current.hashCode) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              switch (state.categoryState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case RequestState.sucess:
                  return Column(
                    children: [
                      TotalExpensesWidget(
                          categoryName: categoryName,
                          categoryModelData: state.categoryModelData),
                      Expanded(
                        child: ListViewExpenseItem(
                            choiceCubit: "categoryCubit",
                            isSlidable: true,
                            getExpansesModel: state.categoryModelData),
                      ),
                    ],
                  );
                case RequestState.erorr:
                  return Center(child: Text(state.erorrMessage));
              }
            },
          )),
    );
  }
}

class TotalExpensesWidget extends StatelessWidget {
  const TotalExpensesWidget(
      {super.key, required this.categoryModelData, required this.categoryName});
  final List<ExpensesModel>? categoryModelData;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    double totalPriceCategory = additionTotalExpenseCategory();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      margin: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
      child: Row(children: [
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
              "$totalPriceCategory",
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(30),
              ),
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ),
                BuildCustomIconCategory(
                  categoryItem: categoryName,
                )
              ],
            ),
            Text(categoryName.tr(context))
          ],
        ),
      ]),
    );
  }

  double additionTotalExpenseCategory() {
    double totalPriceCategory = 0;
    for (var element in categoryModelData!) {
      if (element.amount != null) {
        totalPriceCategory += element.amount!;
      }
    }
    return totalPriceCategory;
  }
}
