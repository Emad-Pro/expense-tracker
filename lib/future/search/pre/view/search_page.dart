import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/enum/enum.dart';

import 'package:expense_tracker/core/widget/build_item_listView_lastTest_enteries.dart';
import 'package:expense_tracker/future/search/pre/view/search_page_box_search.dart';
import 'package:expense_tracker/future/search/pre/view_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

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
                  header: Text('Multiple search for expenses'.tr(context),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                  content: SearchPageBoxSearch(),
                ),
              ]),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              switch (state.searchBoxGetDataState) {
                case RequestState.loading:
                  return const CircularProgressIndicator();
                case RequestState.sucess:
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: ListView.builder(
                        itemCount: state.searchBoxGetDataModel!.length,
                        itemBuilder: (context, index) {
                          return BuildItemListViewLastTestEnteries(
                            expensesModel: state.searchBoxGetDataModel![index],
                            isSlidable: true,
                            choseCubit: "expenseCubit",
                          );
                        }),
                  );
                case RequestState.erorr:
                  return const Text("");
              }
            },
          )
        ],
      ),
    );
  }
}
