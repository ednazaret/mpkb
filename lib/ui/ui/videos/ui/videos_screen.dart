import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';
import 'package:satefy_cage/ui/ui/main_screen/bloc/search_cubit.dart';
import 'package:satefy_cage/ui/ui/videos/uikit/video_body.dart';
import 'package:satefy_cage/ui/uikit/back_button.dart';
import 'package:satefy_cage/ui/uikit/search_textfield.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class VideosScreen extends StatefulWidget {
  final VoidCallback onHome;

  const VideosScreen({Key? key, required this.onHome}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideosState();
}

class _VideosState extends State<VideosScreen> {
  TextEditingController controller = TextEditingController();
  late List<Passport> passports;

  @override
  void initState() {
    passports = getPassports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (_, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 22,
                  bottom: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RawBackButton(onTap: widget.onHome),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SearchTextField(
                            onTap: () => context
                                .read<SearchCubit>()
                                .enableSearch('Video'),
                            controller: controller,
                            query: context.read<SearchCubit>().state.query,
                            onChange: context.read<SearchCubit>().onTextChanged,
                            onClear: context.read<SearchCubit>().clearQuery,
                            onEdited: context.read<SearchCubit>().disableSearch,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Видео',
                      style: AppTypography.boldStyle.copyWith(
                        fontSize: 24.w,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              VideoBody(passports: passports)
            ],
          ),
        ),
      ),
    );
  }

  ///Получение объектов для VideoCard
  List<Passport> getPassports() {
    final box = Hive.box<Passports>('passports').values.first;
    List<Passport> list = [];
    for (Hurdle hurdle in (box.hurdles ?? [])) {
      if (hurdle.video != null) {
        final passName = box.passports
            ?.where((element) =>
                element.hurdle?.any((element) =>
                    element.hurdle_id == hurdle.hurdle_id &&
                    hurdle.video != null) ??
                false)
            .first
            .passport_name;
        if (passName != null) {
          if (list
                  .where((element) => element.passport_name == passName)
                  .isEmpty ==
              true) {
            list.add(Passport(
                passport_name: passName,
                hurdle: [if (hurdle.video != null) hurdle]));
          } else {
            Passport editedPass =
                list.firstWhere((element) => element.passport_name == passName);
            list.remove(editedPass);
            if (hurdle.video != null) editedPass.hurdle!.add(hurdle);
            list.add(editedPass);
          }
        }
      }
    }
    return list;
  }
}
