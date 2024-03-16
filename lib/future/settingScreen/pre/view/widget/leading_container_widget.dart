import 'package:flutter/material.dart';

class LeadingContainerWidget extends StatelessWidget {
  const LeadingContainerWidget(
      {super.key, required this.icon, required this.color});
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.08,
      height: MediaQuery.of(context).size.width * 0.08,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
