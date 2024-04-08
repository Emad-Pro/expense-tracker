import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/core/method/method_date.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:expense_tracker/core/widget/show_bottom_SheetEdit_expense_widget.dart';
import 'package:expense_tracker/future/categoires/view_model/cubit/category_cubit.dart';

import 'package:expense_tracker/future/expense/pre/view/widget/custom_icons_stack_widget.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BuildItemListViewLastTestEnteries extends StatefulWidget {
  final ExpensesModel expensesModel;
  final bool isSlidable;
  final String? choseCubit;
  final String? categoryName;
  const BuildItemListViewLastTestEnteries(
      {super.key,
      required this.expensesModel,
      required this.isSlidable,
      this.categoryName,
      this.choseCubit});

  @override
  State<BuildItemListViewLastTestEnteries> createState() =>
      _BuildItemListViewLastTestEnteriesState();
}

class _BuildItemListViewLastTestEnteriesState
    extends State<BuildItemListViewLastTestEnteries>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      margin: const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 10),
      child: Slidable(
        enabled: widget.isSlidable,
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                if (widget.choseCubit == "expenseCubit") {
                  BlocProvider.of<ExpenseCubit>(context)
                      .deleteDataFromDatabase(widget.expensesModel);
                } else if (widget.choseCubit == "categoryCubit") {
                  BlocProvider.of<CategoryCubit>(context).deleteItemWithId(
                      widget.expensesModel.id,
                      widget.expensesModel.categories!);
                }
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete'.tr(context),
            ),
            SlidableAction(
              onPressed: (BuildContext context) {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return ShowBottomSheetEditExpenseWidget(
                        expensesModel: widget.expensesModel,
                      );
                    });
              },
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit_note_outlined,
              label: 'Edit'.tr(context),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomIconsStackWidget(expensesModel: widget.expensesModel),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.expensesModel.description!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${convertDateToDayYearMounth(widget.expensesModel.date!.toString())}, ${convertTime(widget.expensesModel.time!.toString())}",
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              "${widget.expensesModel.amount} ${ProfileService.currancy.toString().tr(context)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
