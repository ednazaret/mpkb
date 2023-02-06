import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:satefy_cage/ui/ui/info/bloc/info_cubit.dart';
import 'package:satefy_cage/ui/ui/info/uikit/contacts/ui/contacts_screen.dart';
import 'package:satefy_cage/ui/ui/info/uikit/training/ui/training_screen.dart';
import 'package:satefy_cage/ui/uikit/back_button.dart';
import 'package:satefy_cage/utils/colors/colors.dart';
import 'package:satefy_cage/utils/typography/apptypography.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({required this.onBack}) : super(key: null);
  final VoidCallback onBack;

  @override
  State<StatefulWidget> createState() => _InfoScreen();
}

class _InfoScreen extends State<InfoScreen> with TickerProviderStateMixin {
  final InfoCubit cubit = InfoCubit();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.mainBlue,
          body: BlocBuilder<InfoCubit, InfoState>(
              bloc: cubit,
              builder: (context, state) => SafeArea(
                    bottom: state.tabInd != 1 ? true : false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 22,
                                right: 22,
                                bottom: 18,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RawBackButton(onTap: () => widget.onBack()),
                                  Text(
                                    'Информация',
                                    style: AppTypography.boldStyle.copyWith(
                                      fontSize: 26.w,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 38.w,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              color: AppColors.darkBlue,
                              child: TabBar(
                                  controller: tabController,
                                  onTap: (value) =>
                                      cubit.changeTab(index: value),
                                  indicatorColor: AppColors.orange,
                                  indicatorWeight: 3.h,
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.transparent,
                                  ),
                                  labelColor: AppColors.white,
                                  labelStyle:
                                      AppTypography.regularStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                    fontSize: 17.w,
                                  ),
                                  tabs: const [
                                    Tab(
                                      text: 'Обучение',
                                    ),
                                    Tab(
                                      text: 'Контакты',
                                    ),
                                  ]),
                            )
                          ],
                        ),
                        Expanded(
                          child: state.tabInd == 1
                              ? ContactsScreen()
                              : TrainingScreen(),
                        )
                      ],
                    ),
                  )),
        ),
        onWillPop: () async => false);
  }
}
