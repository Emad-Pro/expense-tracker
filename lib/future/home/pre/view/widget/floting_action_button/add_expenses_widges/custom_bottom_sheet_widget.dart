import 'package:expense_tracker/future/home/pre/view/widget/floting_action_button/add_expenses_widges/show_bottomsheet_widget.dart';
import 'package:expense_tracker/future/home/pre/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  CustomBottomSheetWidget({super.key, required this.scaffoldkey});
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey;
  @override
  Widget build(BuildContext context) {
    dateController.text = DateFormat('dd , MMM, yyy').format(DateTime.now());
    timeController.text = DateFormat.Hm().format(DateTime.now());
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: homeCubit.colofloating),
            onPressed: () async {
              if (homeCubit.showBottomSheet) {
                Navigator.pop(context);
              } else {
                scaffoldkey.currentState!
                    .showBottomSheet(
                      (context) => ShowBottomSheetWidget(
                          amountController: amountController,
                          descriptionController: descriptionController,
                          categoriesController: categoriesController,
                          dateController: dateController,
                          timeController: timeController),
                    )
                    .closed
                    .then((value) {
                  homeCubit.showBottomSheet = false;
                  homeCubit.onBottomSheetPressed(
                      color: Colors.indigo, show: false, icon: Icons.add);
                });
                homeCubit.showBottomSheet = true;
                homeCubit.onBottomSheetPressed(
                  show: true,
                  icon: Icons.close,
                  color: Colors.red,
                );
              }
            },
            child: Icon(
              homeCubit.floatingActionButtonIcon,
            ));
      },
    );
  }
}
