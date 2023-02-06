import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class HomeButton extends StatelessWidget {
  final String pathToAsset;
  final String label;
  final VoidCallback? onTap;

  const HomeButton({
    Key? key,
    required this.pathToAsset,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.homeBtnColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(pathToAsset),
              const SizedBox(
                height: 8,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTypography.mediumStyle.copyWith(
                  fontSize: 19.w,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.01,
                  color: AppColors.mainText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
