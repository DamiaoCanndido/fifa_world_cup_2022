import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
          LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60,
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back(closeOverlays: true);
      }
    });
  }
}
