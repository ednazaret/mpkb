import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/search_screen/ui/search_screen.dart';
import 'package:satefy_cage/ui/ui/videos/uikit/video_card.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

class VideoBody extends StatelessWidget {
  final List<Passport> passports;

  const VideoBody({
    Key? key,
    required this.passports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.white,
        child: context.read<SearchCubit>().checkSearch()
            ? SearchScreen(
                typeOfSearch: TypeOfSearch.videos,
                passports: passports,
                query: context.read<SearchCubit>().state.query,
              )
            : ListView.builder(
                itemCount: passports.length,
                itemBuilder: (_, index) => VideoCard(
                  hurdles: passports[index].hurdle ?? [],
                  passName: passports[index].passport_name ?? '',
                ),
              ),
      ),
    );
  }
}
