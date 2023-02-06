import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/favorite/bloc/favorites_cubit.dart';
import 'package:satefy_cage/ui/ui/hurdle/uikit/criteria_block.dart';
import 'package:satefy_cage/ui/ui/hurdle/uikit/materials_block.dart';
import 'package:satefy_cage/ui/ui/hurdle/uikit/mub_card.dart';
import 'package:satefy_cage/ui/uikit/back_button.dart';
import 'package:satefy_cage/ui/uikit/favorite_button.dart';
import 'package:satefy_cage/ui/uikit/hurdle_widget/hurdle_card.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Экран барьера с полной информацией о нем
class HurdleScreen extends StatelessWidget {
  final Hurdle hurdle;
  final String? passportName;
  final bool? mubInitiallyExpanded;

  const HurdleScreen(
      {super.key,
      required this.hurdle,
      this.passportName,
      this.mubInitiallyExpanded});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        bloc: context.read<FavoritesCubit>(),
        builder: (context, state) => Scaffold(
              backgroundColor: AppColors.mainBlue,
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                        right: 22,
                        bottom: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawBackButton(
                            onTap: () => Navigator.pop(context),
                          ),
                          FavoriteButton(
                            onTap: () async => Hive.box<Favorites>('favorites')
                                        .values
                                        .first
                                        .favoriteHurdles
                                        ?.contains(hurdle.hurdle_id) ==
                                    false
                                ? await context.read<FavoritesCubit>().addToFav(
                                      favoriteId: hurdle.hurdle_id!,
                                    )
                                : await context
                                    .read<FavoritesCubit>()
                                    .removeFromFav(
                                      favoriteId: hurdle.hurdle_id!,
                                    ),
                            isInFav: Hive.box<Favorites>('favorites')
                                    .values
                                    .first
                                    .favoriteHurdles
                                    ?.contains(hurdle.hurdle_id) ==
                                false,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: AppColors.white,
                      child: ListView(
                        children: [
                          HurdleCard(
                            hurdle: hurdle,
                            boldText: true,
                            expandableText: true,
                            showFav: false,
                            customBackgroundColor: AppColors.paleBlueLight,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          ExpansionTile(
                            backgroundColor: AppColors.paleBlueLight,
                            initiallyExpanded: mubInitiallyExpanded ?? false,
                            title: Text(
                              'МЕСТО УСТАНОВКИ БАРЬЕРА (МУБ)',
                              style: AppTypography.semiboldStyle.copyWith(
                                fontSize: 14.w,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainText,
                              ),
                            ),
                            collapsedBackgroundColor: AppColors.paleBlueLight,
                            textColor: AppColors.mainText,
                            iconColor: AppColors.mainText,
                            collapsedIconColor: AppColors.mainText,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 4,
                                    color: AppColors.white,
                                  ),
                                  if (hurdle.myb != null)
                                    for (int index = 0;
                                        index < hurdle.myb!.length;
                                        index++)
                                      MubCard(
                                        index: index,
                                        text: hurdle.myb![index],
                                        isLast: index == hurdle.myb!.length - 1
                                            ? true
                                            : false,
                                      ),
                                ],
                              )
                            ],
                          ),
                          ((hurdle.picture == null && hurdle.video == null) ||
                                  (hurdle.picture == 'None' &&
                                      hurdle.video == 'None'))
                              ? const SizedBox(
                                  height: 35,
                                )
                              : MaterialsBlock(
                                  pictureLink: hurdle.picture,
                                  videoLink: hurdle.video,
                                ),
                          if (Hive.box<Passports>('passports').isNotEmpty)
                            for (var criteria
                                in Hive.box<Passports>('passports')
                                    .values
                                    .first
                                    .hurdles!
                                    .firstWhere((element) =>
                                        element.hurdle_id == hurdle.hurdle_id)
                                    .work!)
                              CriteriaBlock(
                                criteria: Hive.box<Passports>('passports')
                                    .values
                                    .first
                                    .work!
                                    .firstWhere((element) =>
                                        element.work_id == criteria),
                                index: Hive.box<Passports>('passports')
                                    .values
                                    .first
                                    .hurdles!
                                    .firstWhere((element) =>
                                        element.hurdle_id == hurdle.hurdle_id)
                                    .work!
                                    .indexOf(criteria),
                              )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ));
  }
}
