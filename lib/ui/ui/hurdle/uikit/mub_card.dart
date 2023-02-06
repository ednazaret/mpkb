import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Карточка МУБ
class MubCard extends StatelessWidget {
  const MubCard({
    Key? key,
    required this.index,
    required this.text,
    this.isLast,
  }) : super(key: key);

  final int index;
  final bool? isLast;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.paleBlueLight,
      ),
      padding: const EdgeInsets.only(
        top: 18,
        left: 22,
        right: 22,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${index + 1}",
                style: AppTypography.regularStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.w,
                    color: AppColors.paleBlue),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: AppTypography.regularStyle.copyWith(
                    fontSize: 17.w,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainText,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          if (isLast == false)
            const Divider(
              color: AppColors.paleBlue,
            ),
        ],
      ),
    );
  }
}
