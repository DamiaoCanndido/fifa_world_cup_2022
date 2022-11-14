import 'package:flutter/material.dart';

class FWCAppBar extends AppBar {
  FWCAppBar({
    super.key,
    super.title,
    super.elevation = 2,
    super.backgroundColor,
    super.centerTitle = true,
    super.iconTheme = const IconThemeData(color: Colors.white),
    super.bottom,
    super.actions,
  });
}
