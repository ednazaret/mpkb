import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/hurdle/ui/hurdle_screen.dart';
import 'package:satefy_cage/ui/ui/search_screen/uikit/hurdle_result_card.dart';
import 'package:satefy_cage/ui/ui/search_screen/uikit/mub_result_card.dart';
import 'package:satefy_cage/ui/ui/search_screen/uikit/search_widget.dart';
import 'package:satefy_cage/ui/ui/videos/uikit/video_card.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

enum TypeOfSearch {
  data,
  videos,
}

class SearchScreen extends StatelessWidget {
  final String? query;
  final TypeOfSearch? typeOfSearch;
  final List<Passport>? passports;

  const SearchScreen({
    Key? key,
    this.query,
    this.typeOfSearch,
    this.passports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => typeOfSearch == TypeOfSearch.videos
      ? _searchVideo(passports: passports)
      : _searchData(context: context);

  bool checkAllContaining({
    required String query,
    required Passport element,
  }) {
    String tempQuery = query;
    if (element.passport_name?.contains(tempQuery) == true ||
        element.passport_id?.contains(tempQuery) == true ||
        element.hurdle?.any((element) =>
                element.hurdle_name?.contains(tempQuery) == true ||
                element.hurdle_id
                        ?.toLowerCase()
                        .contains(tempQuery.toLowerCase()) ==
                    true ||
                checkMubContaining(hurdle: element, query: tempQuery)) ==
            true ||
        (Hive.box<Passports>('passports').values.first.hurdles?.any((elemen) =>
                elemen.myb!.any((el) => el.contains(tempQuery)) == true &&
                element.hurdle?.any(
                        (elemnt) => elemnt.hurdle_id == elemen.hurdle_id) ==
                    true) ==
            true)) {
      return true;
    }
    return false;
  }

  bool checkMubContaining({
    required Hurdle hurdle,
    String? query,
  }) {
    return (Hive.box<Passports>('passports')
                .values
                .first
                .hurdles
                ?.firstWhere((element) => element.hurdle_id == hurdle.hurdle_id)
                .myb
                ?.contains(query ?? '')) ==
            true
        ? true
        : false;
  }

  bool checkVideoContaining(
      {required String query, required Passport element}) {
    String tempQuery = query;

    if (element.hurdle?.any((element) =>
            element.hurdle_name == tempQuery ||
            element.hurdle_id == tempQuery) ==
        true) {
      return true;
    }
    return false;
  }

  Widget _buildItem(
      {required Passport passport, required BuildContext context}) {
    return checkAllContaining(query: query ?? '', element: passport)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 15,
                  top: 18,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      passport.passport_name ?? '',
                      style: AppTypography.mediumStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.w,
                        color: AppColors.mainBlue,
                      ),
                    ),
                    for (final hurdle in (passport.hurdle!.where((element) =>
                        element.hurdle_name?.contains(query ?? '') == true ||
                        element.hurdle_id
                                ?.toLowerCase()
                                .contains(query?.toLowerCase() ?? '') ==
                            true ||
                        Hive.box<Passports>('passports')
                                .values
                                .first
                                .hurdles
                                ?.firstWhere((elem) =>
                                    element.hurdle_id == elem.hurdle_id)
                                .myb
                                ?.any((el) => el.contains(query ?? '')) ==
                            true ||
                        passport.passport_name?.contains(query ?? '') == true)))
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 18,
                              top: 12,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ((hurdle.hurdle_id?.toLowerCase().contains(
                                                    query?.toLowerCase() ??
                                                        '') ==
                                                true &&
                                            query != null &&
                                            (query?.length ?? 0) > 2)) ==
                                        true
                                    ? SizedBox(
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            RichText(
                                              textAlign: TextAlign.start,
                                              text: TextSpan(
                                                text: hurdle.hurdle_id!
                                                    .toLowerCase()
                                                    .split(
                                                        query?.toLowerCase() ??
                                                            '')
                                                    .first
                                                    .toUpperCase(),
                                                style: AppTypography
                                                    .regularStyle
                                                    .copyWith(
                                                  fontSize: 14.w,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.paleBlue,
                                                ),
                                                children: [
                                                  TextSpan(
                                                      text: hurdle.hurdle_id
                                                                  ?.toLowerCase()
                                                                  .contains(
                                                                      query?.toLowerCase() ??
                                                                          '') ==
                                                              true
                                                          ? query?.toUpperCase()
                                                          : '',
                                                      style: AppTypography
                                                          .regularStyle
                                                          .copyWith(
                                                        fontSize: 14.w,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            AppColors.mainBlue,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: hurdle
                                                              .hurdle_id!
                                                              .toLowerCase()
                                                              .split(query
                                                                      ?.toLowerCase() ??
                                                                  '')
                                                              .last
                                                              .toUpperCase(),
                                                          style: AppTypography
                                                              .regularStyle
                                                              .copyWith(
                                                            fontSize: 14.w,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .paleBlue,
                                                          ),
                                                        ),
                                                      ]),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            hurdle.hurdle_id ?? '',
                                            style: AppTypography.regularStyle
                                                .copyWith(
                                              fontSize: 14.w,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.paleBlue,
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                ((hurdle.hurdle_name?.contains(query ?? '') ==
                                                true &&
                                            query != null &&
                                            (query?.length ?? 0) > 2)) ==
                                        true
                                    ? HurdleResult(
                                        query: query ?? '',
                                        hurdle: Hive.box<Passports>('passports')
                                            .values
                                            .first
                                            .hurdles!
                                            .firstWhere(
                                              (element) =>
                                                  element.hurdle_id ==
                                                      hurdle.hurdle_id ||
                                                  element.hurdle_name ==
                                                      hurdle.hurdle_name,
                                            ),
                                      )
                                    : InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => HurdleScreen(
                                              hurdle: Hive.box<Passports>(
                                                      'passports')
                                                  .values
                                                  .first
                                                  .hurdles!
                                                  .firstWhere(
                                                    (element) =>
                                                        element.hurdle_id ==
                                                            hurdle.hurdle_id ||
                                                        element.hurdle_name ==
                                                            hurdle.hurdle_name,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          hurdle.hurdle_name!,
                                          textAlign: TextAlign.left,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTypography.regularStyle
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.mainText,
                                            fontSize: 16.w,
                                          ),
                                        ),
                                      ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      if ((Hive.box<Passports>('passports')
                                              .values
                                              .first
                                              .hurdles!
                                              .firstWhere((element) =>
                                                  element.hurdle_id ==
                                                  hurdle.hurdle_id)
                                              .myb
                                              ?.where((element) =>
                                                  element.contains(query ?? ''))
                                              .toList()
                                              .isNotEmpty ==
                                          true))
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      for (final mub in (Hive.box<Passports>(
                                                  'passports')
                                              .values
                                              .first
                                              .hurdles!
                                              .firstWhere((element) =>
                                                  element.hurdle_id ==
                                                  hurdle.hurdle_id)
                                              .myb
                                              ?.where((eleme) =>
                                                  eleme.contains(query ?? '') ==
                                                  true)
                                              .toList() ??
                                          []))
                                        MubResult(
                                          query: query!,
                                          mub: mub,
                                          hurdle:
                                              Hive.box<Passports>('passports')
                                                  .values
                                                  .first
                                                  .hurdles!
                                                  .firstWhere((element) =>
                                                      element.hurdle_id ==
                                                      hurdle.hurdle_id),
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (passport.hurdle!
                                  .where((element) =>
                                      element.hurdle_name
                                              ?.contains(query ?? '') ==
                                          true ||
                                      element.hurdle_id
                                              ?.contains(query ?? '') ==
                                          true)
                                  .length >
                              1)
                            const SizedBox(
                              height: 12,
                            )
                        ],
                      ),
                  ],
                ),
              ),
              Divider(
                color: const Color(0xFFE2E2E2),
                height: 2.h,
              ),
            ],
          )
        : const Text('');
  }

  Widget _searchData({required BuildContext context}) {
    final data = (query?.length ?? 0) > 2 == true
        ? Hive.box<Passports>('passports')
            .values
            .first
            .passports
            ?.where((element) =>
                checkAllContaining(query: query ?? '', element: element))
            .toList()
        : Hive.box<Passports>('passports').values.first.passports?.toList();
    return Expanded(
      child: Container(
        color: Colors.white,
        child: (query?.length ?? 0) > 2 && data?.isNotEmpty == true
            ? ListView.builder(
                itemCount: data?.length,
                itemBuilder: (_, index) =>
                    _buildItem(passport: data![index], context: context))
            : SearchWidget(queryLength: query?.length ?? 0),
      ),
    );
  }

  Widget _searchVideo({List<Passport>? passports}) {
    final data = passports
        ?.where((element) =>
            element.passport_name
                    ?.toLowerCase()
                    .contains(query?.toLowerCase() ?? '') ==
                true ||
            element.hurdle?.any((element) =>
                    element.hurdle_name
                            ?.toLowerCase()
                            .contains(query?.toLowerCase() ?? '') ==
                        true ||
                    element.hurdle_id
                            ?.toLowerCase()
                            .contains(query?.toLowerCase() ?? '') ==
                        true) ==
                true)
        .toList();
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints.expand(),
      child: (query?.length ?? 0) > 2 && (data?.length ?? 0) > 0
          ? ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (_, index) => (query?.length ?? 0) > 2
                  ? VideoCard(
                      hurdles: data?[index]
                              .hurdle
                              ?.where(
                                (element) =>
                                    element.hurdle_name?.toLowerCase().contains(
                                              query?.toLowerCase() ?? '',
                                            ) ==
                                        true ||
                                    element.hurdle_id?.toLowerCase().contains(
                                              query?.toLowerCase() ?? '',
                                            ) ==
                                        true ||
                                    data[index]
                                            .passport_name
                                            ?.toLowerCase()
                                            .contains(
                                                query?.toLowerCase() ?? '') ==
                                        true,
                              )
                              .toList() ??
                          [],
                      passName: data?[index].passport_name ?? '',
                    )
                  : const Text(''),
            )
          : SearchWidget(queryLength: query?.length ?? 0),
    );
  }
}
