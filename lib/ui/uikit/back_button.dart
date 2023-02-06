import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class RawBackButton extends StatelessWidget {
  const RawBackButton({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 34.w,
        height: 34.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(4.r)),
        child: Center(
          child: Assets.images.backarrow.svg(),
        ),
      ),
    );
  }
}
