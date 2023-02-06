import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Тело сплэшскрина
class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          Assets.images.stripes.path,
          width: 375.w,
          filterQuality: FilterQuality.high,
        ),
        Padding(
          padding: EdgeInsets.only(top: 141.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.images.mainlogo.path,
                width: 200.w,
                height: 43.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 42.h,
                ),
                child: Text(
                  '«Каркас безопасности» (КБ) – процесс\nотбора и внедрения барьеров на пути\nреализации ключевых рисков Компании\nв области производственной безопасности',
                  textAlign: TextAlign.center,
                  style: AppTypography.regularStyle.copyWith(
                    fontSize: 15.w,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: 52.h),
          child: Text(
            'Внедрение программы КБ не отменяет существующих\nмероприятий в области производственной безопасности,\nа только дополняет эту деятельность',
            textAlign: TextAlign.center,
            style: AppTypography.regularStyle.copyWith(
                fontSize: 12.w,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGray.withOpacity(0.8)),
          ),
        ),
        Image.asset(
          Assets.images.stripes.path,
          width: 375.w,
          filterQuality: FilterQuality.high,
        ),
      ],
    );
  }
}
