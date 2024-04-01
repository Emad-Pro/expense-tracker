import 'package:expense_tracker/future/expense/pre/view/expense_page.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/add_expenses_widges/custom_bottom_sheet_widget.dart';
import 'package:expense_tracker/future/expense/pre/view/widget/custom_appbar.dart';
import 'package:expense_tracker/future/home/pre/view_model/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key: BlocProvider.of<HomeCubit>(context).scaffoldkey,
          body: SafeArea(
            child: Column(
              children: [
                const CustomAppbar(),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller:
                        BlocProvider.of<HomeCubit>(context).pageController,
                    children:
                        BlocProvider.of<HomeCubit>(context).listOfWidget(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SlidingClippedNavBar.colorful(
            backgroundColor: Theme.of(context).colorScheme.background,
            onButtonPressed: (index) {
              BlocProvider.of<HomeCubit>(context).onButtonPressed(index);
            },
            iconSize: 25,
            selectedIndex: BlocProvider.of<HomeCubit>(context).selectedIndex,
            barItems: BlocProvider.of<HomeCubit>(context).barItems(context),
          ),
          floatingActionButton:
              BlocProvider.of<HomeCubit>(context).selectedIndex == 0
                  ? CustomBottomSheetWidget(
                      scaffoldkey:
                          BlocProvider.of<HomeCubit>(context).scaffoldkey)
                  : null,
          floatingActionButtonLocation:
              BlocProvider.of<HomeCubit>(context).showBottomSheet
                  ? FloatingActionButtonLocation.endDocked
                  : FloatingActionButtonLocation.startFloat,
        );
      },
    );
  }
}
