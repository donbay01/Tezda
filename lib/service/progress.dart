import 'package:e_commerce/components/loader.dart';
import 'package:flutter/material.dart';
import 'package:overlay_progress_indicator/overlay_progress_indicator.dart';

class ProgressService {
  static Future<void> show(BuildContext context) {
    return OverlayProgressIndicator.show(
      context: context,
      backgroundColor: Colors.black45,
      child: const LoaderPage(),
    );
  }

  static Future<void> hide() {
    return OverlayProgressIndicator.hide();
  }
}
