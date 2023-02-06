import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/models/question/question_model.dart';
import 'package:satefy_cage/ui/ui/hurdle/uikit/pdf_screen.dart';
import 'package:satefy_cage/ui/ui/hurdle/utils/applications_mask.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Карточка критерия в раскрывающемся списке
class CriteriaCard extends StatelessWidget {
  const CriteriaCard({Key? key, this.isLast, this.criteria}) : super(key: key);

  final bool? isLast;
  final Question? criteria;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.paleBlueLight,
      ),
      padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            criteria?.question_id ?? '',
            style: AppTypography.regularStyle.copyWith(
              fontSize: 14.w,
              fontWeight: FontWeight.w500,
              color: AppColors.paleBlue,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: CheckListBody(
                    criteria: criteria,
                  ),
                )
              ],
            ),
          ),
          isLast == true
              ? const SizedBox()
              : const Divider(
                  color: AppColors.paleBlue,
                )
        ],
      ),
    );
  }
}

class CheckListBody extends StatelessWidget {
  static TextStyle textStyle = AppTypography.regularStyle.copyWith(
    fontSize: 17.w,
    fontWeight: FontWeight.w400,
    color: AppColors.mainText,
  );
  final Question? criteria;

  const CheckListBody({
    Key? key,
    this.criteria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool containsApplication = false;
    List<String>? formattedData = [];
    for (final application in ApplicationMask.values) {
      if (criteria?.question_name?.contains(application) == true) {
        containsApplication = true;
        formattedData = criteria?.question_name?.split(application);
        formattedData?.add(application);
        final String temp = formattedData![1];
        formattedData[1] = application;
        formattedData[2] = temp;
      }
    }
    return containsApplication == false
        ? Text(
            criteria?.question_name ?? '',
            textAlign: TextAlign.left,
            style: textStyle,
          )
        : RichText(
            text: TextSpan(
                text: formattedData?.first ?? '',
                style: textStyle,
                children: [
                WidgetSpan(
                    child: InkWell(
                  onTap: () async {
                    final doc = await PDFDocument.fromAsset(
                        "assets/media/application/${criteria!.media}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PdfScreen(
                          applicationPath: '${criteria!.media}',
                          document: doc,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    formattedData?[1] ?? '',
                    style: textStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.orange,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
                TextSpan(text: formattedData![2], style: textStyle)
              ]));
  }
}
