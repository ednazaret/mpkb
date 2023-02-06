import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/hurdle/ui/hurdle_screen.dart';
import 'package:satefy_cage/ui/uikit/hurdle_widget/hurdle_card.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Тело экрана "Паспорт"
class PassportBody extends StatelessWidget {
  final Passport passport;

  const PassportBody({
    Key? key,
    required this.passport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 22,
                top: 24,
                bottom: 22,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ПАСПОРТ',
                    style: AppTypography.regularStyle.copyWith(
                      fontSize: 13.w,
                      fontWeight: FontWeight.w400,
                      color: AppColors.paleBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    passport.passport_name ?? '',
                    style: AppTypography.mediumStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 21.w,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            if (passport.hurdle != null)
              for (var hurdle in passport.hurdle!)
                HurdleCard(
                  hurdle: Hive.box<Passports>('passports')
                      .values
                      .first
                      .hurdles!
                      .firstWhere(
                          (element) => element.hurdle_id == hurdle.hurdle_id),
                  expandableText: true,
                  regularTextStyle: true,
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                      child: HurdleScreen(
                          passportName: passport.passport_name,
                          hurdle: Hive.box<Passports>('passports')
                              .values
                              .first
                              .hurdles!
                              .firstWhere((element) =>
                                  element.hurdle_id == hurdle.hurdle_id)),
                      type: PageTransitionType.rightToLeft,
                    ),
                  ),
                  isFav: Hive.box<Favorites>('favorites')
                          .values
                          .first
                          .favoriteHurdles
                          ?.contains(Hive.box<Passports>('passports')
                              .values
                              .first
                              .hurdles!
                              .firstWhere((element) =>
                                  element.hurdle_id == hurdle.hurdle_id)
                              .hurdle_id) ==
                      true,
                  customBackgroundColor: passport.hurdle!.indexOf(hurdle).isEven
                      ? AppColors.paleBlueLight
                      : AppColors.white,
                ),
          ],
        ),
      ),
    );
  }
}
