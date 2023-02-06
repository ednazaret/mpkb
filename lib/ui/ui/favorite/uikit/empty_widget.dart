import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70.h,
          ),
          Assets.images.starfilled.svg(
              width: 84.w,
              height: 81.h,
              color: AppColors.mainBlue.withOpacity(0.1)),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'В избранном пусто',
            textAlign: TextAlign.center,
            style: AppTypography.mediumStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17.w,
              color: AppColors.mainText,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Добавляйте барьеры в избранное\nдля быстрого доступа к ним',
            textAlign: TextAlign.center,
            style: AppTypography.mediumStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.w,
              color: AppColors.paleBlue,
            ),
          )
        ],
      ),
    ));
  }
}
