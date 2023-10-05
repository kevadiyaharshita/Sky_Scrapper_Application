import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/Theme_Controller.dart';

Color IconTextColor(BuildContext context) {
  return Provider.of<ThemeController>(context, listen: false).getTheme
      ? Colors.white54
      : Colors.black54;
}
