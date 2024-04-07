import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/get_It/service_locator.dart';

import 'package:expense_tracker/core/widget/listView_expense_item.dart';
import 'package:expense_tracker/future/expense/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastestEnteries extends StatelessWidget {
  const LastestEnteries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lastest Enteries".tr(context)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          return ListViewExpenseItem(
            getExpansesModel: state.getExpansesModel,
            isSlidable: true,
            choiceCubit: "expenseCubit",
          );
        },
      ),
    );
  }
}
