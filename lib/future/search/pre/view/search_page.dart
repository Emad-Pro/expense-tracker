import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';
import 'package:expense_tracker/core/expenses_model/expenses_model.dart';
import 'package:expense_tracker/future/expense/data/model/expanse_model_getData.dart';
import 'package:expense_tracker/future/search/pre/view/search_page_box_search.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key, this.expanseModelGetData}) : super(key: key);
  final List<ExpensesModel>? expanseModelGetData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Accordion(
              headerBorderColor: Colors.red,
              headerBorderColorOpened: Colors.transparent,
              headerBackgroundColorOpened:
                  Theme.of(context).colorScheme.inversePrimary,
              contentBackgroundColor: Theme.of(context).colorScheme.background,
              contentBorderColor: Theme.of(context).colorScheme.inversePrimary,
              contentBorderWidth: 3,
              contentHorizontalPadding: 20,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              header: const Text(
                'Android',
              ),
              children: [
                AccordionSection(
                  isOpen: true,
                  rightIcon: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  headerBorderColor: Theme.of(context).colorScheme.background,
                  headerBackgroundColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  contentVerticalPadding: 20,
                  leftIcon: Icon(Icons.search,
                      color: Theme.of(context).colorScheme.background),
                  header: Text('Search Box',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                  content: SearchPageBoxSearch(),
                ),
              ]),
        ],
      ),
    );
  }
}
