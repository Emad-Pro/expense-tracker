import 'package:expense_tracker/future/settingScreen/pre/view/widget/leading_container_widget.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? widget;
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  const CustomListTileWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      this.widget,
      this.onTap,
      required this.icon,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: widget ?? const Icon(Icons.keyboard_arrow_right),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      leading: LeadingContainerWidget(icon: icon, color: color),
    );
  }
}
