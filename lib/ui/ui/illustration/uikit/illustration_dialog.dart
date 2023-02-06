import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/gen/assets.gen.dart';
import 'package:satefy_cage/ui/ui/illustration/uikit/close_btn.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class IllustrationDialog extends StatelessWidget {
  const IllustrationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CloseBtn(onTap: () => Navigator.pop(context)),
              ),
              SizedBox(
                height: 120.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.w,
                    vertical: 18.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Критерии к изображению',
                        textAlign: TextAlign.center,
                        style: AppTypography.mediumStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainText,
                          fontSize: 14.w,
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        'Увеличивайте, уменьшайте и передвигайтесь по изображению\nс помощью касаний',
                        textAlign: TextAlign.center,
                        style: AppTypography.regularStyle.copyWith(
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                          color: AppColors.paleBlue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Assets.images.zoomHand.svg(
                              width: 55.w,
                              height: 55.w,
                            ),
                            DottedDashedLine(
                              height: 2.w,
                              width: 50.w,
                              axis: Axis.horizontal,
                              dashColor: AppColors.mainBlue,
                              dashWidth: 3.w,
                              dashHeight: 2.h,
                            ),
                            Assets.images.scrollHand.svg(
                              width: 55.w,
                              height: 55.w,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 23.w,
                            vertical: 13.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainBlue,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'ПЕРЕЙТИ К ИЗОБРАЖЕНИЮ',
                              style: AppTypography.mediumStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.w,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
