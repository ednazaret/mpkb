import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class SearchWidget extends StatelessWidget {
  final int queryLength;

  const SearchWidget({Key? key, required this.queryLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: double.infinity,
          height: 80.h,
        ),
        Assets.images.noresults.svg(
          width: 81.w,
          height: 81.w,
        ),
        Text(
          (queryLength) < 3 ? 'Работа с поиском' : "Нет результата",
          style: AppTypography.mediumStyle.copyWith(
            fontSize: 17.w,
            fontWeight: FontWeight.w600,
            color: AppColors.mainText,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          (queryLength) < 3
              ? "Начните вводить ключевые слова"
              : 'По вашему запросу ничего не найдено',
          style: AppTypography.mediumStyle.copyWith(
            fontSize: 14.w,
            fontWeight: FontWeight.w600,
            color: AppColors.paleBlue,
          ),
        ),
      ],
    );
  }
}
