import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class CriteriaPoint extends StatelessWidget {
  final VoidCallback? onTap;

  const CriteriaPoint({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: const BoxDecoration(
          color: AppColors.mainBlue,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 14.w,
            height: 14.w,
            decoration: const BoxDecoration(
              color: AppColors.orange,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
