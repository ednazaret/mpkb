import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/hurdle/ui/hurdle_screen.dart';
import 'package:satefy_cage/ui/uikit/hurdle_widget/hurdle_card.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

import '../../../../models/favorites/favorites_model.dart';

class FavoritePassport extends StatelessWidget {
  final Passport passport;

  const FavoritePassport({Key? key, required this.passport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 4.h),
        title: Text(
          passport.passport_name ?? '',
          style: AppTypography.regularStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18.w,
            color: AppColors.mainText,
          ),
        ),
        collapsedBackgroundColor: AppColors.paleBlueLight,
        backgroundColor: AppColors.paleBlueLight,
        iconColor: AppColors.paleBlue,
        children: [
          Container(
            width: double.infinity,
            color: AppColors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final hurdle in passport.hurdle!.where((element) =>
                    Hive.box<Favorites>('favorites')
                        .values
                        .first
                        .favoriteHurdles
                        ?.contains(element.hurdle_id) ==
                    true))
                  HurdleCard(
                    hurdle: hurdle,
                    expandableText: true,
                    isFav: true,
                    onTap: () => Navigator.push(
                        context,
                        PageTransition(
                            child: HurdleScreen(
                                hurdle: Hive.box<Passports>('passports')
                                    .values
                                    .first
                                    .hurdles!
                                    .firstWhere((element) =>
                                        element.hurdle_id == hurdle.hurdle_id)),
                            type: PageTransitionType.rightToLeft)),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
