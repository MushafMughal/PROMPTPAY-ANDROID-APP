import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget apiLoader() {
  return Container(
    width: double.maxFinite,
    height: 1.sh,
    color: Colors.transparent,
    child: Center(
      child: LoadingAnimationWidget.fallingDot(
        color: const Color(0xff0066FF),
        size: 75.sp,
      ),
    ),
  );
}

Future dialogApiLoader({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return apiLoader();
    },
  );
}
