import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/favorite/bloc/favorites_cubit.dart';
import 'package:satefy_cage/ui/ui/favorite/uikit/empty_widget.dart';
import 'package:satefy_cage/ui/ui/favorite/uikit/favorite_pass.dart';
import 'package:satefy_cage/ui/uikit/back_button.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

///Экран "Избранное"
class FavoriteScreen extends StatelessWidget {
  final VoidCallback onHome;

  const FavoriteScreen({Key? key, required this.onHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        bloc: context.read<FavoritesCubit>(),
        builder: (_, state) => Scaffold(
              backgroundColor: AppColors.mainBlue,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 22,
                        right: 22,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawBackButton(onTap: () => onHome()),
                          Text(
                            'Избранное',
                            style: AppTypography.boldStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 26.w,
                            ),
                          ),
                          Container(
                            width: 38.w,
                          ),
                        ],
                      ),
                    ),
                    Hive.box<Favorites>('favorites')
                                .values
                                .first
                                .favoriteHurdles
                                ?.isEmpty ==
                            true
                        ? const EmptyFavorites()
                        : Expanded(
                            child: Container(
                              color: AppColors.white,
                              child: ListView(
                                children: [
                                  if (Hive.box<Passports>('passports')
                                          .isNotEmpty ==
                                      true)
                                    for (final passport in Hive.box<Passports>(
                                            'passports')
                                        .values
                                        .first
                                        .passports!
                                        .where((element) => element.hurdle!.any(
                                            (element) =>
                                                Hive.box<Favorites>('favorites')
                                                    .values
                                                    .first
                                                    .favoriteHurdles
                                                    ?.contains(
                                                        element.hurdle_id) ==
                                                true)))
                                      FavoritePassport(
                                        passport: passport,
                                      )
                                ],
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ));
  }
}
