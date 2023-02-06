import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/models/work/work_model.dart';
import 'package:satefy_cage/ui/ui/hurdle/uikit/criteria_card.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Блок критерия барьера
class CriteriaBlock extends StatelessWidget {
  final Work criteria;
  final int index;
  final bool? isInitiallyExpanded;

  const CriteriaBlock({
    Key? key,
    required this.criteria,
    required this.index,
    this.isInitiallyExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CriteriaHead(criteria: criteria, index: index),
        CriteriaBody(criteria: criteria, index: index),
        ExpandableCheckList(
          criteria: criteria,
          isInitiallyExpanded: isInitiallyExpanded,
        ),
      ],
    );
  }
}

///Шапка критерия
class CriteriaHead extends StatelessWidget {
  final Work criteria;
  final int index;

  const CriteriaHead({
    Key? key,
    required this.criteria,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
        vertical: 14.h,
      ),
      color: AppColors.paleBlue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
                text: 'Критерий ${index + 1}',
                style: AppTypography.semiboldStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  fontSize: 16.w,
                ),
                children: [
                  WidgetSpan(
                      child: SizedBox(
                    width: 15.w,
                  )),
                  TextSpan(
                      text: criteria.work_id ?? '',
                      style: AppTypography.regularStyle.copyWith(
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white))
                ]),
          ),
        ],
      ),
    );
  }
}

///Тело критерия
class CriteriaBody extends StatelessWidget {
  final Work criteria;
  final int index;

  const CriteriaBody({
    Key? key,
    required this.criteria,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
        vertical: 12.h,
      ),
      color: AppColors.paleBlueLight,
      child: Text(
        criteria.work_name ?? '',
        style: AppTypography.regularStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 17.w,
          color: AppColors.mainText,
        ),
      ),
    );
  }
}

class ExpandableCheckList extends StatelessWidget {
  final bool? isInitiallyExpanded;
  final Work criteria;

  const ExpandableCheckList(
      {Key? key, this.isInitiallyExpanded, required this.criteria})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(
        top: 4.h,
        bottom: 7.h,
      ),
      child: Container(
        color: AppColors.paleBlueLight,
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 22.w),
          initiallyExpanded: isInitiallyExpanded ?? false,
          title: Text(
            'Чек-лист',
            style: AppTypography.semiboldStyle.copyWith(
              fontSize: 16.w,
              fontWeight: FontWeight.w600,
              color: AppColors.mainText,
            ),
          ),
          textColor: AppColors.mainText,
          iconColor: AppColors.mainText,
          collapsedIconColor: AppColors.mainText,
          children: [
            Column(
              children: [
                Container(
                  color: AppColors.white,
                  height: 4.h,
                ),
                if (criteria.questions?.isNotEmpty == true)
                  for (var question in criteria.questions!)
                    CriteriaCard(
                      criteria: Hive.box<Passports>('passports')
                          .values
                          .first
                          .questions!
                          .firstWhere(
                              (element) => element.question_id == question),
                      isLast: criteria.questions!
                              .indexOf(Hive.box<Passports>('passports')
                                  .values
                                  .first
                                  .questions!
                                  .firstWhere(
                                    (element) =>
                                        element.question_id == question,
                                  )
                                  .question_id!) ==
                          criteria.questions!.length - 1,
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
