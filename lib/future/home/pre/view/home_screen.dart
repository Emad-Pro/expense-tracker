import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:expense_tracker/core/enum/enum.dart';
import 'package:expense_tracker/future/home/data/model/expense_model.dart';
import 'package:expense_tracker/future/home/pre/view/widget/custom_appbar.dart';
import 'package:expense_tracker/future/home/pre/view/widget/custom_categories_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/custom_icons_stack_widget.dart';
import 'package:expense_tracker/future/home/pre/view/widget/expenses_total_widget.dart';
import 'package:expense_tracker/future/home/pre/viewModel/cubit/expense_cubit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          switch (state.getDatabaseExpansesState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.sucess:
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppbar(),
                    ExpensesTotalWidget(
                      expenseState: state,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const CategoriesGridView(),
                    Spacer(),
                    if (state.getDatabaseExpansesModel != null)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 20),
                            child: Row(
                              children: [
                                const Text(
                                  "Lastest Enteries",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {},
                                  child: const Text("View all"),
                                )
                              ],
                            ),
                          ),
                          BuildListView(
                            expenseState: state,
                          ),
                        ],
                      ),
                    AddExpenseItem()
                  ],
                ),
              );
            case RequestState.erorr:
              return Text(state.messageExpansesText);
          }
        },
      )),
    );
  }
}

class AddExpenseItem extends StatelessWidget {
  AddExpenseItem({
    super.key,
  });
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dateController.text = DateFormat.yMEd().format(DateTime.now()).toString();
    timeController.text = DateFormat.Hm().format(DateTime.now()).toString();
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent[700]),
            onPressed: () {
              Alert(
                context: context,
                type: AlertType.none,
                style: AlertStyle(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    isCloseButton: false,
                    isButtonVisible: false),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "add new expense",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "enter the details of your expense to help you track your spending",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextFormField(
                          controller: amountController,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelText: 'Enter Amount',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelText: 'Description',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropDownCategoriesWidget(
                        categoriesController: categoriesController),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: [
                          DateFormFiledWidget(
                            dateController: dateController,
                          ),
                          const Spacer(),
                          TimeTextFormfiledWidget(
                            timeController: timeController,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          onPressed: () async {
                            BlocProvider.of<ExpenseCubit>(context)
                                .addNewDataFromDatabase(ExpanseModel.fromMap({
                              'description': descriptionController.text,
                              'amount': amountController.text,
                              'date': dateController.text,
                              'categories': categoriesController.text,
                              'time': timeController.text,
                            }));
                          },
                          child: const Text("Add Expense"),
                        ),
                      ),
                    )
                  ],
                ),
              ).show();
            },
            child: Text(
              "Add Expenses",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground),
            )),
      ),
    );
  }
}

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

class DateFormFiledWidget extends StatelessWidget {
  const DateFormFiledWidget({Key? key, required this.dateController})
      : super(key: key);
  final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.39,
        child: TextFormField(
          readOnly: true,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Enter Date",
              prefixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    BottomPicker.date(
                      closeIconColor:
                          Theme.of(context).colorScheme.onBackground,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      title: 'Set your Expenses DateTime',
                      dateOrder: DatePickerDateOrder.dmy,
                      maxDateTime: DateTime.now(),
                      minDateTime: DateTime(1980),
                      pickerTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      titleStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                      onChange: (index) {
                        dateController.text =
                            DateFormat.yMEd().format(index).toString();
                      },
                      onSubmit: (index) {
                        dateController.text =
                            DateFormat.yMEd().format(index).toString();
                      },
                      bottomPickerTheme: BottomPickerTheme.orange,
                    ).show(context);
                  })),
          controller: dateController,
        ),
      ),
    );
  }
}

class TimeTextFormfiledWidget extends StatelessWidget {
  const TimeTextFormfiledWidget({Key? key, required this.timeController})
      : super(key: key);
  final TextEditingController timeController;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextFormField(
          readOnly: true,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Enter Time",
              prefixIcon: IconButton(
                  icon: const Icon(Icons.access_time_sharp),
                  onPressed: () {
                    BottomPicker.time(
                      closeIconColor:
                          Theme.of(context).colorScheme.onBackground,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      title: 'Set your Expenses time',
                      initialTime: Time.now(),
                      pickerTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      titleStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                      onChange: (index) {
                        timeController.text =
                            DateFormat.Hm().format(index).toString();
                      },
                      onSubmit: (index) {
                        timeController.text =
                            DateFormat.Hm().format(index).toString();
                      },
                      bottomPickerTheme: BottomPickerTheme.orange,
                    ).show(context);
                  })),
          controller: timeController,
        ),
      ),
    );
  }
}

class BuildListView extends StatelessWidget {
  const BuildListView({super.key, required this.expenseState});
  final ExpenseState expenseState;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
            itemCount: expenseState.getDatabaseExpansesModel!.length,
            itemBuilder: (context, index) {
              return BuildItemListView(
                amount: expenseState.getDatabaseExpansesModel![index].amount!,
                title:
                    expenseState.getDatabaseExpansesModel![index].description,
                date: expenseState.getDatabaseExpansesModel![index].date!,
              );
            }));
  }
}

class BuildItemListView extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const BuildItemListView(
      {super.key,
      required this.title,
      required this.amount,
      required this.date});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          const CustomIconsStackWidget(),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          const Spacer(),
          Text(
            "$amount 10\$",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.4,
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.18,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const CustomCategoriesWidget();
          }),
    );
  }
}
