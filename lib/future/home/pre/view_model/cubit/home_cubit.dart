import 'package:bloc/bloc.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/future/categoires/view/categories_screen.dart';
import 'package:expense_tracker/future/expense/pre/view/expense_page.dart';
import 'package:expense_tracker/future/search/pre/view/search_page.dart';
import 'package:expense_tracker/future/settingScreen/pre/view/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({this.expanseModelGetData}) : super(const HomeState());
  final List<ExpensesModel>? expanseModelGetData;
  // صفحة العرض الخاصة ب bottomBar
  late PageController pageController; // controller View Page
  bool isbottomsheetshown = false; //المتغير الخاص بحالة فتح bottomSheet
  int selectedIndex = 0; //الانديكس الخاص بالصفحات

  final GlobalKey<ScaffoldState> scaffoldkey =
      GlobalKey<ScaffoldState>(); //خاص ب scaffold الصفحة الرئيسية للبيانات
  // صفحة العرض الخاصة ب bottomBar
  //خصائص showBottomSheet
  bool showBottomSheet = false;
  IconData floatingActionButtonIcon = Icons.add;
  Color colofloating = Colors.indigo;
  //خصائص showBottomSheet
//صفحات bottomNavigationBar
  List<BarItem> barItems(context) => [
        BarItem(
            icon: Icons.home,
            title: 'Home'.tr(context),
            activeColor: Colors.blue,
            inactiveColor: Theme.of(context).colorScheme.onBackground),
        BarItem(
            icon: Icons.category,
            title: 'Categorys'.tr(context),
            activeColor: Colors.blue,
            inactiveColor: Theme.of(context).colorScheme.onBackground),
        BarItem(
            icon: CupertinoIcons.search,
            title: 'Search'.tr(context),
            activeColor: Colors.blue,
            inactiveColor: Theme.of(context).colorScheme.onBackground),
        BarItem(
            icon: Icons.tune_rounded,
            title: 'Settings'.tr(context),
            activeColor: Colors.blue,
            inactiveColor: Theme.of(context).colorScheme.onBackground),

        /// Add more BarItem if you want
      ];
//صفحات bottomNavigationBar
  List<Widget> listOfWidget() => [
        const ExpensePage(),
        const CategoriesScreen(),
        const SearchPage(),
        const SettingPage(),
      ];
  //تهيئة صفحات bottomBar
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
  }

//تهيئة صفحات bottomBar
//زر التبديل بين صفحة bttombar مع اضافة انميتيد
  void onButtonPressed(int index) {
    selectedIndex = index;
    pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
    emit(ChangePageBottomNavigationBarHomeState());
  }

//زر فتح وقفل ShowBottomSheet مع اضافة بعض الخصائص
//1. تحويل شكل الزر عند الفتح
// تغيير لون الزر عند الفتح
  void onBottomSheetPressed(
      {required bool show, required IconData icon, required Color color}) {
    isbottomsheetshown = show;
    floatingActionButtonIcon = icon;
    colofloating = color;
    emit(ChangeBottomSheetHomeState());
  } // تغيير لون الزر عند الفتح
}
