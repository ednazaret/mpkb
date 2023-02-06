import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/hurdle/uikit/criteria_block.dart';
import 'package:satefy_cage/ui/ui/illustration/model/points_model.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Боттомшит для критериев на иллюстрации с чек-листами
class IllustrationBottomSheet extends StatelessWidget {
  final PointModel point;

  const IllustrationBottomSheet({Key? key, required this.point})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.15),
              offset: const Offset(0, -3),
              spreadRadius: 0.3,
              blurRadius: 1.5)
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.r,
          ),
          topRight: Radius.circular(
            16.r,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 30.h
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 155.w,
            height: 5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99.r),
              color: AppColors.lightGray,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            constraints: BoxConstraints.expand(height: 450.h),
            padding: EdgeInsets.only(bottom: 24.h),
            child: ListView.builder(
              itemCount: Hive.box<Passports>('passports')
                  .values
                  .first
                  .work!
                  .where((element) => element.work_id == point.criteria_id)
                  .length,
              itemBuilder: (_, index) => CriteriaBlock(
                criteria: Hive.box<Passports>('passports')
                    .values
                    .first
                    .work!
                    .where((element) => element.work_id == point.criteria_id)
                    .toList()[index],
                isInitiallyExpanded: true,
                index: Hive.box<Passports>('passports')
                    .values
                    .first
                    .hurdles!
                    .firstWhere((element) =>
                        element.work?.contains(point.criteria_id) == true)
                    .work!
                    .indexOf(point.criteria_id!),
              ),
            ),
          )
          // Hive.box<Passports>('passports')
          //             .values
          //             .first
          //             .work!
          //             .firstWhere(
          //                 (element) => element.work_id == point.criteria_id)
          //             .questions!
          //             .length >
          //         1
          //     ? Container(
          //         constraints: BoxConstraints.expand(height: 300.h),
          //         child: ListView.builder(
          //           itemCount: Hive.box<Passports>('passports')
          //               .values
          //               .first
          //               .work!
          //               .where(
          //                   (element) => element.work_id == point.criteria_id)
          //               .length,
          //           itemBuilder: (_, index) => CriteriaBlock(
          //             criteria: Hive.box<Passports>('passports')
          //                 .values
          //                 .first
          //                 .work!
          //                 .where(
          //                     (element) => element.work_id == point.criteria_id)
          //                 .toList()[index],
          //             // isInitiallyExpanded:true,
          //             index: Hive.box<Passports>('passports')
          //                 .values
          //                 .first
          //                 .hurdles!
          //                 .firstWhere((element) =>
          //                     element.work?.contains(point.criteria_id) == true)
          //                 .work!
          //                 .indexOf(point.criteria_id!),
          //           ),
          //         ),
          //       )
          //     : CriteriaBlock(
          //         criteria: Hive.box<Passports>('passports')
          //             .values
          //             .first
          //             .work!
          //             .firstWhere(
          //                 (element) => element.work_id == point.criteria_id),
          //         isInitiallyExpanded:true,
          //         index: Hive.box<Passports>('passports')
          //             .values
          //             .first
          //             .hurdles!
          //             .firstWhere((element) =>
          //                 element.work?.contains(point.criteria_id) == true)
          //             .work!
          //             .indexOf(point.criteria_id!),
          //       ),
        ],
      ),
    );
  }
}
