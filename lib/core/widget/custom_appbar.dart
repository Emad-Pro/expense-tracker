import 'package:expense_tracker/core/AppLocalizations/app_localizations.dart';
import 'package:expense_tracker/core/profile_service/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context)
          .padding
          .copyWith(left: 15, top: 10, bottom: 10, right: 10),
      child: Row(
        children: [
          Initicon(
            backgroundColor: const Color.fromARGB(255, 74, 20, 140),
            text: ProfileService.userName!,
          ),
          Padding(
            padding: MediaQuery.of(context)
                .padding
                .copyWith(left: 10.0, right: 10.0),
            child: Text(
              "${"welcome".tr(context).toUpperCase()}, ${ProfileService.userName}",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaler.scale(16),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.settings)),
        ],
      ),
    );
  }
}
