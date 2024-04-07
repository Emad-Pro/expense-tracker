import 'package:flutter/material.dart';

PreferredSizeWidget? settingScreenAppBar(context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text("setting".toUpperCase()),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    );
