import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../theme/text_style.dart';

class SnackbarHelper {
  static displayToastMessage({
    required BuildContext context,
    required String message,
    Color? color,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: mediumText(primaryBlack),
        ),
        backgroundColor: color ?? primaryYellow,
      ),
    );
  }
}
