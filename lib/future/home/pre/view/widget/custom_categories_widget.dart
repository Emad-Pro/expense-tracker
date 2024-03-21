import 'package:expense_tracker/future/home/pre/view/widget/custom_icons_stack_widget.dart';
import 'package:flutter/material.dart';

class CustomCategoriesWidget extends StatelessWidget {
  const CustomCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withOpacity(0.2)
                  : Colors.white.withOpacity(0.2),
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black.withOpacity(0.2)
                  : Colors.white.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            stops: const [
              0.2,
              1.2,
            ],
          )),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconsStackWidget(),
            SizedBox(
              height: 14,
            ),
            Text(
              "Medical",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "\$ 100",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
